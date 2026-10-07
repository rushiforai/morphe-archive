import { analyzeCommits } from '@semantic-release/commit-analyzer';
import fs from 'node:fs';

const options = JSON.parse(fs.readFileSync('.releaserc')).plugins
    .find(plugin => Array.isArray(plugin) && plugin[0] === '@semantic-release/commit-analyzer')[1];
const cases = [
    ['fix: repair', 'patch'],
    ['feat: new app', 'minor'],
    ['bump: app support', 'patch'],
    ['perf: improve', 'patch'],
    ['chore: housekeeping', null],
    ['docs: readme', null],
    ['feat: incompatible change\n\nBREAKING CHANGE: remove old API', 'major'],
];
for (const [message, expected] of cases) {
    const actual = await analyzeCommits(options, {
        cwd: process.cwd(), commits: [{ message, hash: 'fixture' }], logger: { log() {} },
    });
    if (actual !== expected) throw new Error(`${message}: expected ${expected}, got ${actual}`);
}
console.log(`PASS: ${cases.length} semantic-release commit/version rules`);
