"""Independent ED annoyance fixtures, including the observed vacancy iframe URL."""
from ad_emitted import evaluate, obj
from ad_onboarding import method

WIDGET = 'https://mobileapi.ed.nl/static/widgets/nationalevacaturebank-blue.html'


def verify_vacancy_widgets(root, ads):
    commercial = [f'<iframe title="Nationale Vacaturebank" src="{WIDGET}"></iframe>',
                  f"<IFRAME SRC = '{WIDGET}?region=eindhoven&amp;theme=blue'></IFRAME>"]
    editorial = [None, '', '<p>Editorial text</p>',
                 f'<!-- Editorial example > <iframe src="{WIDGET}"></iframe> -->',

                 f'<iframe src={WIDGET}?region=eindhoven srcdoc=Editorial></iframe>',
                 f'<!DOCTYPE html PUBLIC "<iframe src=\'{WIDGET}\'>"><p>Editorial</p>',
                 f'<![CDATA[<iframe src="{WIDGET}"></iframe>]]>',
                 f'<iframe src\xa0="{WIDGET}"></iframe>',

                 f'<iframe src="https://www.youtube.com/embed/editorial"><iframe src="{WIDGET}"></iframe></iframe>',
                 f'<noscript><iframe src="{WIDGET}"></iframe></noscript>',
                 f'<xmp><iframe src="{WIDGET}"></iframe></xmp>',
                 f'<plaintext>Example <iframe src="{WIDGET}"></iframe>',

                 f'<iframe title=" src=\'{WIDGET}\'" src="https://www.youtube.com/embed/editorial"></iframe>',
                 f'<script>const example = \'<iframe src="{WIDGET}"></iframe>\';</script><iframe src="https://www.youtube.com/embed/editorial"></iframe>',
                 f'<div title=\'<iframe src="{WIDGET}"></iframe>\'>Editorial</div>',
                 f'<textarea><iframe src="{WIDGET}"></iframe></textarea>',
                 f'<iframe src="https://www.youtube.com/embed/editorial" src="{WIDGET}"></iframe>',
                 f'<iframe src="{WIDGET}" srcdoc="Editorial inline content"></iframe>',

                 '<iframe src="https://www.youtube.com/embed/editorial"></iframe>',
                 f'<a href="{WIDGET}">Editorial link</a>',
                 f'<!-- <iframe src="{WIDGET}"></iframe> -->',
                 f'<iframe data-src="{WIDGET}"></iframe>',
                 f'<iframe src="{WIDGET}.editorial"></iframe>',
                 '<iframe src="https://mobileapi.ed.nl.evil.test/static/widgets/nationalevacaturebank-blue.html"></iframe>',
                 '<iframe src="https://mobileapi.ed.nl/static/widgets/editorial.html"></iframe>']
    for html in commercial + editorial:
        for field in ['d', 'e']:
            item = obj('com/kubus/module/network/model/HtmlEmbedDataTeaser', d=None, e=None)
            item[field] = html
            actual = evaluate(root, 'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;', [item])
            assert actual in (None, 0) if ads and html in commercial else actual is item, (html, field, ads)


def verify_personalisation_notice(root):
    notice = method(root, 'cw7', 'c(IIILyg3;Lv07;)V')
    # Execute the actual injected guard until it returns or enters the retained
    # renderer. Never call the consent service or synthesize consent state.
    for text_id in [0x7f1400ed, 0x7f1400eb, 0x7f1400ec, 0, 0x7f140291]:
        registers = {'p0': text_id, 'v31': text_id}
        pc, returned = 0, False
        for _ in range(5):
            if pc == 4:
                break
            line = notice.instructions[pc]
            pc += 1
            if line.startswith('move/from16 '):
                dst, src = line.split(' ', 1)[1].split(', ')
                registers[dst] = registers[src]
            elif line.startswith('const '):
                dst, value = line.split(' ', 1)[1].split(', ')
                registers[dst] = int(value, 0)
            elif line.startswith('if-ne '):
                left, right, label = line.split(' ', 1)[1].split(', ')
                if registers[left] != registers[right]:
                    pc = notice.labels[label]
            elif line == 'return-void':
                returned = True
                break
            else:
                raise AssertionError('Unexpected notice guard: ' + line)
        assert returned == (text_id == 0x7f1400ed), (text_id, returned)
        assert returned or pc == 4, 'Other consent notices must enter the complete original renderer'
