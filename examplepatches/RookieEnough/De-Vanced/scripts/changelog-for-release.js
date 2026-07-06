'use strict';

const fs = require('fs');
const path = require('path');

const version = process.argv[2];
if (!version) {
  process.stderr.write('changelog-for-release.js: missing version argument\n');
  process.exit(1);
}

const changelogPath = path.join(__dirname, '..', 'CHANGELOG.md');
const text = fs.readFileSync(changelogPath, 'utf8');

const normalized = text.replace(/\r\n/g, '\n');
const header = `## [${version}]`;
const start = normalized.indexOf(header);
if (start === -1) {
  process.stderr.write(
    `changelog-for-release.js: warning: no CHANGELOG.md section starting with ${header}; ` +
      'skipping appended release notes (conventional notes still apply).\n'
  );
  process.exit(0);
}

const lineEnd = normalized.indexOf('\n', start);
if (lineEnd === -1) {
  process.stderr.write('changelog-for-release.js: malformed CHANGELOG.md\n');
  process.exit(1);
}

let bodyStart = lineEnd + 1;
let next = normalized.indexOf('\n## [', bodyStart);
let body =
  next === -1 ? normalized.slice(bodyStart) : normalized.slice(bodyStart, next);

body = body.replace(/\n---\s*$/u, '').trimEnd();
process.stdout.write(body);
