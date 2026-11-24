// Runs page scripts on small copies of Quora's markup in jsdom and checks what they hide.
// The markup is trimmed from real pages; class names are the ones the scripts rely on.
// Usage: node dom-test.js <folder written by GenerateScripts>
'use strict';
const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

const dir = process.argv[2];
let failures = 0;
let checks = 0;
const fail = (msg) => { failures++; console.error('FAIL ' + msg); };

function run(script, html) {
  const dom = new JSDOM(`<!doctype html><html><head></head><body>${html}</body></html>`, {
    runScripts: 'outside-only',
    pretendToBeVisual: true,
  });
  // jsdom has no innerText; the page scripts read the text with it.
  Object.defineProperty(dom.window.HTMLElement.prototype, 'innerText', {
    get() { return this.textContent.replace(/\s+/g, ' ').trim(); },
  });
  dom.window.eval(fs.readFileSync(path.join(dir, script), 'utf8'));
  return dom.window.document;
}

function hidden(doc, selector) {
  const el = doc.querySelector(selector);
  if (!el) throw new Error(`no element ${selector}`);
  for (let e = el; e && e.nodeType === 1; e = e.parentElement) {
    if (e.style.display === 'none') return true;
  }
  return false;
}

function expect(script, html, cases) {
  const doc = run(script, html);
  for (const [selector, shouldHide] of cases) {
    checks++;
    if (hidden(doc, selector) !== shouldHide) {
      fail(`${script}: ${selector} should be ${shouldHide ? 'hidden' : 'shown'}`);
    }
  }
}

// An answer header: avatar, name, "·", Follow, then credential "·" date.
const header = (cred, date, follow = true) => `
  <div class="q-box"><span class="q-box"><span class="q-text"><a class="puppeteer_test_link" id="name"
    href="https://www.quora.com/profile/Jane-Doe">Jane Doe</a></span></span>
  ${follow ? `<span class="q-text"><span id="follow-dot"> · </span></span>
  <div class="q-box" style="display:inline" id="follow"><div class="q-click-wrapper"><div class="q-text">Follow </div></div></div>` : ''}
  </div>
  <div class="q-text qu-display--flex"><div class="q-text qu-truncateLines--1" id="cred"><span>${cred}</span></div>
  <span id="cred-dot">&nbsp;·&nbsp;</span><span class="q-text"><span class="q-box">
  <a class="q-box answer_timestamp puppeteer_test_link" href="#" id="date">${date}</a></span></span></div>`;

const unit = (id, date, text = 'Some answer text that is long enough.') => `
  <div class="q-box dom_annotate_multifeed_bundle_AnswersBundle" id="${id}">
    ${header('Knows things', date)}
    <div class="q-text puppeteer_test_question_title">A question about ${id}?</div>
    <div class="puppeteer_test_answer_content"><p class="q-text">${text}</p></div>
  </div>`;

// Hide credentials: the credential and its dot go, the date and the name stay.
expect('hideCredentials-0.js', `${unit('a', '6y')}
  <div class="q-box dom_annotate_multifeed_bundle_PostBundle" id="post">
    <div class="q-text qu-display--flex"><div class="q-text" id="posted"><span>Posted by Jane Doe</span></div>
    <span>&nbsp;·&nbsp;</span><a class="puppeteer_test_link" href="#">Apr 27</a></div></div>
  <div class="q-box" id="upvoted"><div class="q-text"><span>Upvoted by John Roe, PhD in physics</span></div></div>`, [
  ['#cred', true], ['#cred-dot', true], ['#date', false], ['#name', false],
  ['#posted', false], ['#upvoted', true],
]);

// Hide Follow buttons: the inline Follow and its dot go; a Follow button on its own line stays.
expect('hideFollowButtons-0.js', `${unit('a', '6y')}
  <div class="q-box" id="profile"><div class="q-click-wrapper" id="big-follow"><div class="q-text">Follow</div></div>
  <div class="q-text">Jane Doe's profile</div></div>`, [
  ['#follow', true], ['#follow-dot', true], ['#name', false], ['#big-follow', false],
]);

