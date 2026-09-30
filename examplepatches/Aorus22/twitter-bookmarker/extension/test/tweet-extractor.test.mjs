// Tweet extractor tests (XI-05, XI-06, XI-07, XI-12).
//
// Fixtures are fake-DOM tweet articles; every assertion checks that metadata is
// read from the passed container only.

import test from "node:test";
import assert from "node:assert/strict";

import {
  EXTRACTION_ERROR,
  extractTweet,
  getAuthor,
  getCanonicalUrl,
  getMainText,
  getMediaUrls,
  getTweetDate,
  getTweetId,
  getUsername,
  normalizeMediaUrl,
} from "../src/content/tweet-extractor.ts";
import { createTweetDocument } from "./helpers/tweet-fixtures.mjs";

test("plain tweet extracts every field from its container", () => {
  const { article } = createTweetDocument({ text: "Hello world" });
  const result = extractTweet(article);

  assert.equal(result.ok, true);
  assert.deepEqual(result.tweet, {
    url: "https://x.com/ada/status/1234567890",
    author: "Ada Lovelace",
    username: "@ada",
    tweetDate: "2024-05-01T12:34:56.000Z",
    text: "Hello world",
    media: [],
    tweetId: "1234567890",
  });
});

test("individual getters expose the XI-05 surface", () => {
  const { article } = createTweetDocument({ text: "Hi" });
  assert.equal(getTweetId(article), "1234567890");
  assert.equal(getCanonicalUrl(article), "https://x.com/ada/status/1234567890");
  assert.equal(getAuthor(article), "Ada Lovelace");
  assert.equal(getUsername(article), "@ada");
  assert.equal(getTweetDate(article), "2024-05-01T12:34:56.000Z");
  assert.equal(getMainText(article), "Hi");
});

test("comma, emoji, and multiline text survive extraction", () => {
  const text = "First, line 👋\nSecond line — with, commas\nThird line";
  const { article } = createTweetDocument({ text });

  assert.equal(getMainText(article), text);
  const result = extractTweet(article);
  assert.equal(result.ok, true);
  assert.equal(result.tweet.text, text);
});

test("trailing whitespace is trimmed while internal newlines are preserved", () => {
  const { article } = createTweetDocument({ text: "Line one\nLine two   \n" });
  assert.equal(getMainText(article), "Line one\nLine two");
});

test("quoted tweet text is excluded when wrapped in card.wrapper (PRD §29)", () => {
  const { article } = createTweetDocument({ text: "Main text", quoted: "Quoted text" });
  assert.equal(getMainText(article), "Main text");
  assert.equal(extractTweet(article).tweet.text, "Main text");
});

test("quoted tweet text is excluded when wrapped in a role=link card (PRD §29)", () => {
  const { article } = createTweetDocument({
    text: "Main text",
    quoted: "Quoted text",
    quotedStyle: "rolelink",
  });
  assert.equal(getMainText(article), "Main text");
});

test("a media-only tweet extracts with text === '' and is still saveable (PRD §30)", () => {
  const { article } = createTweetDocument({ media: true });
  const result = extractTweet(article);

  assert.equal(result.ok, true);
  assert.equal(result.tweet.text, "");
  assert.equal(getMainText(article), "");
  assert.equal(result.tweet.url, "https://x.com/ada/status/1234567890");
});

test("a tweet whose only text is quoted extracts with text === ''", () => {
  const { article } = createTweetDocument({ quoted: "Quoted only", quotedStyle: "rolelink", media: true });
  const result = extractTweet(article);

  assert.equal(result.ok, true);
  assert.equal(result.tweet.text, "");
});

test("missing username yields a typed failure and no partial record (XI-12)", () => {
  const { article } = createTweetDocument({
    username: null,
    href: "/i/status/1234567890",
    text: "hi",
  });
  assert.deepEqual(extractTweet(article), { ok: false, reason: "missing_username" });
});

test("missing author yields a typed failure", () => {
  const { article } = createTweetDocument({ author: null, text: "hi" });
  assert.deepEqual(extractTweet(article), { ok: false, reason: "missing_author" });
});

test("missing tweet date yields a typed failure", () => {
  const { article } = createTweetDocument({ datetime: null, text: "hi" });
  assert.deepEqual(extractTweet(article), { ok: false, reason: "missing_tweet_date" });
});

test("missing status permalink yields a missing-tweet-id failure", () => {
  const { article } = createTweetDocument({ withStatusLink: false, text: "hi" });
  const result = extractTweet(article);
  assert.equal(result.ok, false);
  assert.equal(result.reason, "missing_tweet_id");
});

test("an invalid datetime string yields a typed failure", () => {
  const { article } = createTweetDocument({ datetime: "not-a-date", text: "hi" });
  assert.deepEqual(extractTweet(article), { ok: false, reason: "missing_tweet_date" });
});

test("EXTRACTION_ERROR is the exact PRD copy (PRD §40)", () => {
  assert.equal(EXTRACTION_ERROR, "Could not read tweet data");
});

