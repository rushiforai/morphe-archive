/**
 * Shared domain types for the Twitter Bookmarker extension.
 *
 * The extension is the sole owner of category configuration and settings; the
 * backend only ever receives a `slug`, the category's display name, and tweet
 * metadata (PRD §4.3, §16).
 */

/** How category controls are rendered on an X bookmark tweet (PRD §32, §33). */
export type DisplayMode = "popover" | "inline";

/**
 * Which backend the extension talks to (PRD §5, §50).
 *
 * - `localhost` uses the fixed loopback default (`DEFAULT_BACKEND_BASE_URL`);
 * - `custom` uses the user-saved `Settings.backendUrl`.
 */
export type BackendMode = "localhost" | "custom";

/** A user-defined bookmark category, persisted in `chrome.storage.local` (PRD §7). */
export interface Category {
  /** Stable internal identifier; never changes across renames. */
  id: string;
  /** Human-readable name, e.g. "AI & LLM". Sent to the backend on every save. */
  name: string;
  /** Derived collection slug, e.g. "ai-llm". Recomputed only on rename. */
  slug: string;
  /** UI-only colour (hex). Never sent to the backend. */
  color: string;
  /** Position, always normalized to 0..n-1 in storage order. */
  order: number;
}

/** Persisted extension settings (PRD §50). */
export interface Settings {
  /** When true, remove the tweet from X Bookmarks after a confirmed save. */
  unbookmarkAfterSave: boolean;
  /** How category controls are rendered on the X bookmarks page. */
  displayMode: DisplayMode;
  /** Which backend address the worker and the popup use. */
  backendMode: BackendMode;
  /**
   * The saved base URL used when `backendMode` is `custom` (e.g.
   * `http://192.168.1.10:43121` or `https://server.example/tw-bookmarker`):
   * a normalized http(s) origin plus an optional base path. A missing or
   * unparseable value falls back to the loopback default.
   */
  backendUrl: string;
  /**
   * Bearer token sent with every request while `backendMode` is `custom`, e.g.
   * the backend's `TWITTER_BOOKMARKER_TOKEN`. Empty means no `Authorization`
   * header is sent, which is all the loopback default ever needs: a request from
   * this machine is never challenged. It is ignored in `localhost` mode.
   */
  backendToken: string;
}

/** The whole `chrome.storage.local` payload, under a single documented key. */
export interface Store {
  version: 2;
  settings: Settings;
  categories: Category[];
}

/** Metadata extracted from a single tweet container by the Phase 3 content script (PRD §28). */
export interface ExtractedTweet {
  /** Absolute tweet URL (canonicalized by the backend). */
  url: string;
  /** Display name of the author. */
  author: string;
  /** Handle including the leading "@". */
  username: string;
  /** Original tweet time as ISO 8601 UTC. */
  tweetDate: string;
  /** Main tweet text only; empty for media-only tweets. */
  text: string;
  /** Canonical media URLs of the main tweet; `[]` when it has none (PRD §14). */
  media: string[];
  /** X status ID, used as the global duplicate key. */
  tweetId: string;
}

/** Wire format of the tweet object accepted by `POST /v1/bookmarks` (PRD §19). */
export interface SaveTweetPayload {
  url: string;
  media: string[];
  author: string;
  username: string;
  tweet_date: string;
  text: string;
}

/** Request body for `POST /v1/bookmarks`. */
export interface SaveRequest {
  slug: string;
  /**
   * Human display name for the collection, so the gallery shows what the user
   * typed rather than a name derived from the slug. Optional on the wire: the
   * backend derives one when it is missing or empty.
   */
  name: string;
  tweet: SaveTweetPayload;
}

/** Successful (201) response body from `POST /v1/bookmarks`. */
export interface SaveResult {
  status: "saved";
  tweet_id: string;
  url: string;
  slug: string;
  saved_at: string;
}

/** 409 response body for an already-saved tweet. */
export interface DuplicateResult {
  status: "duplicate";
  tweet_id: string;
}

/** One entry of `GET /v1/index` (PRD §18). */
export interface SavedIndexEntry {
  url: string;
  slug: string;
  saved_at: string;
}

/** Body of `GET /v1/index`. */
export interface SavedIndex {
  items: Record<string, SavedIndexEntry>;
}

/** Body of `GET /health`. */
export interface HealthResponse {
  status: string;
}