// Hide old answers (3 years): 6y and a dated 2019 answer go; 1y and this year's stay.
expect('hideOldAnswers-0.js', [unit('old', '6y'), unit('new', '1y'), unit('dated', 'Mar 3, 2019'),
  unit('recent', 'Aug 28'), unit('fresh', '47m'), unit('edited', 'Updated 6y')].join(''), [
  ['#old', true], ['#dated', true], ['#new', false], ['#recent', false], ['#fresh', false], ['#edited', true],
]);

// Hide comment previews: the "N comments from … and more" row goes, the answer stays.
expect('hideCommentPreviews-0.js', `${unit('a', '1y', 'I got 823 comments from strangers and more on this.')}
  <div class="q-box" id="row"><div class="q-box"><div class="q-click-wrapper"><div class="q-flex">
    <div class="q-text">823 comments from <div class="q-inlineFlex"><span><span>J. Quila</span></span></div> and more</div>
  </div></div></div></div>`, [
  ['#row', true], ['#a', false],
]);

// Hide surveys: the survey box goes, the feed around it stays.
expect('hideSurveys-0.js', `<div id="feed">${unit('a', '1y')}
  <div class="q-box" id="survey"><div class="q-text">How satisfied are you with your home feed experience today?</div>
  <div class="q-text">This helps us improve our product.</div><div>Not satisfied</div><div>Very satisfied</div></div>
  ${unit('b', '2y')}</div>`, [
  ['#survey', true], ['#a', false], ['#b', false],
]);

// Hide surveys: "Was this worth your time?" under a short answer. The box starts with
// "Your response is private"; the answer around it stays (it is under 400 characters on purpose).
expect('hideSurveys-0.js', `<div id="feed">
  <div class="q-box dom_annotate_multifeed_bundle_AnswersBundle" id="w">
    ${header('Knows things', '1y')}
    <div class="q-text puppeteer_test_question_title">A short question?</div>
    <div class="puppeteer_test_answer_content"><p class="q-text" id="w-text">A short answer.</p></div>
    <div class="q-box" id="worth"><div class="q-box"><div class="q-flex">
      <div class="q-box"><div class="q-text">Your response is private</div>
        <div class="q-text">Was this worth your time?</div>
        <div class="q-text">This helps us show content you find valuable.</div></div>
      <div class="q-flex"><button>Absolutely not</button><button>Definitely yes</button></div>
    </div></div></div>
  </div>
  ${unit('b', '2y')}</div>`, [
  ['#worth', true], ['#w', false], ['#w-text', false], ['#name', false], ['#b', false],
]);

