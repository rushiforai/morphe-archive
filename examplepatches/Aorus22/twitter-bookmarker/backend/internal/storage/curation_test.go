package storage_test

import (
	"errors"
	"strings"
	"testing"
	"time"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/storage"
)

// openRW opens the same database the Store wrote, so a test can change the schema
// underneath it (a trigger, a cascading delete). It uses config.DBPath rather than
// a literal name, because a wrong path would silently create a *second* database
// and the test would then be exercising nothing.
func openRW(t *testing.T, dir string, exec ...string) {
	t.Helper()
	conn, err := db.OpenRW(config.DBPath(dir))
	if err != nil {
		t.Fatalf("open database read-write: %v", err)
	}
	for _, stmt := range exec {
		dbtest.MustExec(t, conn, stmt)
	}
	if err := conn.Close(); err != nil {
		t.Fatalf("close database: %v", err)
	}
}

// --- delete ---------------------------------------------------------------

// trashRows counts the rows in the trash, read from disk.
func trashRows(t *testing.T, dir string) int {
	t.Helper()
	return dbtest.Count(t, openRO(t, dir), `SELECT count(*) FROM deleted_bookmarks`)
}

// TestDeleteMovesTheBookmarkToTheTrash is the core promise of the curation
// feature: deleting takes a row out of the live set *without destroying it*.
//
// The whole row has to arrive in the trash — not just the id — because that is
// what makes restoring it later a plain INSERT ... SELECT with no reconstruction
// and no guessing.
func TestDeleteMovesTheBookmarkToTheTrash(t *testing.T) {
	store, dir := newTestStore(t)

	url := "https://x.com/testauthor/status/111"
	if _, err := store.Save(saveReq("linux", url, "keep me")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}
	if err := store.Delete("111"); err != nil {
		t.Fatalf("Delete() error = %v", err)
	}

	if got := totalBookmarks(t, dir); got != 0 {
		t.Errorf("bookmarks after delete = %d, want 0", got)
	}
	if got := trashRows(t, dir); got != 1 {
		t.Fatalf("deleted_bookmarks after delete = %d, want 1", got)
	}

	conn := openRO(t, dir)
	var (
		tweetID, gotURL, author, username, text, media, deletedAt string
		collectionID                                              int64
	)
	err := conn.QueryRow(
		`SELECT d.tweet_id, d.collection_id, d.url, d.author, d.username, d.text, d.media, d.deleted_at
		   FROM deleted_bookmarks d`,
	).Scan(&tweetID, &collectionID, &gotURL, &author, &username, &text, &media, &deletedAt)
	if err != nil {
		t.Fatalf("read the trash row: %v", err)
	}

	if tweetID != "111" {
		t.Errorf("trashed tweet_id = %q, want 111", tweetID)
	}
	if gotURL != url {
		t.Errorf("trashed url = %q, want %q", gotURL, url)
	}
	if author != "Test Author" || username != "@testauthor" || text != "keep me" {
		t.Errorf("trashed row lost fields: author=%q username=%q text=%q", author, username, text)
	}
	if media != "[]" {
		t.Errorf("trashed media = %q, want the stored JSON", media)
	}
	// The collection must still be resolvable: the trash copies the id, and the
	// folder itself is untouched.
	var slug string
	if err := conn.QueryRow(`SELECT slug FROM collections WHERE id = ?`, collectionID).Scan(&slug); err != nil {
		t.Fatalf("the trashed row points at a collection that no longer exists: %v", err)
	}
	if slug != "linux" {
		t.Errorf("trashed collection = %q, want linux", slug)
	}

	if _, err := time.Parse(time.RFC3339, deletedAt); err != nil {
		t.Errorf("deleted_at = %q, want RFC3339: %v", deletedAt, err)
	}
}

// TestDeleteLeavesEverythingElseAlone proves the delete is scoped: the other
// bookmark and the folder both survive.
func TestDeleteLeavesEverythingElseAlone(t *testing.T) {
	store, dir := newTestStore(t)

	for _, id := range []string{"111", "222"} {
		if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/"+id, "t"+id)); err != nil {
			t.Fatalf("Save(%s) error = %v", id, err)
		}
	}
	if err := store.Delete("111"); err != nil {
		t.Fatalf("Delete() error = %v", err)
	}

	if got := bookmarkCount(t, dir, "linux"); got != 1 {
		t.Errorf("bookmarks in linux = %d, want 1", got)
	}
	if got := collectionCount(t, dir); got != 1 {
		t.Errorf("collections = %d, want the folder to survive deleting one of its posts", got)
	}
	if got := dbtest.Text(t, openRO(t, dir), `SELECT tweet_id FROM bookmarks`); got != "222" {
		t.Errorf("surviving bookmark = %q, want 222", got)
	}
}

