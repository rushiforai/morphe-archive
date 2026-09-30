// Organizer UI tests (XI-08, XI-09, XI-10, XI-11) against the fake DOM.
//
// Covers placement in the action area, idempotent injection, popover open/close
// semantics, inline order/colour, the saved state, and live rerender.

import test from "node:test";
import assert from "node:assert/strict";

import {
  injectOrganizer,
  removeAllOrganizers,
  removeOrganizer,
  rerenderAll,
  setSaved,
  setSaving,
} from "../src/content/ui-injector.ts";
import { closeStalePopover, isPopoverOpen } from "../src/content/organizer.ts";
import { createEvent } from "./helpers/fake-dom.mjs";
import { createTweetDocument, sampleCategories } from "./helpers/tweet-fixtures.mjs";

const SETTINGS = { unbookmarkAfterSave: false, displayMode: "popover" };

function makeCallbacks({ savedIds = new Set(), onSelect = () => {} } = {}) {
  return {
    isSaved: (tweetId) => savedIds.has(tweetId),
    onSelect,
  };
}

function inject(article, overrides = {}) {
  return injectOrganizer({
    article,
    tweetId: "1234567890",
    categories: sampleCategories(),
    displayMode: "popover",
    saved: false,
    callbacks: makeCallbacks(),
    ...overrides,
  });
}

const rootsIn = (scope) => scope.querySelectorAll("[data-twitter-bookmarker-root]");

test("controls render on their own row directly above the action area (XI-08)", () => {
  const { article, actionBar } = createTweetDocument({ text: "hi" });
  const root = inject(article);

  assert.ok(root, "a root is created");
  assert.equal(actionBar.getAttribute("role"), "group");
  assert.equal(rootsIn(article).length, 1);
  // Not inside the native action bar: the organizer must not share its row.
  assert.equal(actionBar.querySelector("[data-twitter-bookmarker-root]"), null);
  // Its own row: an immediate previous sibling of the action bar.
  assert.equal(root.nextElementSibling, actionBar);
  assert.equal(root.parentElement, actionBar.parentElement);
  assert.notEqual(root.parentElement, article);
});

test("a nested action-bar wrapper is climbed, keeping the organizer on its own row", () => {
  const { doc, article, actionBar, content } = createTweetDocument({ text: "hi" });
  // X wraps the native group in its own layout row.
  const actionRow = doc.createElement("div");
  content.appendChild(actionRow);
  actionRow.appendChild(actionBar);

  const root = inject(article);

  assert.ok(root, "a root is created");
  assert.equal(actionBar.querySelector("[data-twitter-bookmarker-root]"), null);
  assert.equal(root.nextElementSibling, actionRow, "inserted above the whole action-bar row");
  assert.equal(root.parentElement, content, "stays inside the tweet's content column");
  assert.equal(rootsIn(article).length, 1);
});

test("injection is idempotent: a second call updates in place (XI-04)", () => {
  const { article } = createTweetDocument({ text: "hi" });
  const first = inject(article);
  const second = inject(article);

  assert.equal(second, first, "same root element is reused");
  assert.equal(rootsIn(article).length, 1);
  assert.equal(article.querySelectorAll("[data-twitter-bookmarker-trigger]").length, 1);
});

test("zero categories and not saved renders no root", () => {
  const { article } = createTweetDocument({ text: "hi" });
  const root = inject(article, { categories: [] });
  assert.equal(root, null);
  assert.equal(rootsIn(article).length, 0);
});

test("saved tweet renders exactly ✓ Saved with no category controls or names (XI-11)", () => {
  const { article } = createTweetDocument({ text: "hi" });
  const root = inject(article, { saved: true });

  const saved = root.querySelector("[data-twitter-bookmarker-saved]");
  assert.ok(saved);
  assert.equal(saved.textContent, "✓ Saved");
  assert.equal(saved.getAttribute("aria-live"), "polite");
  assert.equal(root.querySelector("[data-twitter-bookmarker-trigger]"), null);
  assert.equal(root.querySelectorAll("[data-category-id]").length, 0);
  assert.ok(!root.textContent.includes("AI"));
  assert.ok(!root.textContent.includes("Linux"));
});

test("a saved tweet with zero categories still shows ✓ Saved", () => {
  const { article } = createTweetDocument({ text: "hi" });
  const root = inject(article, { saved: true, categories: [] });
  assert.ok(root);
  assert.ok(root.querySelector("[data-twitter-bookmarker-saved]"));
});

