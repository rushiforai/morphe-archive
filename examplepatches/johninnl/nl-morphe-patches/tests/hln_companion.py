"""Verify only observed publisher companion-banner HTML carriers are removed.

The observed DOM summary names widget-companion-banner and the exact Midterms
iframe URL. Markup below reconstructs those observations; it is not a retained
publisher response and does not identify the separate Beste Gemeente payload.
"""
import argparse
from dataclasses import replace
from pathlib import Path

from hln_contracts import MODEL, OWNER, TYPE
from hln_emitted import evaluate, obj
from hln_onboarding import digest, method, source


HTML = MODEL + 'HtmlEmbedDataTeaser'
NORMALIZE = 'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;'
PREDICATE = 'morpheCompanion(Ljava/lang/Object;)Z'
TEXT = 'morpheCompanionText(Ljava/lang/String;)Z'
RETAINED_NORMALIZE = 'morpheNormalizeOriginal(Ljava/lang/Object;)Ljava/lang/Object;'
URL = 'https://valley.hln.be/custom-build/hln/20261027-companionbanner-midterms/'
OBSERVED_RECONSTRUCTION = '<div class="widget widget-companion-banner"><iframe class="valley" src="' + URL + '"></iframe></div>'
V4_NORMALIZER = '736516a4b53a644545ea1eb2f3f7ff6a554d403d58f64b34516f262434dfbbe5'
RETAINED = [
    (HTML, '<init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/util/List;)V', 'db4447c5a4df3c8aa5631ec8b9749ed75435ebc169906e29a81dc3a8f3f49547'),
    (HTML, 'toString()Ljava/lang/String;', 'd9d2213c19273ea146a82b1e4cf1e6e20a2a18f31c6004d986ae9162f931c3d4'),
    ('s72', 'r(Lcom/kubus/module/network/model/TeaserBlock;Lk9f;Lm9f;Lk8f;Lgo8;ZZLtg3;I)V', '1dada266b2af89d41d406264b3d2b652c81922f86c20e54907a342f5c8f26f7c'),
    ('wwh', 'e(Ldmb;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V', '03c374fbfe1e02095cd04a89cff0589d8bb760fbd6e3013a40f50f62e6db0773'),
    ('uec', 'D(Lcom/kubus/module/network/model/TeaserBlock;)I', '17d011b5d399fd5bb62d4d02caee3ff46a7cc184156e8c9821601f8ae55a4294'),
]


def literal_safe_contract(body):
    # CSS literals such as ':root' are data, not Smali branch labels.
    strings = {i: line.replace('const-string/jumbo ', 'const-string ') for i, line in enumerate(body.instructions)
               if line.startswith(('const-string ', 'const-string/jumbo '))}
    masked = replace(body, instructions=['nop' if i in strings else line for i, line in enumerate(body.instructions)])
    contract = masked.canonical()
    for i, line in strings.items():
        contract['instructions'][i] = line
    return contract