// Copy and Share text: one of each under an answer and under a Spaces post (whose Share button
// is only marked by its icon's label), none made from each other, and a shortened feed text goes
// out as a preview without its "Read more".
{
  const shareIcon = '<span aria-label="Share"><svg width="24" height="24"></svg></span>';
  const html = `
    <div class="q-box dom_annotate_multifeed_bundle_AnswersBundle" id="a">
      <div class="puppeteer_test_answer_content"><p class="q-text">Full answer text.</p></div>
      <div class="q-flex" id="a-bar"><span class="q-box"><button class="dom_annotate_answer_action_bar_share">
        ${shareIcon}<div class="q-text">3</div></button></span></div>
    </div>
    <div class="q-box dom_annotate_multifeed_bundle_TribeBundle" id="other">
      <div class="q-text"><p class="q-text">Text of another item.</p></div>
    </div>
    <div class="q-box dom_annotate_multifeed_bundle_PostBundle" id="p">
      <div class="q-click-wrapper"><div class="q-text qu-dynamicFontSize--regular_title">A post title?</div>
      <div class="q-text qu-truncateLines--3 qu-wordBreak--break-word"><span>The start of a long post</span></div>
      <span class="q-text">Read more</span></div>
      <div class="q-flex" id="p-bar"><span class="q-box"><button class="q-click-wrapper" aria-label="82 shares">
        ${shareIcon}<div class="q-text">82</div></button></span></div>
    </div>`;
  const dom = new JSDOM(`<!doctype html><html><head></head><body>${html}</body></html>`, {
    runScripts: 'outside-only', pretendToBeVisual: true,
  });
  // jsdom has no innerText; the page scripts read the text with it.
  Object.defineProperty(dom.window.HTMLElement.prototype, 'innerText', {
    get() { return this.textContent.replace(/\s+/g, ' ').trim(); },
  });
  // The app's raw bridge: every call must carry the key the scripts' own wrapper adds.
  const calls = [];
  const keys = new Set();
  const record = (name) => (key, t) => { keys.add(key); calls.push([name, t]); };
  dom.window.JoFSlashBridge = {
    copyText: record('copyText'), copyPreview: record('copyPreview'),
    shareText: record('shareText'), sharePreview: record('sharePreview'),
  };
  for (const s of ['copyAnswerText-0.js', 'shareAnswerText-0.js', 'copyAnswerText-0.js']) {
    dom.window.eval(fs.readFileSync(path.join(dir, s), 'utf8'));
  }
  const doc = dom.window.document;
  const count = (bar, label) => doc.querySelectorAll(`#${bar} button[aria-label="${label}"]`).length;
  for (const bar of ['a-bar', 'p-bar']) {
    for (const label of ['Copy text', 'Share text']) {
      checks++;
      if (count(bar, label) !== 1) fail(`#${bar} should have one "${label}" button, has ${count(bar, label)}`);
    }
  }
  doc.querySelector('#p-bar button[aria-label="Share text"]').click();
  doc.querySelector('#a-bar button[aria-label="Copy text"]').click();
  const want = [['sharePreview', 'A post title?\n\nThe start of a long post…'], ['copyText', 'Full answer text.']];
  checks++;
  if (JSON.stringify(calls) !== JSON.stringify(want)) fail(`Copy/Share text calls: ${JSON.stringify(calls)}`);
  checks++;
  const [key] = keys;
  if (keys.size !== 1 || !/^[0-9a-f]{36}$/.test(key)) fail(`Bridge calls should carry one key, got ${JSON.stringify([...keys])}`);
  // A frame without the key gets nothing: the wrapper is the only way in, and it can't be replaced.
  checks++;
  try { dom.window.JoFSlashPatches = {}; } catch (e) { /* frozen in strict code */ }
  if (typeof dom.window.JoFSlashPatches.ready !== 'function') fail('window.JoFSlashPatches could be replaced');
}

// Hide Spaces posts: a stylesheet that hides post units and leaves answers.
{
  const doc = run('hideSpacesPosts-0.js', `${unit('a', '1y')}
    <div class="q-box dom_annotate_multifeed_bundle_PostBundle" id="post">post</div>
    <div class="q-box dom_annotate_multifeed_bundle_ExplorePostBundle" id="explore">post</div>`);
  const shown = (id) => doc.defaultView.getComputedStyle(doc.getElementById(id)).display !== 'none';
  for (const [id, want] of [['a', true], ['post', false], ['explore', false]]) {
    checks++;
    if (shown(id) !== want) fail(`hideSpacesPosts-0.js: #${id} should be ${want ? 'shown' : 'hidden'}`);
  }
}

// Block authors (sample list has Jane Doe): her answers go on question pages too; an answer she
// only upvoted stays.
expect('blockAuthors-0.js', `
  <div class="q-box dom_annotate_question_answer_item_0" id="hers">
    <a class="puppeteer_test_link" href="https://www.quora.com/profile/Jane-Doe-12"></a>
    <a class="puppeteer_test_link" href="https://www.quora.com/profile/Jane-Doe-12">Jane Doe</a>
    <div class="puppeteer_test_answer_content"><p class="q-text">Her answer.</p></div></div>
  <div class="q-box dom_annotate_question_answer_item_1" id="upvoted">
    <a class="puppeteer_test_link" href="https://www.quora.com/profile/John-Roe">John Roe</a>
    <div class="q-text qu-color--gray"><div><span class="c1h7helg">Upvoted by <span class="q-inlineFlex">
      <a class="puppeteer_test_link" href="https://www.quora.com/profile/Jane-Doe-12">Jane Doe</a></span>
      , PhD in physics</span></div></div>
    <div class="puppeteer_test_answer_content"><p class="q-text">His answer.</p></div></div>`, [
  ['#hers', true], ['#upvoted', false],
]);