// TestDeleteUnknownTweetIsNotFound proves the caller learns nothing happened. A
// silent success would tell the web UI to drop a row that was never there.
func TestDeleteUnknownTweetIsNotFound(t *testing.T) {
	store, _ := newTestStore(t)

	err := store.Delete("999")
	if !errors.Is(err, storage.ErrNotFound) {
		t.Fatalf("Delete() error = %v, want storage.ErrNotFound", err)
	}
}

// TestDeleteTwiceIsNotFound pins the second delete as a 404 rather than a
// success: after the first call the tweet is in the trash, not the live set, so
// there is nothing left to delete.
func TestDeleteTwiceIsNotFound(t *testing.T) {
	store, dir := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "x")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}
	if err := store.Delete("111"); err != nil {
		t.Fatalf("first Delete() error = %v", err)
	}

	err := store.Delete("111")
	if !errors.Is(err, storage.ErrNotFound) {
		t.Fatalf("second Delete() error = %v, want storage.ErrNotFound", err)
	}
	// The second attempt must not have written a second trash row.
	if got := trashRows(t, dir); got != 1 {
		t.Errorf("deleted_bookmarks = %d, want 1 — the refused delete still wrote", got)
	}
}

// TestDeleteWithAnEmptyTweetIDIsValidation proves the guard runs before the
// database is touched.
func TestDeleteWithAnEmptyTweetIDIsValidation(t *testing.T) {
	store, _ := newTestStore(t)

	for _, id := range []string{"", "   "} {
		err := store.Delete(id)
		var validation *storage.ValidationError
		if !errors.As(err, &validation) {
			t.Fatalf("Delete(%q) error = %v, want *storage.ValidationError", id, err)
		}
	}
}

// TestSaveAfterDeleteSucceedsAgain proves the trash does not claim the id: a
// tweet the user deleted can be saved again from X, and it comes back live.
func TestSaveAfterDeleteSucceedsAgain(t *testing.T) {
	store, dir := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "first")); err != nil {
		t.Fatalf("first Save() error = %v", err)
	}
	if err := store.Delete("111"); err != nil {
		t.Fatalf("Delete() error = %v", err)
	}

	// The exact case that must not regress into a 409: the id is free again.
	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "second")); err != nil {
		t.Fatalf("Save() after delete error = %v, want success", err)
	}

	if got := totalBookmarks(t, dir); got != 1 {
		t.Errorf("bookmarks = %d, want 1", got)
	}
	// The trash keeps the original event: it is a log, not a claim on the id.
	if got := trashRows(t, dir); got != 1 {
		t.Errorf("deleted_bookmarks = %d, want the first deletion to stay recorded", got)
	}
	if got := dbtest.Text(t, openRO(t, dir), `SELECT text FROM bookmarks WHERE tweet_id = '111'`); got != "second" {
		t.Errorf("live text = %q, want the new save to win", got)
	}
}

// TestDeleteIsAtomic proves a failure halfway through leaves the database exactly
// as it was: the bookmark is still live and the trash is still empty.
//
// The trigger makes the archive INSERT fail, which is the interesting failure:
// the row was already copied and only the DELETE remained.
func TestDeleteIsAtomic(t *testing.T) {
	store, dir := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "x")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}

	openRW(t, dir, `
		CREATE TRIGGER boom BEFORE INSERT ON deleted_bookmarks
		BEGIN SELECT RAISE(ABORT, 'injected write failure'); END`)

	err := store.Delete("111")
	if err == nil {
		t.Fatal("Delete() succeeded despite the injected write failure")
	}
	// Assert the *reason*, so a passing test can never be the result of an
	// unrelated failure (or of the trigger never having been installed).
	if !strings.Contains(err.Error(), "injected write failure") {
		t.Fatalf("Delete() error = %v, want the injected trigger failure", err)
	}

	if got := totalBookmarks(t, dir); got != 1 {
		t.Errorf("bookmarks after the failed delete = %d, want 1 (rolled back)", got)
	}
	if got := trashRows(t, dir); got != 0 {
		t.Errorf("deleted_bookmarks after the failed delete = %d, want 0", got)
	}
}

// TestTrashSurvivesItsCollectionBeingDeleted proves the missing foreign key is
// deliberate. With ON DELETE CASCADE a deleted folder would silently empty the
// trash, which is the opposite of what a recoverable delete is for.
func TestTrashSurvivesItsCollectionBeingDeleted(t *testing.T) {
	store, dir := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "x")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}
	if err := store.Delete("111"); err != nil {
		t.Fatalf("Delete() error = %v", err)
	}

	openRW(t, dir, `DELETE FROM collections WHERE slug = 'linux'`)

	if got := trashRows(t, dir); got != 1 {
		t.Errorf("deleted_bookmarks after dropping the folder = %d, want 1", got)
	}
}

