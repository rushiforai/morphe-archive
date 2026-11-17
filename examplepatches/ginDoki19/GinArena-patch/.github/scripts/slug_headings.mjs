// Slug a list of headings the way GitHub does, using GitHub's own library.
//
// Why this file exists
// --------------------
// Every anchor bug this repo has had came from someone (me) re-implementing GitHub's slug
// rule in Python and getting it subtly wrong. This runs the real thing instead, so the
// online check has no opinion of its own to be wrong about.
//
// Input:  a JSON array of heading strings on stdin.
// Output: a JSON array of slugs on stdout, one per input, in order.
// Arg 1:  a directory that has node_modules/github-slugger installed.
//
// One slugger is shared across the whole array on purpose: GitHub numbers repeated headings
// dup, dup-1, dup-2 in document order, and that only happens with shared state.

import { createRequire } from 'node:module';
import { pathToFileURL } from 'node:url';
import path from 'node:path';

const dir = process.argv[2];
if (!dir) {
  console.error('slug_headings: pass the directory holding node_modules as the first argument');
  process.exit(2);
}

// Resolve from that directory rather than the process's own, and go through createRequire so
// package.json "exports"/"main" are honoured. The result is then imported by URL, which works
// whether the package is CommonJS or ESM - github-slugger 2.x is ESM-only, 1.x was CommonJS.
let resolved;
try {
  const req = createRequire(path.join(path.resolve(dir), 'noop.cjs'));
  resolved = req.resolve('github-slugger');
} catch (error) {
  console.error(`slug_headings: github-slugger is not installed under ${dir}: ${error.message}`);
  process.exit(2);
}

const module = await import(pathToFileURL(resolved).href);
const Slugger = module.default ?? module.Slugger;
if (typeof Slugger !== 'function') {
  console.error(`slug_headings: ${resolved} does not export a Slugger`);
  process.exit(2);
}

let input = '';
for await (const chunk of process.stdin) input += chunk;

let headings;
try {
  headings = JSON.parse(input);
} catch (error) {
  console.error(`slug_headings: stdin is not JSON: ${error.message}`);
  process.exit(2);
}
if (!Array.isArray(headings)) {
  console.error('slug_headings: stdin must be a JSON array of strings');
  process.exit(2);
}

const slugger = new Slugger();
const slugs = headings.map((heading) => slugger.slug(String(heading)));
process.stdout.write(JSON.stringify(slugs));