// Hide anonymous answers. Markup trimmed from a question page: the author is the first bold
// q-text; an anonymous one is plain text, a named one a profile link. An anonymous commenter
// further down doesn't hide the named author's answer.
const author = (name) => `
  <div class="q-box qu-flex--auto"><div class="q-box"><span class="q-box">
    <span class="q-text qu-dynamicFontSize--small qu-bold qu-color--gray_dark qu-passColorToLinks">
      <div class="q-inlineFlex qu-alignItems--center"><div class="q-inlineFlex qu-alignItems--center qu-wordBreak--break-word">
      ${name}</div></div></span></span></div></div>`;
expect('hideAnonymousAnswers-0.js', `
  <div class="q-box dom_annotate_question_answer_item_0" id="anon">
    ${author('<span><span>Anonymous</span></span>')}
    <div class="puppeteer_test_answer_content"><p class="q-text">A secret.</p></div></div>
  <div class="q-box dom_annotate_question_answer_item_1" id="named">
    ${author('<span><a class="puppeteer_test_link" href="https://www.quora.com/profile/Jake-Williams-65">Jake Williams</a></span>')}
    <div class="puppeteer_test_answer_content"><p class="q-text">His answer.</p></div>
    <div class="q-box comment">${author('<span><span>Anonymous</span></span>')}<p class="q-text">A comment.</p></div></div>
  <div class="q-box dom_annotate_multifeed_bundle_AnswersBundle" id="feed-anon">
    ${author('<span><span>Anonymous</span></span>')}
    <div class="puppeteer_test_answer_content"><p class="q-text">In the feed.</p></div></div>`, [
  ['#anon', true], ['#named', false], ['#feed-anon', true],
]);

// Filter keywords: whole words only, and a word ending in * also finds longer words
// (the sample list has "art*" and "crypto").
expect('filterKeywords-0.js', [unit('artist', '1y', 'An artist painted this.'), unit('start', '1y', 'A fresh start for all.'),
  unit('crypto', '1y', 'I lost money on crypto.'), unit('cryptography', '1y', 'Cryptography is maths.')].join(''), [
  ['#artist', true], ['#start', false], ['#crypto', true], ['#cryptography', false],
]);

// Hide low-voted answers (fewer than 10): the count is read from the Upvote button; an item
// without one, such as a question, stays.
const voted = (id, count) => `
  <div class="q-box dom_annotate_multifeed_bundle_AnswersBundle" id="${id}">
    <div class="puppeteer_test_answer_content"><p class="q-text">An answer.</p></div>
    <button class="q-click-wrapper puppeteer_test_votable_upvote_button" aria-label="Upvote">
      <span class="q-text qu-fontWeight--medium">Upvote</span>${count === null ? '' : `<span class="q-box qu-display--none"> · </span>
      <span class="q-text qu-visibility--hidden qu-display--inline-flex">${'9'.repeat(count.length)}</span>
      <span class="q-text qu-whiteSpace--nowrap qu-display--inline-flex">${count}</span>`}</button>
  </div>`;
expect('hideLowVoted-0.js', [voted('none', null), voted('three', '3'), voted('ten', '10'), voted('k', '1.8K'),
  voted('many', '1,204'),
  '<div class="q-box dom_annotate_multifeed_bundle_QuestionsBundle" id="question"><div class="q-text">A question?</div></div>'].join(''), [
  ['#none', true], ['#three', true], ['#ten', false], ['#k', false], ['#many', false], ['#question', false],
]);

