// Checks that every selector in filters/selectors.json is one a browser understands, so a typo
// doesn't ship as a rule that never matches. check_filters.py checks the file's other rules.
// Usage: node check-selectors.js <filters/selectors.json>
'use strict';
const fs = require('fs');
const { JSDOM } = require('jsdom');

const file = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
const { document } = new JSDOM('<!doctype html><html><body></body></html>').window;
let failures = 0;
let count = 0;
for (const [key, selectors] of Object.entries(file.rules || {})) {
  for (const selector of selectors) {
    count++;
    try {
      document.querySelectorAll(selector);
    } catch (e) {
      failures++;
      console.error(`FAIL filters: ${key}: ${selector} isn't a valid selector (${e.message})`);
    }
  }
}
console.log(`${count} filter selector(s) parsed, ${failures} failure(s)`);
process.exit(failures ? 1 : 0);
