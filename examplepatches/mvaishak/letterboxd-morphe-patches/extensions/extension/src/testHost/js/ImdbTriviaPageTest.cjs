const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const vm = require('node:vm');

const java = fs.readFileSync(path.resolve(__dirname,
    '../../main/java/app/template/extension/trivia/ImdbTriviaPage.java'), 'utf8');
const snapshot = java.match(/String SNAPSHOT = """([\s\S]*?)""";/)[1];

function page({ spoilerOnly = false } = {}) {
    const window = {};
    const sections = new Map(spoilerOnly ? [] : [
        ['uncategorized', { count: 5, more: true }],
        ['cameo', { count: 1, more: false }],
    ]);
    const clicks = [];
    let showSpoilers = true;
    let now = 1000;
    const button = key => ({ disabled: false, click: () => clicks.push(key) });
    const document = {
        querySelector(selector) {
            return selector === '.splr_show button' && showSpoilers ? button('@spoilers') : null;
        },
        querySelectorAll() {
            return [...sections].map(([key, { count, more }]) => ({
                getAttribute: () => 'sub-section-' + key,
                querySelectorAll: () => Array.from({ length: count }, () => ({ textContent: 'Fixture', innerText: 'Fixture', innerHTML: 'Fixture' })),
                querySelector: () => more ? button(key) : null,
            }));
        },
    };
    return {
        clicks,
        sections,
        allowPagination(value) { window.__morpheTriviaMayClick = value; },
        hideExpander() { showSpoilers = false; },
        loadSpoilers(count, more) {
            showSpoilers = false;
            sections.set('uncategorized--spoilers', { count, more });
        },
        advance(milliseconds) { now += milliseconds; },
        read(previewLimit = 0) {
            window.__morpheTriviaPreviewLimit = previewLimit;
            return JSON.parse(vm.runInNewContext(snapshot, { window, document, Date: { now: () => now } }));
        },
    };
}

test('counts named categories and alternates pagination across spoiler and non-spoiler sections', () => {
    const p = page();
    assert.deepEqual(p.read().groups, { uncategorized: 5, cameo: 1 });
    assert.equal(p.read().waiting, true);
    assert.deepEqual(p.clicks, ['@spoilers']);

    p.loadSpoilers(5, true);
    p.read();
    p.sections.set('uncategorized', { count: 55, more: true });
    p.read();
    assert.deepEqual(p.clicks, ['@spoilers', 'uncategorized', 'uncategorized--spoilers']);
    p.sections.set('uncategorized--spoilers', { count: 11, more: false });
    p.sections.set('uncategorized', { count: 55, more: false });
    assert.deepEqual(p.read().groups, { uncategorized: 55, cameo: 1, 'uncategorized--spoilers': 11 });
    assert.equal(p.read().hasMore, false);
});

test('a failed expansion is retried once and does not block other available sections', () => {
    const p = page();
    p.read();
    p.advance(4001);
    p.read();
    assert.deepEqual(p.clicks, ['@spoilers', 'uncategorized']);
    p.sections.set('uncategorized', { count: 9, more: false });
    p.read();
    p.advance(4001);
    assert.equal(p.read().stalled, true);
    assert.deepEqual(p.clicks, ['@spoilers', 'uncategorized', '@spoilers']);
    assert.equal(p.read().entries, 10);
});

test('a vanished expander without a count increase remains partial', () => {
    const p = page();
    p.read();
    p.hideExpander();
    p.sections.set('uncategorized', { count: 5, more: false });
    p.advance(4001);
    assert.equal(p.read().stalled, true);
    assert.equal(p.read().hasMore, false);
});

test('the spoiler expander works with no visible non-spoiler entries', () => {
    const p = page({ spoilerOnly: true });
    assert.equal(p.read().entries, 0);
    assert.deepEqual(p.clicks, ['@spoilers']);
    p.loadSpoilers(3, false);
    const result = p.read();
    assert.equal(result.entries, 3);
    assert.equal(result.stalled, false);
});

test('an explicit empty message is distinct from an unrecognized document', () => {
    const window = {};
    const document = {
        querySelector: selector => selector === 'main' ? { innerText: 'No trivia for this title' } : null,
        querySelectorAll: () => [],
    };
    assert.equal(JSON.parse(vm.runInNewContext(snapshot, { window, document })).empty, true);
    document.querySelector = () => null;
    assert.equal(JSON.parse(vm.runInNewContext(snapshot, { window, document })).empty, false);
});

test('delivers the initial document entries while pagination is still in flight', () => {
    const p = page();
    const first = p.read();
    assert.equal(first.waiting, true);
    assert.deepEqual(first.preview.map(section => [section.key, section.texts.length]),
        [['uncategorized', 5], ['cameo', 1]]);
    p.loadSpoilers(5, true);
    assert.equal(p.read().preview, undefined);
});

test('spoiler-only trivia can produce a first snapshot after its expander loads', () => {
    const p = page({ spoilerOnly: true });
    assert.equal(p.read().preview, undefined);
    p.loadSpoilers(3, false);
    assert.equal(p.read().preview[0].key, 'uncategorized--spoilers');
});


test('preview is available before the document is ready to paginate', () => {
    const p = page();
    p.allowPagination(false);
    const initial = p.read();
    assert.ok(initial.preview.length);
    assert.equal(initial.hasMore, true);
    assert.deepEqual(p.clicks, []);
    p.allowPagination(true);
    p.read();
    assert.deepEqual(p.clicks, ['@spoilers']);
});

test('a late expander gets a chance to mount before the page is marked complete', () => {
    const p = page();
    p.hideExpander();
    p.sections.set('uncategorized', { count: 5, more: false });
    p.allowPagination(false);
    assert.equal(p.read().readyToFinish, false);
    p.advance(900);
    p.allowPagination(true);
    assert.equal(p.read().readyToFinish, false);

    p.sections.set('uncategorized', { count: 5, more: true });
    p.advance(300);
    assert.equal(p.read().readyToFinish, false);
    assert.deepEqual(p.clicks, ['uncategorized']);
    p.sections.set('uncategorized', { count: 15, more: false });
    assert.equal(p.read().readyToFinish, false);
    p.advance(300);
    assert.equal(p.read().readyToFinish, true);
});

test('preload emits only three non-spoiler-first entries and never clicks through', () => {
    const p = page({ spoilerOnly: true });
    p.loadSpoilers(5, true);
    p.sections.set('cameo', { count: 5, more: true });
    const preview = p.read(3);
    assert.deepEqual(preview.preview.map(section => [section.key, section.texts.length]), [['cameo', 3]]);
    assert.deepEqual(p.clicks, []);
    const opened = p.read();
    assert.deepEqual(opened.preview.map(section => [section.key, section.texts.length]),
        [['uncategorized--spoilers', 5], ['cameo', 5]]);
    assert.equal(p.clicks.length, 1);
});