test("extraction is container-scoped: two tweets in one document never mix", () => {
  const { doc, article } = createTweetDocument({
    text: "First tweet",
    author: "One",
    username: "@one",
    href: "/one/status/111",
  });

  const other = doc.createElement("article");
  other.setAttribute("data-testid", "tweet");

  const otherText = doc.createElement("div");
  otherText.setAttribute("data-testid", "tweetText");
  otherText.innerText = "Second tweet";

  const otherLink = doc.createElement("a");
  otherLink.setAttribute("href", "/two/status/222");
  const otherTime = doc.createElement("time");
  otherTime.setAttribute("datetime", "2020-01-01T00:00:00.000Z");
  otherLink.appendChild(otherTime);

  const otherName = doc.createElement("div");
  otherName.setAttribute("data-testid", "User-Name");
  const otherNameText = doc.createElement("span");
  otherNameText.textContent = "Two @two";
  otherName.appendChild(otherNameText);

  const otherGroup = doc.createElement("div");
  otherGroup.setAttribute("role", "group");
  otherGroup.appendChild(doc.createElement("div"));

  other.append(otherText, otherLink, otherName, otherGroup);
  doc.body.appendChild(other);

  assert.equal(extractTweet(article).tweet.text, "First tweet");
  assert.equal(getTweetId(article), "111");
  assert.equal(getUsername(article), "@one");
  assert.equal(extractTweet(other).tweet.text, "Second tweet");
  assert.equal(getTweetId(other), "222");
  assert.equal(getUsername(other), "@two");
  assert.equal(getAuthor(other), "Two");
});

test("the quoted tweet's permalink never becomes the parent tweet url", () => {
  const { article } = createTweetDocument({
    text: "Main",
    quoted: "Quoted",
    quotedStyle: "rolelink",
  });
  assert.equal(getTweetId(article), "1234567890");
  assert.equal(getCanonicalUrl(article), "https://x.com/ada/status/1234567890");
});

/* -------------------------------------------------------------------------- */
/* Media URLs (PRD §14)                                                      */
/* -------------------------------------------------------------------------- */

test("a media-only tweet yields its photo url and no text (PRD §14, §30)", () => {
  const { article } = createTweetDocument({ media: true });
  const result = extractTweet(article);

  assert.equal(result.ok, true);
  assert.equal(result.tweet.text, "");
  assert.deepEqual(result.tweet.media, ["https://pbs.twimg.com/media/example.jpg"]);
  assert.deepEqual(getMediaUrls(article), ["https://pbs.twimg.com/media/example.jpg"]);
});

test("four photos keep their DOM order and the sizing query is stripped", () => {
  const { article } = createTweetDocument({
    text: "art",
    media: [
      "https://pbs.twimg.com/media/AAA?format=jpg&name=small",
      "https://pbs.twimg.com/media/BBB?format=jpg&name=900x900",
      "https://pbs.twimg.com/media/CCC.jpg",
      "https://pbs.twimg.com/media/DDD?format=png&name=large",
    ],
  });

  assert.deepEqual(getMediaUrls(article), [
    "https://pbs.twimg.com/media/AAA.jpg",
    "https://pbs.twimg.com/media/BBB.jpg",
    "https://pbs.twimg.com/media/CCC.jpg",
    "https://pbs.twimg.com/media/DDD.png",
  ]);
  assert.deepEqual(extractTweet(article).tweet.media, getMediaUrls(article));
});

test("a repeated photo is stored once", () => {
  const { article } = createTweetDocument({
    text: "dup",
    media: [
      "https://pbs.twimg.com/media/AAA.jpg",
      "https://pbs.twimg.com/media/AAA.jpg",
      "https://pbs.twimg.com/media/AAA?format=jpg&name=small",
    ],
  });
  assert.deepEqual(getMediaUrls(article), ["https://pbs.twimg.com/media/AAA.jpg"]);
});

test("a video contributes its poster frame, never the blob playback url", () => {
  const { article } = createTweetDocument({
    text: "clip",
    media: { videoPoster: "https://pbs.twimg.com/amplify_video_thumb/123/img/hash.jpg" },
  });
  assert.deepEqual(getMediaUrls(article), ["https://pbs.twimg.com/amplify_video_thumb/123/img/hash.jpg"]);
});

test("the quoted tweet's media is excluded (PRD §14, §29)", () => {
  const { article } = createTweetDocument({
    text: "Main",
    quoted: "Quoted",
    quotedStyle: "rolelink",
    quotedMedia: ["https://pbs.twimg.com/media/QUOTED.jpg"],
  });
  assert.deepEqual(getMediaUrls(article), []);
  assert.deepEqual(extractTweet(article).tweet.media, []);
});

test("a tweet without media yields [] rather than failing", () => {
  const { article } = createTweetDocument({ text: "no media here" });
  const result = extractTweet(article);
  assert.equal(result.ok, true);
  assert.deepEqual(result.tweet.media, []);
});

test("normalizeMediaUrl rejects everything that is not tweet media", () => {
  const rejects = [
    "",
    "   ",
    "not a url",
    "http://pbs.twimg.com/media/AAA.jpg",
    "https://example.com/media/AAA.jpg",
    "https://pbs.twimg.com/card_img/123/abc.jpg",
    "https://pbs.twimg.com/profile_images/1/avatar.jpg",
    "https://pbs.twimg.com/profile_banner/1/banner.jpg",
    "blob:https://x.com/8f14e45f",
    "https://pbs.twimg.com/",
  ];
  for (const raw of rejects) {
    assert.equal(normalizeMediaUrl(raw), "", `expected ${JSON.stringify(raw)} to be rejected`);
  }

  assert.equal(normalizeMediaUrl("https://pbs.twimg.com/media/AAA.jpg"), "https://pbs.twimg.com/media/AAA.jpg");
  assert.equal(
    normalizeMediaUrl("  https://pbs.twimg.com/media/AAA?format=webp&name=small  "),
    "https://pbs.twimg.com/media/AAA.webp",
  );
  assert.equal(
    normalizeMediaUrl("https://pbs.twimg.com/media/AAA?name=large"),
    "https://pbs.twimg.com/media/AAA",
  );
});
