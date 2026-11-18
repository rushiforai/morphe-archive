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

console.log(`${checks} DOM checks, ${failures} failure(s)`);
process.exit(failures ? 1 : 0);