// Hide reshares: an item with the share's post timestamp and the shared answer's timestamp goes;
// a plain answer and a plain post stay. Markup trimmed from the phone's feed.
const stamped = (id, cls, stamps) => `<div class="q-box dom_annotate_multifeed_bundle_${cls}" id="${id}">
  ${stamps.map((s) => `<a class="q-box qu-cursor--pointer ${s} puppeteer_test_link" href="#">1h</a>`).join('')}
  <div class="puppeteer_test_answer_content"><p class="q-text">Text.</p></div></div>`;
expect('hideReshares-0.js', [stamped('reshare', 'ExplorePostBundle', ['post_timestamp', 'answer_timestamp']),
  stamped('repost', 'PostBundle', ['post_timestamp', 'post_timestamp']),
  stamped('answer', 'AnswersBundle', ['answer_timestamp']), stamped('post', 'PostBundle', ['post_timestamp'])].join(''), [
  ['#reshare', true], ['#repost', true], ['#answer', false], ['#post', false],
]);

// Hide picture and video posts: a post that is a picture with a title only goes; a picture with
// text and a text without a picture stay. Avatars (profile links) don't count as pictures.
const pictured = (id, picture, body) => `<div class="q-box dom_annotate_multifeed_bundle_PostBundle" id="${id}">
  <a href="https://www.quora.com/profile/X"><div style="background-image: url(https://qph.cf2.quoracdn.net/a.jpg)"></div></a>
  <div class="q-text puppeteer_test_question_title">A title for ${id}</div>
  ${body ? `<div class="q-text qu-truncateLines--3"><p class="q-text">${body}</p></div>` : ''}
  ${picture ? '<div class="q-box" style="background-image: url(https://qph.cf2.quoracdn.net/main-qimg-1.jpg)"></div>' : ''}
  <button class="puppeteer_test_votable_upvote_button" aria-label="Upvote">Upvote</button></div>`;
expect('hideMediaOnly-0.js', [pictured('only', true, ''), pictured('both', true, 'A long enough text that explains the picture well.'),
  pictured('text', false, 'Just words.'), pictured('short', false, '')].join(''), [
  ['#only', true], ['#both', false], ['#text', false], ['#short', false],
]);

// Hide machine-translated answers: the "Translated from …" line hides its answer; an answer
// that only talks about translation stays.
expect('hideTranslated-0.js', `
  <div class="q-box dom_annotate_question_answer_item_0" id="tr"><span class="q-text">Translated from Spanish</span>
    <div class="puppeteer_test_answer_content"><p class="q-text">Hola.</p></div></div>
  <div class="q-box dom_annotate_question_answer_item_1" id="talk">
    <div class="puppeteer_test_answer_content"><p class="q-text">I translated from German for years.</p></div></div>`, [
  ['#tr', true], ['#talk', false],
]);

// Reading time: a long open answer gets "N min read" above it; a short one and a feed item don't.
{
  const long = Array(700).fill('word').join(' ');
  const doc = run('readingTime-0.js', `
    <div class="q-box" id="open"><div class="puppeteer_test_answer_content" id="long"><p class="q-text">${long}</p></div></div>
    <div class="q-box"><div class="puppeteer_test_answer_content" id="short"><p class="q-text">Just a few words here.</p></div></div>
    <div class="q-box dom_annotate_multifeed_bundle_AnswersBundle"><div class="puppeteer_test_answer_content" id="feed">
      <p class="q-text">${long}</p></div></div>`);
  const labels = [...doc.querySelectorAll('[data-jofslash-readtime-label]')];
  checks++;
  if (labels.length !== 1 || labels[0].nextElementSibling !== doc.getElementById('long') || !/^3 /.test(labels[0].textContent)) {
    fail(`readingTime: want one "3 min read" above the long open answer, got ${labels.map((l) => l.textContent).join(', ')}`);
  }
}

