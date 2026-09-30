// Tweet-shaped fake DOM fixtures for the extractor/injector tests.
//
// The structure mirrors the real X article closely enough to exercise the
// selector cascades: a `[data-testid="tweetText"]` block, a `[data-testid="User-Name"]`
// header, a `time[datetime]` inside a `/status/` permalink, a quoted card, and a
// `div[role="group"]` action bar holding the native bookmark control.

import { createDocument } from "./fake-dom.mjs";

/**
 * Build one tweet article inside an existing document.
 *
 * @returns {{ article: object, actionBar: object, content: object }}
 */
export function appendTweet(doc, options = {}) {
  const article = doc.createElement("article");
  article.setAttribute("data-testid", "tweet");
  article.setAttribute("role", "article");
  doc.body.appendChild(article);

  const content = doc.createElement("div");
  article.appendChild(content);

  // --- author header --------------------------------------------------------
  if (options.withUserName !== false) {
    const userName = doc.createElement("div");
    userName.setAttribute("data-testid", "User-Name");
    if (options.author !== null) {
      const name = doc.createElement("span");
      name.textContent = options.author ?? "Ada Lovelace";
      userName.appendChild(name);
    }
    if (options.username !== null) {
      const handle = doc.createElement("span");
      handle.textContent = options.username ?? "@ada";
      userName.appendChild(handle);
    }
    content.appendChild(userName);
  }

  // --- permalink with the tweet timestamp -----------------------------------
  if (options.withStatusLink !== false) {
    const link = doc.createElement("a");
    link.setAttribute("href", options.href ?? "/ada/status/1234567890");
    const time = doc.createElement("time");
    if (options.datetime !== null) {
      time.setAttribute("datetime", options.datetime ?? "2024-05-01T12:34:56.000Z");
    }
    link.appendChild(time);
    content.appendChild(link);
  }

  // --- main text (absent for media-only tweets) -----------------------------
  if (typeof options.text === "string") {
    const text = doc.createElement("div");
    text.setAttribute("data-testid", "tweetText");
    text.innerText = options.text;
    content.appendChild(text);
  }

  if (options.media) {
    appendMedia(content, doc, options.media);
  }

  // --- quoted tweet ---------------------------------------------------------
  if (typeof options.quoted === "string") {
    const wrapper = doc.createElement("div");
    wrapper.setAttribute("data-testid", "card.wrapper");

    if (options.quotedStyle === "rolelink") {
      const roleLink = doc.createElement("div");
      roleLink.setAttribute("role", "link");

      const quotedName = doc.createElement("div");
      quotedName.setAttribute("data-testid", "User-Name");
      quotedName.textContent = "@quoted";

      const quotedLink = doc.createElement("a");
      quotedLink.setAttribute("href", "/quoted/status/9999999999");
      const quotedTime = doc.createElement("time");
      quotedTime.setAttribute("datetime", "2024-01-01T00:00:00.000Z");
      quotedLink.appendChild(quotedTime);

      const quotedText = doc.createElement("div");
      quotedText.setAttribute("data-testid", "tweetText");
      quotedText.innerText = options.quoted;

      roleLink.append(quotedName, quotedLink, quotedText);
      wrapper.appendChild(roleLink);
    } else {
      const quotedText = doc.createElement("div");
      quotedText.setAttribute("data-testid", "tweetText");
      quotedText.innerText = options.quoted;
      wrapper.appendChild(quotedText);
    }

    if (options.quotedMedia) {
      appendMedia(wrapper, doc, options.quotedMedia);
    }

    content.appendChild(wrapper);
  }

  // --- native action bar ----------------------------------------------------
  const actionBar = doc.createElement("div");
  actionBar.setAttribute("role", "group");

  const bookmark = doc.createElement("div");
  bookmark.setAttribute("data-testid", options.alreadyBookmarked ? "removeBookmark" : "bookmark");
  actionBar.appendChild(bookmark);

  content.appendChild(actionBar);

  return { article, actionBar, content };
}

/** Build one tweet article inside a fresh document. */
export function createTweetDocument(options = {}) {
  const doc = createDocument();
  const { article, actionBar, content } = appendTweet(doc, options);
  return { doc, article, actionBar, content };
}

/**
 * Append media markup to `parent` in X's real shape.
 *
 * `media` accepts:
 *   - `true`                 → one photo at the default URL (legacy fixtures);
 *   - `string[]`             → one `[data-testid="tweetPhoto"]` per URL;
 *   - `{ photos, videoPoster }` → photos plus a `videoPlayer` with that poster.
 */
function appendMedia(parent, doc, media) {
  const photos =
    media === true
      ? ["https://pbs.twimg.com/media/example.jpg"]
      : Array.isArray(media)
        ? media
        : (media.photos ?? []);

  for (const src of photos) {
    const container = doc.createElement("div");
    container.setAttribute("data-testid", "tweetPhoto");
    const image = doc.createElement("img");
    image.setAttribute("src", src);
    container.appendChild(image);
    parent.appendChild(container);
  }

  const poster = media !== true && !Array.isArray(media) && media !== null ? media.videoPoster : undefined;
  if (typeof poster === "string") {
    const player = doc.createElement("div");
    player.setAttribute("data-testid", "videoPlayer");
    const video = doc.createElement("video");
    // X exposes only a blob URL for playback; only the poster is storeable.
    video.setAttribute("src", "blob:https://x.com/8f14e45f");
    video.setAttribute("poster", poster);
    player.appendChild(video);
    parent.appendChild(player);
  }
}

/** A plain, fully-populated quote-free tweet. */
export function createPlainTweet(overrides = {}) {
  return createTweetDocument({ text: "Hello world", ...overrides });
}

/** A store shaped like `chrome.storage.local`'s payload. */
export function makeStore(categories, displayMode = "inline") {
  return {
    version: 1,
    settings: { unbookmarkAfterSave: false, displayMode },
    categories,
  };
}

/** Two categories in a deliberately non-array order, for order assertions. */
export function sampleCategories() {
  return [
    { id: "cat-linux", name: "Linux", slug: "linux", color: "#10b981", order: 1 },
    { id: "cat-ai", name: "AI", slug: "ai", color: "#4f46e5", order: 0 },
  ];
}
