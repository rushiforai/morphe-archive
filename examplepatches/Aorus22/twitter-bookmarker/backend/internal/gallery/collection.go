package gallery

import (
	"sort"
	"strings"
	"time"

	"twitter-bookmarker/internal/model"
)

// displayName resolves the name to show for a collection.
//
// The database stores the name the extension sent, which is what the user
// actually typed. A blank one — only reachable through a hand-edited row — falls
// back to a name derived from the slug rather than rendering an empty card.
func displayName(slug, stored string) string {
	if name := strings.TrimSpace(stored); name != "" {
		return name
	}
	return model.DeriveName(slug)
}

// collectionSummary is a Collection plus the parsed maximum saved_at used for
// ordering. Keeping the timestamp out of the exported type leaves Collection a
// plain value type.
type collectionSummary struct {
	collection Collection
	lastSaved  time.Time
	hasLast    bool
}

// summarize computes the GAL-04 fields for one collection.
func summarize(slug, name string, rows []parsedRow) collectionSummary {
	summary := collectionSummary{
		collection: Collection{
			Slug:       slug,
			Name:       displayName(slug, name),
			PostCount:  len(rows),
			CoverMedia: []string{},
		},
	}

	for _, row := range rows {
		summary.collection.MediaCount += len(row.post.Media)
		if !summary.hasLast || row.savedTime.After(summary.lastSaved) {
			summary.lastSaved = row.savedTime
			summary.hasLast = true
		}
	}
	if summary.hasLast {
		stamp := summary.lastSaved.UTC().Format(time.RFC3339)
		summary.collection.LastSavedAt = &stamp
	}

	// Cover media: walk the rows newest-saved first and flatten their media
	// arrays until CoverMediaLimit URLs are collected (PRD-2 §17/§39).
	if len(rows) > 0 {
		newest := make([]parsedRow, len(rows))
		copy(newest, rows)
		sort.SliceStable(newest, func(i, j int) bool {
			a := keyOf(newest[i], SortSavedDesc)
			b := keyOf(newest[j], SortSavedDesc)
			return cmpKeys(a, b, SortSavedDesc) < 0
		})
		for _, row := range newest {
			for _, media := range row.post.Media {
				if len(summary.collection.CoverMedia) >= CoverMediaLimit {
					break
				}
				summary.collection.CoverMedia = append(summary.collection.CoverMedia, media)
			}
			if len(summary.collection.CoverMedia) >= CoverMediaLimit {
				break
			}
		}
	}

	return summary
}

// sortSummaries orders collections by last_saved_at DESC with timestamp-less
// collections last; the slug is the deterministic tie-break (GAL-03).
func sortSummaries(summaries []collectionSummary) {
	sort.SliceStable(summaries, func(i, j int) bool {
		a, b := summaries[i], summaries[j]
		switch {
		case !a.hasLast && !b.hasLast:
			return a.collection.Slug < b.collection.Slug
		case !a.hasLast:
			return false
		case !b.hasLast:
			return true
		}
		if a.lastSaved.Equal(b.lastSaved) {
			return a.collection.Slug < b.collection.Slug
		}
		return a.lastSaved.After(b.lastSaved)
	})
}