// Word count: the editor opens as its own page whose params name the modal. Markup trimmed from
// Quora's answer editor: each paragraph is a [data-kind=section].
function editorPage(modal, html) {
  const params = Buffer.from(JSON.stringify({ initialModalProps: { name: modal } })).toString('base64');
  const dom = new JSDOM(`<!doctype html><html><head></head><body>${html}</body></html>`, {
    url: `https://www.quora.com/ans_frontend/modalflow?params=${encodeURIComponent(params)}&chunkName=component-Modals-Editor`,
    runScripts: 'outside-only',
    pretendToBeVisual: true,
  });
  dom.window.eval(fs.readFileSync(path.join(dir, 'wordCount-0.js'), 'utf8'));
  return dom.window.document;
}

const editorBox = (...paragraphs) => `<div class="doc dark_mode" contenteditable="true" data-kind="doc">${
  paragraphs.map((p) => `<div class="section" data-kind="section"><div class="span" data-kind="span"><div class="content">${p}</div></div></div>`).join('')}</div>`;

function expectCount(what, doc, want) {
  checks++;
  const label = doc.getElementById('jofslash-word-count');
  const got = label && label.style.display !== 'none' ? label.textContent : null;
  if (got !== want) fail(`wordCount-0.js: ${what} should show ${JSON.stringify(want)}, shows ${JSON.stringify(got)}`);
}

{
  // Two paragraphs: their words don't run together, extra spaces don't count as words.
  const doc = editorPage('AnswerEditorModal', editorBox('Hello world.', 'Second   paragraph here'));
  expectCount('the answer editor', doc, 'Words: 5 · Characters: 35');
  // Typing updates the count at once.
  doc.querySelector('.content').textContent = 'One two three';
  doc.querySelector('[data-kind="doc"]').dispatchEvent(new doc.defaultView.Event('input', { bubbles: true }));
  expectCount('the answer editor after typing', doc, 'Words: 6 · Characters: 36');
}
expectCount('an empty answer editor', editorPage('AnswerEditorModal', editorBox('')), 'Words: 0 · Characters: 0');
expectCount('the post editor', editorPage('AskQuestion', editorBox('A post.')), 'Words: 2 · Characters: 7');
// The comment sheet has its Post button where the label would go.
expectCount('the comment sheet', editorPage('CommentAddModal', editorBox('A comment.')), null);
expectCount('a comment modal on an answer', editorPage('AnswerCommentModal', editorBox('A comment.')), null);
// Quora reuses the comment sheet's page for the next modal without loading it again.
{
  const doc = editorPage('CommentAddModal', editorBox('A comment.'));
  const w = doc.defaultView;
  const params = Buffer.from(JSON.stringify({ initialModalProps: { name: 'AskQuestion' } })).toString('base64');
  w.history.pushState({}, '', `/ans_frontend/modalflow?params=${encodeURIComponent(params)}`);
  doc.querySelector('[data-kind="doc"]').dispatchEvent(new w.Event('input', { bubbles: true }));
  expectCount('a page reused for the post editor', doc, 'Words: 2 · Characters: 10');
}
// An editor that isn't shown, such as the post tab while Add Question is open.
expectCount('a hidden editor', editorPage('AskQuestion', `<div style="display:none">${editorBox('Hidden.')}</div>`), null);