test("popover mode: single trigger, ordered panel, visible colours (XI-09)", () => {
  const { article } = createTweetDocument({ text: "hi" });
  const root = inject(article);

  assert.equal(root.querySelectorAll("[data-twitter-bookmarker-trigger]").length, 1);
  const panel = root.querySelector("[data-twitter-bookmarker-panel]");
  assert.ok(panel);
  assert.equal(panel.hidden, true, "panel starts closed");

  const buttons = panel.querySelectorAll("[data-category-id]");
  assert.deepEqual(
    buttons.map((button) => button.getAttribute("data-category-id")),
    ["cat-ai", "cat-linux"],
    "order follows category.order (AI=0 before Linux=1)",
  );
  assert.deepEqual(
    buttons.map((button) => button.querySelector("[data-twitter-bookmarker-color]").getAttribute("data-twitter-bookmarker-color")),
    ["#4f46e5", "#10b981"],
  );
  assert.deepEqual(
    buttons.map((button) => button.querySelector("[data-twitter-bookmarker-color]").style.backgroundColor),
    ["#4f46e5", "#10b981"],
    "colour is a visible style, not just an attribute",
  );
  assert.deepEqual(
    buttons.map((button) => button.querySelector(".twb-category-name").textContent),
    ["AI", "Linux"],
  );
});

test("inline mode renders every category in order with colour (XI-10)", () => {
  const { article } = createTweetDocument({ text: "hi" });
  const root = inject(article, { displayMode: "inline" });

  assert.equal(root.querySelector("[data-twitter-bookmarker-trigger]"), null);
  assert.equal(root.querySelector("[data-twitter-bookmarker-panel]"), null);
  const buttons = root.querySelectorAll("[data-category-id]");
  assert.deepEqual(
    buttons.map((button) => button.getAttribute("data-category-id")),
    ["cat-ai", "cat-linux"],
  );
  assert.deepEqual(
    buttons.map((button) => button.querySelector("[data-twitter-bookmarker-color]").style.backgroundColor),
    ["#4f46e5", "#10b981"],
  );
});

test("popover opens on trigger, toggles closed, and only one is open at a time (XI-09)", () => {
  const first = createTweetDocument({ text: "one" });
  const second = createTweetDocument({ text: "two" });
  const categories = sampleCategories();

  injectOrganizer({ article: first.article, tweetId: "1", categories, displayMode: "popover", saved: false, callbacks: makeCallbacks() });
  injectOrganizer({ article: second.article, tweetId: "2", categories, displayMode: "popover", saved: false, callbacks: makeCallbacks() });

  const rootOne = first.article.querySelector("[data-twitter-bookmarker-root]");
  const rootTwo = second.article.querySelector("[data-twitter-bookmarker-root]");
  const triggerOne = rootOne.querySelector("[data-twitter-bookmarker-trigger]");
  const triggerTwo = rootTwo.querySelector("[data-twitter-bookmarker-trigger]");
  const panelOne = rootOne.querySelector("[data-twitter-bookmarker-panel]");
  const panelTwo = rootTwo.querySelector("[data-twitter-bookmarker-panel]");

  triggerOne.click();
  assert.equal(panelOne.hidden, false);
  assert.equal(triggerOne.getAttribute("aria-expanded"), "true");
  assert.equal(isPopoverOpen(rootOne), true);

  triggerOne.click();
  assert.equal(panelOne.hidden, true, "repeat click toggles closed");
  assert.equal(isPopoverOpen(rootOne), false);

  triggerOne.click();
  triggerTwo.click();
  assert.equal(panelOne.hidden, true, "opening another popover closes the first");
  assert.equal(panelTwo.hidden, false);
  assert.equal(isPopoverOpen(rootOne), false);
  assert.equal(isPopoverOpen(rootTwo), true);
});

test("popover closes on category selection and fires onSelect once (XI-09)", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const selections = [];
  const root = inject(article, {
    tweetId: "42",
    callbacks: makeCallbacks({ onSelect: (category, context) => selections.push([category.id, context.tweetId, context.article === article]) }),
  });

  const trigger = root.querySelector("[data-twitter-bookmarker-trigger]");
  const panel = root.querySelector("[data-twitter-bookmarker-panel]");
  trigger.click();
  assert.equal(panel.hidden, false);

  root.querySelector('[data-category-id="cat-linux"]').click();
  assert.equal(panel.hidden, true, "selecting closes the popover");
  assert.deepEqual(selections, [["cat-linux", "42", true]]);

  // A fast double-click collapses into one selection.
  trigger.click();
  const ai = root.querySelector('[data-category-id="cat-ai"]');
  ai.click();
  ai.click();
  assert.deepEqual(selections, [
    ["cat-linux", "42", true],
    ["cat-ai", "42", true],
  ]);
  assert.ok(doc);
});

test("popover closes on an outside click (XI-09)", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const root = inject(article);
  const trigger = root.querySelector("[data-twitter-bookmarker-trigger]");
  const panel = root.querySelector("[data-twitter-bookmarker-panel]");

  trigger.click();
  assert.equal(panel.hidden, false);
  doc.body.dispatchEvent(createEvent("click"));
  assert.equal(panel.hidden, true);
  assert.equal(isPopoverOpen(root), false);
});

test("popover closes on Escape (XI-09)", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const root = inject(article);
  const trigger = root.querySelector("[data-twitter-bookmarker-trigger]");
  const panel = root.querySelector("[data-twitter-bookmarker-panel]");

  trigger.click();
  assert.equal(panel.hidden, false);
  doc.dispatchEvent(createEvent("keydown", { key: "Escape" }));
  assert.equal(panel.hidden, true, "Escape closes the popover");

  trigger.click();
  doc.dispatchEvent(createEvent("keydown", { key: "a" }));
  assert.equal(panel.hidden, false, "other keys do not close it");
});

