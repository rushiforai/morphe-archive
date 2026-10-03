const fs = require('node:fs');
const path = require('node:path');
module.exports.generateNotes = async (options, context) => {
  const version = context.nextRelease.version;
  const notePath = path.join(context.cwd, '.github/release-notes', 'v' + version + '.md');
  const notes = fs.existsSync(notePath)
    ? fs.readFileSync(notePath, 'utf8')
    : await require('@semantic-release/release-notes-generator').generateNotes(options, context);
  // Morphe needs a dated version heading and app-scoped * bullets for update detection.
  const body = notes.replace(/^#{1,3}\s+\[?v?\d[^\n]*\n+/, '')
    .replace(/^[-*]\s+(?:\*\*[^*]+:\*\*\s*)?/gm, '* **nicoid:** ');
  const date = new Date().toISOString().slice(0, 10);
  return '## ' + version + ' (' + date + ')\n\n' + body.trim() + '\n';
};