// Bookmarks in an open answer: the button is added next to Share, and added again when Quora
// redraws the action bar and drops it.
async function bookmarkCheck() {
  const props = encodeURIComponent(JSON.stringify({ aid: 7 }));
  const dom = new JSDOM(`<!doctype html><html><body>
    <div class="q-text puppeteer_test_question_title">Why is the sky blue?</div>
    <a class="puppeteer_test_link" href="https://www.quora.com/profile/Jane-Doe">Jane Doe</a>
    <div class="puppeteer_test_answer_content"><p class="q-text">Because of the air.</p></div>
    <div id="bar"><div class="q-box"><div class="q-box dom_annotate_answer_action_bar_share">
      <button aria-label="Share"><svg><path d="M0 0"></path></svg></button></div></div></div>
    </body></html>`, {
    url: `https://www.quora.com/ans_frontend?rootCls=AnswerModalPage&props=${props}`,
    runScripts: 'outside-only', pretendToBeVisual: true,
  });
  const w = dom.window;
  w.__RELAY_RECORDS__ = { r1: { aid: 7, permaUrl: 'https://www.quora.com/Why-is-the-sky-blue/answer/Jane-Doe' } };
  Object.defineProperty(w.HTMLElement.prototype, 'innerText', {
    get() { return this.textContent.replace(/\s+/g, ' ').trim(); },
  });
  const saved = new Set();
  w.JoFSlashBridge = {
    isBookmarked: (key, url) => saved.has(url),
    toggleBookmark: (key, url) => { if (saved.has(url)) saved.delete(url); else saved.add(url); return saved.has(url); },
  };
  w.eval(fs.readFileSync(path.join(dir, 'bookmarks-0.js'), 'utf8'));
  const button = () => w.document.querySelector('[aria-label="Bookmark"],[aria-label="Remove bookmark"]');
  const wait = (ms) => new Promise((r) => setTimeout(r, ms));
  await wait(200);
  checks++;
  if (!button()) fail('bookmarks-0.js: no bookmark button next to Share');
  if (button()) {
    button().click();
    checks++;
    if (!saved.has('https://www.quora.com/Why-is-the-sky-blue/answer/Jane-Doe')) fail('bookmarks-0.js: tapping the button saved nothing');
    // Quora redraws the bar: our button is gone.
    w.document.querySelector('[data-jofslash-bookmark]').remove();
    await wait(800);
    checks++;
    if (!button()) fail('bookmarks-0.js: the button doesn\'t come back after the bar is redrawn');
    else if (button().getAttribute('aria-pressed') !== 'true') fail('bookmarks-0.js: the button that came back doesn\'t show the saved state');
  }
  w.close();
}

// Hidden counts: an ad the ads stylesheet hides and a feed item a filter hid count once each; the
// ad's inner parts and a shown item don't count.
async function statsCheck() {
  const dom = new JSDOM(`<!doctype html><html><head>
    <style id="jofslash-remove-ads">.dom_annotate_multifeed_bundle_AdBundle{display:none !important;}</style></head><body>
    <div class="q-box dom_annotate_multifeed_bundle_AdBundle"><div class="dom_annotate_multifeed_bundle_AdBundle">inner</div></div>
    <div class="q-box dom_annotate_multifeed_bundle_AnswersBundle" data-jofslash-filtered style="display:none">filtered</div>
    <div class="q-box dom_annotate_multifeed_bundle_AnswersBundle" id="shown">shown</div>
    </body></html>`, { runScripts: 'outside-only', pretendToBeVisual: true });
  const w = dom.window;
  const sent = [];
  w.JoFSlashBridge = { countHidden: (key, json) => sent.push(JSON.parse(json)) };
  w.eval(fs.readFileSync(path.join(dir, 'onPageFinished-0.js'), 'utf8'));
  const total = (kind) => sent.reduce((n, s) => n + (s[kind] || 0), 0);
  checks++;
  if (total('ads') !== 1 || total('filters') !== 1) fail(`onPageFinished-0.js (hidden counts): sent ${JSON.stringify(sent)}, want ads 1 and filters 1`);
  // A filter hides another item later: it counts once more, the old ones don't count again.
  w.document.getElementById('shown').setAttribute('data-jofslash-filtered', '');
  await new Promise((r) => setTimeout(r, 1800));
  checks++;
  if (total('ads') !== 1 || total('filters') !== 2) fail(`onPageFinished-0.js (hidden counts): after another filtered item sent ${JSON.stringify(sent)}`);
  w.close();
}

bookmarkCheck().then(statsCheck).then(() => {
  console.log(`${checks} DOM checks, ${failures} failure(s)`);
  process.exit(failures ? 1 : 0);
});
