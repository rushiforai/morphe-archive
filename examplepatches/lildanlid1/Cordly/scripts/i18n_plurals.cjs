// Lists every plural pair Venus shows ({plural: singular}), from pl(), take() and count() calls in bootstrap.js.
// Zero external dependencies (no Acorn): node scripts/i18n_plurals.cjs > work/plurals.json
const fs = require('node:fs');
const {tokenize, splitArgs} = require('./i18n_strings.cjs');
const source = fs.readFileSync('patches/src/main/resources/venus/bootstrap.js', 'utf8').replace('/*__FEATURES__*/', '{}');
const tokens = tokenize(source);
const pairs = {};

for (let i = 0; i < tokens.length - 1; i++) {
    const t = tokens[i], next = tokens[i + 1];
    if (t.type !== 'ident' || next.type !== 'punct' || next.value !== '(') continue;
    const prev = i > 0 ? tokens[i - 1] : null;
    if (prev && prev.type === 'punct' && (prev.value === '.' || prev.value === '?.')) continue;
    if (prev && prev.type === 'ident' && prev.value === 'function') continue;
    const name = t.value;
    if (name !== 'pl' && name !== 'take' && name !== 'count' && name !== 'serverCount') continue;
    const {args} = splitArgs(tokens, i + 1);
    if ((name === 'pl' || name === 'take' || name === 'serverCount') && args[1]?.length === 1 && args[1][0].type === 'str' && args[2]?.length === 1 && args[2][0].type === 'str') {
        pairs[args[2][0].value] = args[1][0].value;
    }
    if (name === 'count' && args[1]?.length === 1 && args[1][0].type === 'str') {
        pairs['{n} ' + args[1][0].value + 's'] = '{n} ' + args[1][0].value;
    }
}

if (require.main === module) {
    process.stdout.write(JSON.stringify(pairs, null, 1) + '\n');
}
module.exports = {pairs};
