// Checks the scripts the page patches inject: each one must parse and run on an empty page,
// and the keyword and author filters must hide what they should and nothing else.
// Usage: node test.js <folder written by GenerateScripts>
'use strict';
const fs = require('fs');
const path = require('path');
const vm = require('vm');

const dir = process.argv[2];
const files = fs.readdirSync(dir).filter((f) => f.endsWith('.js')).sort();
let failures = 0;
const fail = (msg) => { failures++; console.error('FAIL ' + msg); };

function fakePage(units = []) {
  const styles = [];
  const document = {
    documentElement: {},
    head: { appendChild: (el) => styles.push(el.textContent) },
    getElementById: () => null,
    createElement: () => ({}),
    querySelectorAll: () => units,
  };
  const sandbox = {
    window: { addEventListener() {} }, document, URL, styles,
    MutationObserver: class { observe() {} },
    setTimeout: () => 0,
  };
  return vm.createContext(sandbox);
}

// 1. Every script parses and runs on an empty page.
for (const f of files) {
  const src = fs.readFileSync(path.join(dir, f), 'utf8');
  try {
    new vm.Script(src, { filename: f });
  } catch (e) {
    fail(`${f} does not parse: ${e.message}`);
    continue;
  }
  try {
    vm.runInContext(src, fakePage(), { filename: f, timeout: 1000 });
  } catch (e) {
    fail(`${f} throws on an empty page: ${e.message}`);
  }
}

// 2. The filters hide the right feed items.
function unit(text, links = [], tribe = null) {
  const attrs = {};
  const style = {};
  return {
    innerText: text,
    style: { setProperty: (k, v) => { style[k] = v; } },
    hasAttribute: (k) => k in attrs,
    setAttribute: (k, v) => { attrs[k] = v; },
    querySelectorAll(sel) {
      if (sel === 'a[href]') return links.map(([t, href]) => ({ textContent: t, href, getAttribute: () => href }));
      if (sel === '.puppeteer_test_tribe_name') return tribe ? [{ textContent: tribe }] : [];
      return [];
    },
    get hidden() { return style.display === 'none'; },
  };
}

function expectFilter(file, cases) {
  const src = fs.readFileSync(path.join(dir, file), 'utf8');
  const units = cases.map(([u]) => u);
  vm.runInContext(src, fakePage(units), { filename: file, timeout: 1000 });
  for (const [u, shouldHide] of cases) {
    if (u.hidden !== shouldHide) fail(`${file}: "${u.innerText}" should be ${shouldHide ? 'hidden' : 'shown'}`);
  }
}

// Sample keywords: crypto, "quoted" word, Elon Musk, c++
expectFilter('filterKeywords-0.js', [
  [unit('I love Crypto!'), true],
  [unit('cryptocurrency news'), false],
  [unit('Elon  Musk said'), true],
  [unit('learning C++ today'), true],
  [unit('a "quoted" word here'), true],
  [unit('nothing to see'), false],
]);

// Sample names: Jane Doe, Cats of Quora
expectFilter('blockAuthors-0.js', [
  [unit('answer by jane', [['Jane Doe', 'https://www.quora.com/profile/Jane-Doe-12']]), true],
  [unit('answer by slug only', [['', 'https://www.quora.com/profile/Jane-Doe']]), true],
  [unit('space post', [['', 'https://catsofquora.quora.com/Some-post']], 'Cats of Quora'), true],
  [unit('spanish site', [['Pedro', 'https://es.quora.com/profile/Pedro']]), false],
  [unit('someone else', [['John Roe', 'https://www.quora.com/profile/John-Roe']]), false],
]);

console.log(`${files.length} scripts checked, ${failures} failure(s)`);
process.exit(failures ? 1 : 0);