def exercise_companions(root, enabled):
    positives = [
        OBSERVED_RECONSTRUCTION,
        '<section class="widget-companion-banner">campaign</section>',
        '<DIV CLASS = "widget widget-companion-banner">campaign</DIV>',
        "<div class=' widget\twidget-companion-banner  valley '>campaign</div>",
        '<iframe src="' + URL + '"></iframe>',
        "<iframe src='" + URL + "?mode=dark#top'></iframe>",
        URL,
    ]
    negatives = [
        None, '', '<p>ordinary editorial HTML</p>',
        '<iframe src="https://valley.hln.be/custom-build/hln/20261027-election-chart/"></iframe>',
        'https://valley.hln.be/custom-build/hln/20261027-election-chart/',
        '<div class="widget-companion-banner-editorial">chart</div>',
        '<div class="editorial-widget-companion-banner">chart</div>',
        '<div data-class="widget-companion-banner">chart</div>',
        '<div data-example=\' class="widget-companion-banner"\'>editorial chart</div>',
        '<div title="<iframe src=\'' + URL + '\'></iframe>">editorial chart</div>',
        '<div data-example="<span class=\'widget-companion-banner\'>">editorial chart</div>',
        '<div class="ordinary src=\'' + URL + '\'">editorial chart</div>',
        '<p>widget-companion-banner</p>',
        '<!-- <div class="widget-companion-banner">unused template</div> --><div class="editorial-chart"></div>',
        '<script>const example = \'<div class="widget-companion-banner">\';</script><div class="editorial-chart"></div>',
        '<style>/* <iframe src="' + URL + '"></iframe> */</style><div class="editorial-chart"></div>',
        '<a href="' + URL + '">article discussing the campaign</a>',
        '<iframe src="https://valley.hln.be.evil.example/custom-build/hln/20261027-companionbanner-midterms/"></iframe>',
        '<iframe src="https://evil.example/valley.hln.be/custom-build/hln/20261027-companionbanner-midterms/"></iframe>',
    ]
    for text in positives + negatives:
        actual = evaluate(root, TEXT, [text])
        assert bool(actual) == (text in positives), 'Class token/companion URL scope: ' + str(text)
    editorial = obj(MODEL + 'ParagraphComponent', id='editorial')
    carrier = obj(HTML, d=OBSERVED_RECONSTRUCTION, e=None, f=None, g=360)
    chart = obj(HTML, d=negatives[3], e=None, f=None, g=360)
    for field in ['d', 'e', 'f']:
        for text in positives + negatives:
            value = obj(HTML, d=None, e=None, f=None, g=360)
            value[field] = text
            actual = evaluate(root, PREDICATE, [value])
            assert bool(actual) == (enabled and text in positives), 'HtmlEmbed field/selection scope: ' + field
    other = obj(MODEL + 'ArticleTeaserComponent', b=None, d=OBSERVED_RECONSTRUCTION)
    for value in [None, editorial, other]:
        assert not evaluate(root, PREDICATE, [value]), 'Never remove non-HtmlEmbed editorial objects'
    values = [editorial, carrier, chart]
    actual = evaluate(root, 'morpheFilter(Ljava/util/List;)Ljava/util/List;', [values])
    expected = [editorial, chart] if enabled else values
    assert actual == expected and actual is not values and values == [editorial, carrier, chart], 'Keep input and editorial order/identity'
    assert actual[0] is editorial and actual[-1] is chart, 'Retain unrelated editorial Valley/HTML carriers by identity'


def verify_companion(root, enabled):
    for cls, sig, expected in RETAINED:
        assert digest(literal_safe_contract(method(root, cls, sig))) == expected, 'HLN editorial HTML renderer/DTO changed: ' + cls
    text = source(root, OWNER)
    present = ' ' + PREDICATE in text and ' ' + TEXT in text
    assert present == enabled, 'HLN missing scoped companion-banner filter' if enabled else 'Unexpected companion filter without Hide ads'
    if not enabled:
        return
    normalizer = method(root, OWNER, NORMALIZE)
    expected = ['invoke-static {p0}, ' + TYPE + '->' + PREDICATE, 'move-result v0',
                'if-eqz v0, @5', 'const/4 v0, 0x0', 'return-object v0',
                'invoke-static {p0}, ' + TYPE + '->' + RETAINED_NORMALIZE, 'move-result-object v0', 'return-object v0']
    assert normalizer.canonical()['instructions'] == expected, 'HLN companion wrapper must return or delegate exactly once'
    verify_retained_normalizer(root)
    exercise_companions(root, enabled=True)


def verify_retained_normalizer(root):
    assert digest(method(root, OWNER, RETAINED_NORMALIZE).canonical()) == V4_NORMALIZER, 'HLN retain entire v4 normalizer with original branch targets'


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('decoded_root', type=Path)
    parser.add_argument('--enabled', action='store_true')
    args = parser.parse_args()
    verify_companion(args.decoded_root, args.enabled)
    print('HLN companion verification passed: ' + ('scoped filter' if args.enabled else 'original'))