test("popover closes when its tweet leaves the DOM (XI-09)", () => {
  const { article } = createTweetDocument({ text: "hi" });
  const root = inject(article);
  root.querySelector("[data-twitter-bookmarker-trigger]").click();
  assert.equal(isPopoverOpen(root), true);

  article.remove();
  closeStalePopover();
  assert.equal(isPopoverOpen(root), false, "detached tweet closes its popover");
});

test("setSaving disables every control and restores them (PRD §35)", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const root = inject(article, { displayMode: "inline" });
  const buttons = root.querySelectorAll("[data-category-id]");

  setSaving("1234567890", true, doc);
  assert.equal(root.getAttribute("data-twitter-bookmarker-state"), "saving");
  assert.ok(buttons.every((button) => button.disabled === true));

  setSaving("1234567890", false, doc);
  assert.equal(root.getAttribute("data-twitter-bookmarker-state"), "ready");
  assert.ok(buttons.every((button) => button.disabled === false));
});

test("setSaved switches between controls and ✓ Saved in place (PRD §34, §41)", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const root = inject(article, { displayMode: "inline" });
  assert.equal(root.querySelectorAll("[data-category-id]").length, 2);

  setSaved("1234567890", true, doc);
  assert.ok(root.querySelector("[data-twitter-bookmarker-saved]"));
  assert.equal(root.querySelectorAll("[data-category-id]").length, 0);

  setSaved("1234567890", false, doc);
  assert.equal(root.querySelector("[data-twitter-bookmarker-saved]"), null);
  assert.equal(root.querySelectorAll("[data-category-id]").length, 2, "controls come back from the last options");
});

test("rerenderAll updates order, colours, and display mode without duplicating roots (PRD §51)", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const root = inject(article, { displayMode: "inline" });

  const categories = [{ id: "cat-z", name: "Zeta", slug: "zeta", color: "#ef4444", order: 0 }];
  rerenderAll(doc, {
    categories,
    settings: { ...SETTINGS, displayMode: "popover" },
    savedIds: new Set(),
    callbacks: makeCallbacks(),
  });

  assert.equal(rootsIn(doc).length, 1, "no duplicate root");
  assert.ok(root.querySelector("[data-twitter-bookmarker-trigger]"), "display mode change rerenders to popover");
  const buttons = root.querySelectorAll("[data-category-id]");
  assert.deepEqual(buttons.map((button) => button.getAttribute("data-category-id")), ["cat-z"]);
  assert.equal(buttons[0].querySelector("[data-twitter-bookmarker-color]").style.backgroundColor, "#ef4444");
});

test("rerenderAll marks a tweet saved when the saved set gains its id", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const root = inject(article);
  assert.equal(root.querySelector("[data-twitter-bookmarker-saved]"), null);

  rerenderAll(doc, {
    categories: sampleCategories(),
    settings: SETTINGS,
    savedIds: new Set(["1234567890"]),
    callbacks: makeCallbacks(),
  });
  assert.ok(root.querySelector("[data-twitter-bookmarker-saved]"));
});

test("rerenderAll drops the organizer and marker when categories become empty", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  article.setAttribute("data-twitter-bookmarker-injected", "true");
  inject(article);

  rerenderAll(doc, {
    categories: [],
    settings: SETTINGS,
    savedIds: new Set(),
    callbacks: makeCallbacks(),
  });

  assert.equal(rootsIn(article).length, 0);
  assert.equal(article.getAttribute("data-twitter-bookmarker-injected"), null, "marker cleared so it can re-inject later");
});

test("removeOrganizer removes one root; removeAllOrganizers clears roots and markers", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  article.setAttribute("data-twitter-bookmarker-injected", "true");
  inject(article);

  removeOrganizer(article);
  assert.equal(rootsIn(article).length, 0);

  inject(article);
  article.setAttribute("data-twitter-bookmarker-injected", "true");
  removeAllOrganizers(doc);
  assert.equal(rootsIn(doc).length, 0);
  assert.equal(article.getAttribute("data-twitter-bookmarker-injected"), null);
});

test("a fresh article node with no marker receives controls exactly once (marker logic)", () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  inject(article);
  assert.equal(rootsIn(article).length, 1);

  // Simulate X replacing the article with a new node for the same tweet.
  article.remove();
  const replacement = createTweetDocument({ text: "hi" }).article;
  // Re-parent the replacement into the original document.
  doc.body.appendChild(replacement);
  assert.equal(replacement.getAttribute("data-twitter-bookmarker-injected"), null, "fresh node starts unmarked");

  replacement.setAttribute("data-twitter-bookmarker-injected", "true");
  inject(replacement);
  inject(replacement);
  assert.equal(rootsIn(replacement).length, 1, "fresh node gets exactly one organizer");
});
