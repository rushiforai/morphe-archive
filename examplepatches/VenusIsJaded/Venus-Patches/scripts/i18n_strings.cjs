// Lists every English text Venus shows through tr(), so language files can be checked against it.
// Zero external dependencies (no Acorn): node scripts/i18n_strings.cjs  ->  JSON array on stdout
const fs = require('node:fs');
const source = fs.readFileSync('patches/src/main/resources/venus/bootstrap.js', 'utf8').replace('/*__FEATURES__*/', '{}');

function tokenize(code) {
    const tokens = [];
    let i = 0, n = code.length, prevType = null, prevVal = null;
    const REGEX_PRECEDERS = new Set([
        null, '(', ',', '=', ':', '[', '!', '&', '|', '?', '{', '}', ';',
        '+', '-', '*', '/', '%', '<', '>', '^', '~',
        'return', 'case', 'typeof', 'void', 'delete', 'in', 'instanceof', 'new'
    ]);
    while (i < n) {
        const c = code[i];
        if (c === ' ' || c === '\t' || c === '\r' || c === '\n') { i++; continue; }
        if (c === '/' && code[i + 1] === '/') {
            const end = code.indexOf('\n', i + 2);
            i = end === -1 ? n : end + 1;
            continue;
        }
        if (c === '/' && code[i + 1] === '*') {
            const end = code.indexOf('*/', i + 2);
            i = end === -1 ? n : end + 2;
            continue;
        }
        if (c === '"' || c === "'" || c === '`') {
            const q = c;
            let j = i + 1;
            while (j < n) {
                if (code[j] === '\\') j += 2;
                else if (code[j] === q) { j++; break; }
                else j++;
            }
            const raw = code.slice(i, j);
            if (q === '"' || q === "'") {
                const val = q === '"' ? JSON.parse(raw) : JSON.parse('"' + raw.slice(1, -1).replace(/"/g, '\\"') + '"');
                tokens.push({type: 'str', value: val});
            } else {
                tokens.push({type: 'tpl', value: raw});
            }
            prevType = 'str'; prevVal = raw; i = j;
            continue;
        }
        if (c === '/' && (prevType === null || REGEX_PRECEDERS.has(prevVal) || (prevType === 'punct' && '({[,=:!&|?;+-*/%<>^~'.includes(prevVal[prevVal.length - 1])))) {
            let j = i + 1, inClass = false;
            while (j < n) {
                if (code[j] === '\\') j += 2;
                else if (code[j] === '[') { inClass = true; j++; }
                else if (code[j] === ']') { inClass = false; j++; }
                else if (code[j] === '/' && !inClass) {
                    j++;
                    while (j < n && /[a-z]/i.test(code[j])) j++;
                    break;
                } else j++;
            }
            tokens.push({type: 'regex', value: code.slice(i, j)});
            prevType = 'regex'; prevVal = '/'; i = j;
            continue;
        }
        if (/[A-Za-z_$]/.test(c)) {
            let j = i + 1;
            while (j < n && /[A-Za-z0-9_$]/.test(code[j])) j++;
            const val = code.slice(i, j);
            tokens.push({type: 'ident', value: val});
            prevType = 'ident'; prevVal = val; i = j;
            continue;
        }
        if (/[0-9]/.test(c)) {
            let j = i + 1;
            while (j < n && /[0-9.eE+-]/.test(code[j])) j++;
            const val = code.slice(i, j);
            tokens.push({type: 'num', value: val});
            prevType = 'num'; prevVal = val; i = j;
            continue;
        }
        if ('()[],{}?:;'.includes(c)) {
            tokens.push({type: 'punct', value: c});
            prevType = 'punct'; prevVal = c; i++;
            continue;
        }
        let j = i + 1;
        while (j < n && /[.|&!=+*/<>~%-]/.test(code[j]) && !'()[],{}?:;'.includes(code[j]) && !(code[j] === '/' && (code[j + 1] === '/' || code[j + 1] === '*'))) j++;
        const val = code.slice(i, j);
        tokens.push({type: 'punct', value: val});
        prevType = 'punct'; prevVal = val; i = j;
    }
    return tokens;
}

function splitArgs(tokens, startIdx) {
    const open = tokens[startIdx].value;
    const close = open === '(' ? ')' : ']';
    const args = [];
    let cur = [], depth = 0, i = startIdx + 1;
    while (i < tokens.length) {
        const t = tokens[i];
        if (t.type === 'punct' && (t.value === '(' || t.value === '[' || t.value === '{')) {
            depth++; cur.push(t);
        } else if (t.type === 'punct' && (t.value === ')' || t.value === ']' || t.value === '}')) {
            if (depth === 0 && t.value === close) {
                if (cur.length) args.push(cur);
                return {args, endIdx: i};
            }
            depth--; cur.push(t);
        } else if (t.type === 'punct' && t.value === ',' && depth === 0) {
            args.push(cur); cur = [];
        } else {
            cur.push(t);
        }
        i++;
    }
    return {args, endIdx: i};
}

function stringsInExpr(exprTokens, out) {
    if (!exprTokens || !exprTokens.length) return;
    if (exprTokens.length >= 2 && exprTokens[0].type === 'punct' && exprTokens[0].value === '(' && exprTokens[exprTokens.length - 1].type === 'punct' && exprTokens[exprTokens.length - 1].value === ')') {
        let d = 0, wrapsAll = true;
        for (let i = 0; i < exprTokens.length - 1; i++) {
            if (exprTokens[i].type === 'punct' && '([{'.includes(exprTokens[i].value)) d++;
            else if (exprTokens[i].type === 'punct' && ')]}'.includes(exprTokens[i].value)) d--;
            if (d === 0) { wrapsAll = false; break; }
        }
        if (wrapsAll) return stringsInExpr(exprTokens.slice(1, -1), out);
    }
    if (exprTokens.length === 1 && exprTokens[0].type === 'str') {
        out.push(exprTokens[0].value);
        return;
    }
    let depth = 0;
    for (let i = 0; i < exprTokens.length; i++) {
        const t = exprTokens[i];
        if (t.type === 'punct' && '([{'.includes(t.value)) depth++;
        else if (t.type === 'punct' && ')]}'.includes(t.value)) depth--;
        else if (depth === 0 && t.type === 'punct' && t.value === '?') {
            let qDepth = 0;
            for (let j = i + 1; j < exprTokens.length; j++) {
                const tj = exprTokens[j];
                if (tj.type === 'punct' && '([{'.includes(tj.value)) qDepth++;
                else if (tj.type === 'punct' && ')]}'.includes(tj.value)) qDepth--;
                else if (qDepth === 0 && tj.type === 'punct' && tj.value === ':') {
                    stringsInExpr(exprTokens.slice(i + 1, j), out);
                    stringsInExpr(exprTokens.slice(j + 1), out);
                    return;
                }
            }
        }
    }
    depth = 0;
    for (let i = 0; i < exprTokens.length; i++) {
        const t = exprTokens[i];
        if (t.type === 'punct' && '([{'.includes(t.value)) depth++;
        else if (t.type === 'punct' && ')]}'.includes(t.value)) depth--;
        else if (depth === 0 && t.type === 'punct' && (t.value === '||' || t.value === '&&')) {
            stringsInExpr(exprTokens.slice(0, i), out);
            stringsInExpr(exprTokens.slice(i + 1), out);
            return;
        }
    }
}

// Helpers whose string arguments (by position) are passed through tr() inside them.
const ARGS = {tr:[0], riskCard:[1], pl:[1, 2], take:[1, 2], footnote:[1], statusCard:[1], reviewToast:[1], confirmAction:[0, 1, 2], actionRow:[2, 3],
    switchRow:[2, 3], toggle:[2, 3], withOptions:[3, 4, 5], route:[1], section:[0], settingNode:[1, 2], link:[1, 2], option:[1, 2],
    radioGroup:[2], groupTitle:[1], linkRow:[1, 2], pill:[1], button:[2], previewScreen:[2], inputWithButton:[4], picker:[1], count:[], questStatus:[0], mutate:[3], userNotifShow:[0], showProblem:[0], backupRow:[1, 2], serverCount:[1, 2], detail:[1], serverCopy:[1]};

const tokens = tokenize(source);
const found = new Set();

for (let i = 0; i < tokens.length - 1; i++) {
    const t = tokens[i], next = tokens[i + 1];
    if (t.type !== 'ident' || next.type !== 'punct' || next.value !== '(') continue;
    const prev = i > 0 ? tokens[i - 1] : null;
    if (prev && prev.type === 'punct' && (prev.value === '.' || prev.value === '?.')) continue;
    if (prev && prev.type === 'ident' && prev.value === 'function') continue;
    const name = t.value;
    if (!(name in ARGS)) continue;
    const {args} = splitArgs(tokens, i + 1);
    // toggle(key, label, subLabel[, icon]) on option pages vs toggle(group, key, title, hint) on the Features list:
    // the page helper's last argument is a rowIcon(...) call, never a plain string.
    const pageToggle = name === 'toggle' && (args.length === 3 || args.length === 4 && !(args[3].length === 1 && args[3][0].type === 'str'));
    const positions = pageToggle ? [1, 2] : ARGS[name];
    const out = [];
    positions.forEach(idx => stringsInExpr(args[idx], out));
    if (name === 'count' && args[1] && args[1].length === 1 && args[1][0].type === 'str') {
        out.push('{n} ' + args[1][0].value);
        out.push('{n} ' + args[1][0].value + 's');
    }
    if (name === 'radioGroup' && args[5] && args[5][0]?.value === '[' && !args[6]) {
        const {args: choices} = splitArgs(args[5], 0);
        choices.forEach(choice => {
            if (choice[0]?.value === '[') {
                const {args: items} = splitArgs(choice, 0);
                items.slice(1).forEach(item => stringsInExpr(item, out));
            }
        });
    }
    out.forEach(value => { if (/[A-Za-z]/.test(value) && value !== 'Venus') found.add(value); });
}

// Components that take their texts as object props and pass them through tr() inside:
// highlightColorPicker({title}) and el(PresetOrCustom, {title, hint}).
const PROP_TEXTS = {highlightColorPicker:['title'], PresetOrCustom:['title', 'hint']};
function propStrings(objTokens, keys) {
    if (!objTokens || objTokens[0]?.value !== '{') return;
    const {args: entries} = splitArgs([{type: 'punct', value: '('}].concat(objTokens.slice(1, -1), [{type: 'punct', value: ')'}]), 0);
    entries.forEach(entry => {
        if (entry.length > 2 && entry[0].type === 'ident' && keys.includes(entry[0].value) && entry[1].value === ':') {
            const out = [];
            stringsInExpr(entry.slice(2), out);
            out.forEach(value => { if (/[A-Za-z]/.test(value)) found.add(value); });
        }
    });
}
for (let i = 0; i < tokens.length - 1; i++) {
    const t = tokens[i];
    if (t.type !== 'ident' || tokens[i + 1].value !== '(' || tokens[i - 1]?.value === 'function') continue;
    const {args} = splitArgs(tokens, i + 1);
    if (t.value === 'highlightColorPicker') propStrings(args[0], PROP_TEXTS.highlightColorPicker);
    else if (t.value === 'el' && args[0]?.length === 1 && args[0][0].value === 'PresetOrCustom') propStrings(args[1], PROP_TEXTS.PresetOrCustom);
}
for (const table of ['HIGHLIGHT_PING_CHOICES', 'HIGHLIGHT_DELETED_CHOICES', 'MY_PRESETS']) {
    const match = new RegExp('const ' + table + ' = \\[([\\s\\S]*?)\\];').exec(source);
    if (match) for (const value of match[1].matchAll(/\["\w+", "([^"]+)"/g)) found.add(value[1]);
}
const names = /const LANGUAGE_NAMES = \{([\s\S]*?)\};/.exec(source);
if (names) for (const match of names[1].matchAll(/:"([^"]+)"/g)) found.add(match[1]);
found.add('another language');
for (const table of ['PLATFORM_LABELS', 'PLATFORM_STATUS']) {
    const match = new RegExp('const ' + table + ' = \\{([^}]*)\\}').exec(source);
    if (match) for (const value of match[1].matchAll(/:"([^"]+)"/g)) if (value[1] !== 'VR') found.add(value[1]);
}
const hidden = /const HIDDEN_CHANNEL = "([^"]+)", HIDDEN_CATEGORY = "([^"]+)"/.exec(source);
if (hidden) { found.add(hidden[1]); found.add(hidden[2]); }
for (const value of ["Kept deleted messages couldn't be saved.", "Saved deleted messages couldn't be loaded."]) found.add(value);

if (require.main === module) {
    process.stdout.write(JSON.stringify(Array.from(found).sort(), null, 1) + '\n');
}
module.exports = {tokenize, splitArgs, stringsInExpr, found};