// --- reassign -------------------------------------------------------------

// TestReassignMovesTheBookmark proves a move changes which folder owns the row
// and nothing else about it.
func TestReassignMovesTheBookmark(t *testing.T) {
	store, dir := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "carry me")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}
	if _, err := store.Save(saveReq("ai", "https://x.com/testauthor/status/222", "other")); err != nil {
		t.Fatalf("Save(ai) error = %v", err)
	}

	if err := store.Reassign("111", "ai"); err != nil {
		t.Fatalf("Reassign() error = %v", err)
	}

	if got := bookmarkCount(t, dir, "linux"); got != 0 {
		t.Errorf("bookmarks left in linux = %d, want 0", got)
	}
	if got := bookmarkCount(t, dir, "ai"); got != 2 {
		t.Errorf("bookmarks in ai = %d, want 2", got)
	}
	if got := trashRows(t, dir); got != 0 {
		t.Errorf("deleted_bookmarks = %d, want a move to touch nothing but collection_id", got)
	}
	if got := dbtest.Text(t, openRO(t, dir), `SELECT text FROM bookmarks WHERE tweet_id = '111'`); got != "carry me" {
		t.Errorf("text after the move = %q, want it unchanged", got)
	}
	// Both folders must still exist: a move never creates or removes one.
	if got := collectionCount(t, dir); got != 2 {
		t.Errorf("collections = %d, want 2", got)
	}
}

// TestReassignToTheSameCollectionIsANoOp proves an accidental re-pick is not an
// error. SQLite counts a matched row as changed, so this succeeds rather than
// reporting a phantom not-found.
func TestReassignToTheSameCollectionIsANoOp(t *testing.T) {
	store, dir := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "x")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}
	if err := store.Reassign("111", "linux"); err != nil {
		t.Fatalf("Reassign() to the same folder error = %v, want success", err)
	}
	if got := bookmarkCount(t, dir, "linux"); got != 1 {
		t.Errorf("bookmarks in linux = %d, want 1", got)
	}
}

// TestReassignToAnUnknownCollectionIsNotFound proves the web layer cannot invent
// a folder. The extension owns display names, so an unknown slug is a stale
// picker, not a request to create "some-slug" as a folder name.
func TestReassignToAnUnknownCollectionIsNotFound(t *testing.T) {
	store, dir := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "x")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}

	err := store.Reassign("111", "no-such-folder")
	if !errors.Is(err, storage.ErrCollectionNotFound) {
		t.Fatalf("Reassign() error = %v, want storage.ErrCollectionNotFound", err)
	}
	// Nothing was created and nothing moved.
	if got := collectionCount(t, dir); got != 1 {
		t.Errorf("collections = %d, want the refused move to create nothing", got)
	}
	if got := bookmarkCount(t, dir, "linux"); got != 1 {
		t.Errorf("bookmarks in linux = %d, want 1", got)
	}
}

// TestReassignUnknownTweetIsNotFound proves a move of a tweet that is not saved
// (or was deleted) reports not-found rather than silently succeeding.
func TestReassignUnknownTweetIsNotFound(t *testing.T) {
	store, _ := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "x")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}
	if err := store.Delete("111"); err != nil {
		t.Fatalf("Delete() error = %v", err)
	}

	err := store.Reassign("111", "linux")
	if !errors.Is(err, storage.ErrNotFound) {
		t.Fatalf("Reassign() error = %v, want storage.ErrNotFound", err)
	}
}

// TestReassignRejectsAnInvalidSlug proves the slug guard runs before the
// database is touched.
func TestReassignRejectsAnInvalidSlug(t *testing.T) {
	store, _ := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "x")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}

	for _, slug := range []string{"../evil", "", "Has Space", "-leading"} {
		err := store.Reassign("111", slug)
		var validation *storage.ValidationError
		if !errors.As(err, &validation) {
			t.Errorf("Reassign(%q) error = %v, want *storage.ValidationError", slug, err)
		}
	}
}

// TestReassignWithAnEmptyTweetIDIsValidation covers the other path parameter.
func TestReassignWithAnEmptyTweetIDIsValidation(t *testing.T) {
	store, _ := newTestStore(t)

	if _, err := store.Save(saveReq("linux", "https://x.com/testauthor/status/111", "x")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}

	err := store.Reassign("", "linux")
	var validation *storage.ValidationError
	if !errors.As(err, &validation) {
		t.Fatalf("Reassign(\"\") error = %v, want *storage.ValidationError", err)
	}
}
