// 「チャット仕立て」版（16:9、1920×1080、30fps、音声なし、約 28 秒）。
// 紹介そのものを、画面中央で進む A と B の会話として見せる。会話は背景の上に直接並べ、
// アプリの枠や端末の枠は描かない。B が送る「写真」（モック画面）を拡大して Before / After と操作を見せ、
// A の吹き出しに既読がつかない → 「すべて既読にする」でまとめて既読がつく、を山場にする。
// 人物・トークは架空。素材は -mock 画像と line-*.png だけを使う。
import React from 'react';
import {AbsoluteFill, Easing, Img, Sequence, interpolate, spring, staticFile, useCurrentFrame, useVideoConfig} from 'remotion';
import {Layer, MARKS, MarkAllReadScreen, Mark, OpenWithoutReceiptScreen, SW, ScreenBox, widthFor} from '../shared/screens';

// 色とフォントはここだけ。明るい紙色、藍の吹き出し、既読は朱
const C = {
  paper: '#F3EEE4',
  card: '#FFFDF8',
  ink: '#1E1B16',
  ink2: '#5C5549',
  ink3: '#8C8473',
  rule: '#D8CFBE',
  me: '#26336A',
  meInk: '#F7F3EA',
  avatar: '#D9A23E',
  read: '#C8452B',
  font: "'Hiragino Sans', sans-serif",
};

const FPS = 30;
const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;
const lerp = (a: number, b: number, t: number) => a + (b - a) * t;
const sp = (f: number, config: {damping?: number; stiffness?: number; mass?: number} = {}) =>
  spring({frame: f, fps: FPS, config: {damping: 200, stiffness: 170, mass: 1, ...config}});
const pop = (f: number) => sp(f, {damping: 11, stiffness: 230, mass: 0.6});

// ---------- 会話の台本 ----------

type Side = 'me' | 'b';
type Item =
  | {kind: 'text'; side: Side; text: string; at: number; typing?: number; readAt?: number; ghostAt?: number; time: string; big?: boolean}
  | {kind: 'photo'; id: 'talk' | 'demo'; at: number; time: string}
  | {kind: 'pair'; at: number; time: string}
  | {kind: 'note'; text: string; at: number};

const TALK_EXPAND = {start: 58, end: 158};
const DEMO_EXPAND = {start: 308, end: 416};
const PANEL = {start: 494, end: 636};
const MARK_READ = 562; // B が「すべて既読にする」を押した直後
const END = 730;
const END_LEN = 110;
export const CHAT_TOTAL = END + END_LEN;

const ITEMS: Item[] = [
  {kind: 'text', side: 'me', text: 'ねえ', at: -24, readAt: 12, time: '21:40'},
  {kind: 'text', side: 'me', text: '広告とか AI のアイコン、\n多くない？', at: -10, readAt: 12, time: '21:40'},
  {kind: 'text', side: 'b', text: 'わかる。だから消した', typing: 12, at: 32, time: '21:41'},
  {kind: 'photo', id: 'talk', at: 46, time: '21:41'},
  {kind: 'text', side: 'me', text: 'え、すっきり！', at: 176, readAt: 186, time: '21:42'},
  {kind: 'text', side: 'b', text: 'ホームも', typing: 186, at: 202, time: '21:42'},
  {kind: 'pair', at: 214, time: '21:42'},
  {kind: 'text', side: 'me', text: 'あと、既読つけずに\n読みたいとき、ない？', at: 256, readAt: 268, time: '21:43'},
  {kind: 'text', side: 'b', text: 'ある', typing: 268, at: 284, time: '21:43'},
  {kind: 'photo', id: 'demo', at: 296, time: '21:43'},
  {kind: 'note', text: 'B は、既読をつけずに開き直した', at: 434},
  {kind: 'text', side: 'me', text: 'じゃあ送ってみる', at: 448, ghostAt: 486, readAt: MARK_READ, time: '21:45'},
  {kind: 'text', side: 'me', text: '読んだ？', at: 462, ghostAt: 489, readAt: MARK_READ + 3, time: '21:45'},
  {kind: 'text', side: 'me', text: 'おーい', at: 474, ghostAt: 492, readAt: MARK_READ + 6, time: '21:46'},
  {kind: 'text', side: 'b', text: '読み終えたから、\nまとめて既読にした', typing: 626, at: 642, time: '21:46'},
  {kind: 'text', side: 'me', text: 'それ、なに？', at: 664, readAt: 674, time: '21:46'},
  {kind: 'text', side: 'b', text: 'Linimal', typing: 674, at: 690, time: '21:47', big: true},
];

// ---------- 会話の配置 ----------

const COL_L = 520;
const COL_R = 1400;
const AV = 92; // アバターの列
const BOTTOM = 1010;
const GAP = 22;
const FS = 46;
const LH = 66;
const PADY = 24;
const BIG_FS = 76;
const BIG_LH = 100;
const TYPE_H = 96;
const THUMB_H = 360;
const NOTE_H = 64;

const lines = (t: string) => t.split('\n').length;
const heightOf = (it: Item) => {
  switch (it.kind) {
    case 'text':
      return it.big ? BIG_LH + PADY * 2 : lines(it.text) * LH + PADY * 2;
    case 'photo':
      return THUMB_H + 20;
    case 'pair':
      return THUMB_H + 20 + 46;
    case 'note':
      return NOTE_H;
  }
};
const startOf = (it: Item) => (it.kind === 'text' && it.typing !== undefined ? it.typing : it.at);

// 積み上がった高さ。入力中の「…」は小さい高さで入り、本文が届くと本来の高さへ伸びる
const effHeight = (it: Item, f: number) => {
  const full = heightOf(it) + GAP;
  if (it.kind === 'text' && it.typing !== undefined) {
    if (f < it.typing) return 0;
    const t = TYPE_H + GAP;
    if (f < it.at) return t * sp(f - it.typing);
    return t + (full - t) * sp(f - it.at);
  }
  if (f < it.at) return 0;
  return full * sp(f - it.at);
};

// 各項目の上端（画面座標）。下端を BOTTOM に固定し、新しいものが来るたびに上へ流れる
const topsAt = (f: number) => {
  const tops: number[] = new Array(ITEMS.length);
  let y = BOTTOM;
  for (let i = ITEMS.length - 1; i >= 0; i--) {
    y -= effHeight(ITEMS[i], f);
    tops[i] = y;
  }
  return tops;
};

const thumbRect = (index: number, f: number) => ({left: COL_L + AV + 10, top: topsAt(f)[index] + 10, h: THUMB_H});
const TALK_INDEX = ITEMS.findIndex((it) => it.kind === 'photo' && it.id === 'talk');
const DEMO_INDEX = ITEMS.findIndex((it) => it.kind === 'photo' && it.id === 'demo');

// ---------- 吹き出し ----------

// 角の 1 つだけを小さくした独自の形（尻尾は付けない）
const bubbleShape = (side: Side) => (side === 'me' ? '30px 30px 8px 30px' : '30px 30px 30px 8px');

const Avatar: React.FC = () => (
  <div style={{width: 72, height: 72, borderRadius: 24, background: C.avatar, color: C.ink, fontSize: 36, fontWeight: 800, display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0}}>
    B
  </div>
);

const Meta: React.FC<{f: number; it: Extract<Item, {kind: 'text'}> | {time: string}; align: 'left' | 'right'}> = ({f, it, align}) => {
  const readAt = 'readAt' in it ? it.readAt : undefined;
  const ghostAt = 'ghostAt' in it ? it.ghostAt : undefined;
  const read = readAt !== undefined && f >= readAt;
  const ghost = ghostAt !== undefined && f >= ghostAt && !read;
  const rp = readAt !== undefined ? pop(f - readAt) : 0;
  const gp = ghostAt !== undefined ? interpolate(f - ghostAt, [0, 8], [0, 1], clamp) : 0;
  const blink = ghost ? 0.55 + 0.45 * Math.cos((f - (ghostAt ?? 0)) * 0.25) : 1;
  return (
    <div style={{display: 'flex', flexDirection: 'column', alignItems: align === 'left' ? 'flex-end' : 'flex-start', gap: 2, margin: '0 14px', paddingBottom: 4}}>
      {read ? (
        <div style={{fontSize: 28, fontWeight: 800, color: C.read, transform: `scale(${0.3 + rp * 0.7})`, transformOrigin: '100% 100%', padding: '2px 8px', border: '3px solid transparent'}}>既読</div>
      ) : ghost ? (
        <div style={{fontSize: 28, fontWeight: 700, color: C.ink3, padding: '2px 8px', border: `3px dashed ${C.ink3}`, borderRadius: 10, opacity: gp * blink}}>既読</div>
      ) : null}
      <div style={{fontSize: 24, fontWeight: 500, color: C.ink3}}>{it.time}</div>
    </div>
  );
};

const Typing: React.FC<{f: number}> = ({f}) => (
  <div style={{height: TYPE_H, padding: '0 34px', borderRadius: bubbleShape('b'), background: C.card, border: `2px solid ${C.rule}`, display: 'flex', alignItems: 'center', gap: 14, boxSizing: 'border-box'}}>
    {[0, 1, 2].map((i) => (
      <div key={i} style={{width: 16, height: 16, borderRadius: 8, background: C.ink3, transform: `translateY(${Math.sin((f - i * 4) * 0.4) * -7}px)`}} />
    ))}
  </div>
);

const PhotoBox: React.FC<{h: number; children: React.ReactNode}> = ({h, children}) => (
  <ScreenBox height={h} style={{borderRadius: 16}}>{children}</ScreenBox>
);

const Row: React.FC<{it: Item; index: number; f: number; top: number}> = ({it, index, f, top}) => {
  const fade = interpolate(top, [-240, 40], [0, 1], clamp);
  const p = pop(f - it.at);
  const base: React.CSSProperties = {position: 'absolute', left: COL_L, width: COL_R - COL_L, top, opacity: fade, display: 'flex', alignItems: 'flex-end'};
  if (it.kind === 'note') {
    const o = interpolate(f - it.at, [0, 10], [0, 1], clamp);
    return (
      <div style={{...base, justifyContent: 'center', opacity: fade * o}}>
        <div style={{height: NOTE_H, padding: '0 30px', borderRadius: 32, border: `2px dashed ${C.ink3}`, fontSize: 30, fontWeight: 700, color: C.ink2, display: 'flex', alignItems: 'center', transform: `scale(${0.8 + p * 0.2})`}}>
          {it.text}
        </div>
      </div>
    );
  }
  const side: Side = it.kind === 'text' ? it.side : 'b';
  const prev = ITEMS[index - 1];
  const prevSide = prev && prev.kind !== 'note' ? (prev.kind === 'text' ? prev.side : 'b') : null;
  const showAvatar = side === 'b' && prevSide !== 'b';
  const origin = side === 'me' ? '100% 100%' : '0% 100%';
  const typingNow = it.kind === 'text' && it.typing !== undefined && f < it.at;
  const scale = typingNow ? 0.6 + 0.4 * pop(f - (it.typing ?? 0)) : 0.45 + 0.55 * p;

  let body: React.ReactNode;
  if (typingNow) {
    body = <Typing f={f} />;
  } else if (it.kind === 'text') {
    const isMe = it.side === 'me';
    body = (
      <div style={{
        padding: `${PADY}px ${it.big ? 46 : 34}px`, borderRadius: bubbleShape(it.side), whiteSpace: 'pre', boxSizing: 'border-box',
        background: isMe ? C.me : C.card, color: isMe ? C.meInk : C.ink, border: isMe ? 'none' : `2px solid ${C.rule}`,
        fontSize: it.big ? BIG_FS : FS, lineHeight: `${it.big ? BIG_LH : LH}px`, fontWeight: it.big ? 800 : 600, letterSpacing: it.big ? '-0.02em' : 0,
        height: heightOf(it),
      }}>
        {it.text}
      </div>
    );
  } else if (it.kind === 'photo') {
    const hidden = it.id === 'talk'
      ? f > TALK_EXPAND.start && f < TALK_EXPAND.end + 14
      : f > DEMO_EXPAND.start && f < DEMO_EXPAND.end + 14;
    body = (
      <div style={{padding: 10, borderRadius: bubbleShape('b'), background: C.card, border: `2px solid ${C.rule}`, opacity: hidden ? 0 : 1}}>
        <PhotoBox h={THUMB_H}>
          {it.id === 'talk' ? (
            <Layer src={f >= TALK_EXPAND.end ? 'screenshots/line-talk-list.png' : 'screenshots/line-talk-list-before.png'} />
          ) : (
            <Layer src={f >= DEMO_EXPAND.end ? 'screenshots/chat/room-read-disabled-mock.png' : 'screenshots/chat/scroll-preview-mock.png'} />
          )}
        </PhotoBox>
      </div>
    );
  } else {
    body = (
      <div style={{padding: 10, borderRadius: bubbleShape('b'), background: C.card, border: `2px solid ${C.rule}`, display: 'flex', gap: 10}}>
        {(['line-home-before.png', 'line-home.png'] as const).map((src, i) => (
          <div key={src}>
            <PhotoBox h={THUMB_H}><Layer src={`screenshots/${src}`} /></PhotoBox>
            <div style={{height: 46, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 26, fontWeight: 700, color: i === 0 ? C.read : C.me}}>
              {i === 0 ? '消す前' : '消した後'}
            </div>
          </div>
        ))}
      </div>
    );
  }

  const meta = it.kind === 'text' || it.kind === 'photo' || it.kind === 'pair'
    ? <Meta f={f} it={it as Extract<Item, {kind: 'text'}>} align={side === 'me' ? 'left' : 'right'} />
    : null;
  return (
    <div style={{...base, justifyContent: side === 'me' ? 'flex-end' : 'flex-start'}}>
      {side === 'b' ? <div style={{width: AV, flexShrink: 0, alignSelf: 'flex-start'}}>{showAvatar ? <Avatar /> : null}</div> : null}
      {side === 'me' && !typingNow ? meta : null}
      <div style={{transform: `scale(${scale})`, transformOrigin: origin}}>{body}</div>
      {side === 'b' && !typingNow ? <div style={{opacity: p}}>{meta}</div> : null}
    </div>
  );
};

const Conversation: React.FC = () => {
  const f = useCurrentFrame();
  const tops = topsAt(f);
  return (
    <>
      {ITEMS.map((it, i) => (f >= startOf(it) ? <Row key={i} it={it} index={i} f={f} top={tops[i]} /> : null))}
    </>
  );
};

// ---------- 写真の拡大 ----------

const BIG_H = 940;
const BIG_TOP = 70;
const BIG_LEFT = (1920 - widthFor(BIG_H)) / 2;

const Expand: React.FC<{start: number; end: number; index: number; screen: React.ReactNode; around?: React.ReactNode}> = ({start, end, index, screen, around}) => {
  const f = useCurrentFrame(); // Sequence 内の相対フレーム
  const pIn = sp(f, {damping: 16, stiffness: 150, mass: 0.8});
  const pOut = sp(f - (end - start), {damping: 200, stiffness: 220});
  const p = Math.max(0, pIn - pOut);
  const r = thumbRect(index, start + f);
  const h = lerp(r.h, BIG_H, p);
  const dim = Math.min(1, p) * 0.97;
  return (
    <AbsoluteFill>
      <AbsoluteFill style={{background: C.paper, opacity: dim}} />
      <div style={{opacity: 1 - pOut}}>{around}</div>
      <div style={{position: 'absolute', left: lerp(r.left, BIG_LEFT, p), top: lerp(r.top, BIG_TOP, p)}}>
        <ScreenBox height={h} style={{borderRadius: lerp(16, 30, Math.min(1, p)), outline: `3px solid ${C.ink}`}}>{screen}</ScreenBox>
      </div>
    </AbsoluteFill>
  );
};

// 拡大中に左右へ出す説明
const SideText: React.FC<{at: number; until?: number; x: number; y: number; w: number; small?: string; big: string; size?: number; color?: string}> = ({
  at, until = 100000, x, y, w, small, big, size = 64, color = C.ink,
}) => {
  const f = useCurrentFrame();
  if (f < at || f > until + 10) return null;
  const s = sp(f - at, {damping: 14, stiffness: 180, mass: 0.7});
  const out = interpolate(f, [until, until + 8], [0, 1], clamp);
  return (
    <div style={{position: 'absolute', left: x, top: y, width: w, opacity: Math.min(1, s * 2) * (1 - out), transform: `translateY(${(1 - s) * 40 - out * 30}px)`}}>
      {small ? <div style={{fontSize: 34, fontWeight: 700, color: C.ink2, marginBottom: 14, whiteSpace: 'pre-line', lineHeight: 1.45}}>{small}</div> : null}
      <div style={{fontSize: size, fontWeight: 800, lineHeight: 1.25, letterSpacing: '-0.02em', color, whiteSpace: 'pre'}}>{big}</div>
    </div>
  );
};

const TALK_LABELS = ['上のアイコン', '検索欄の Agent i', '使わないタブ'];
const sweepOf = (f: number) => interpolate(f, [40, 64], [0, 100], {...clamp, easing: Easing.inOut(Easing.cubic)});
const goneOf = (m: Mark, f: number) => interpolate((sweepOf(f) / 100) * SW, [m[0] - 30, m[0] + 60], [0, 1], clamp);

const TalkScreen: React.FC = () => {
  const f = useCurrentFrame();
  const sweep = sweepOf(f);
  return (
    <>
      <Layer src="screenshots/line-talk-list-before.png" />
      <Layer src="screenshots/line-talk-list.png" style={{clipPath: `inset(0 ${100 - sweep}% 0 0)`}} />
      {MARKS.talkBefore.map((m, i) => {
        const s = pop(f - 12 - i * 5);
        const g = goneOf(m, f);
        return (
          <div key={i} style={{position: 'absolute', left: m[0], top: m[1], width: m[2] - m[0], height: m[3] - m[1], opacity: Math.min(1, s * 2) * (1 - g)}}>
            <div style={{position: 'absolute', inset: 0, border: `12px solid ${C.read}`, borderRadius: 30, transform: `scale(${1.25 - s * 0.25})`}} />
            <div style={{position: 'absolute', left: -40, top: -40, width: 84, height: 84, borderRadius: 42, background: C.read, color: C.meInk, fontSize: 52, fontWeight: 800, display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
              {i + 1}
            </div>
          </div>
        );
      })}
      {sweep > 0 && sweep < 100 ? <div style={{position: 'absolute', top: 0, bottom: 0, left: (sweep / 100) * SW - 9, width: 18, background: C.ink}} /> : null}
    </>
  );
};

const TalkAround: React.FC = () => {
  const f = useCurrentFrame();
  const tab = Math.round(interpolate(f, [64, 76], [5, 2], clamp));
  const tabIn = pop(f - 62);
  return (
    <>
      <SideText at={10} x={130} y={250} w={580} small="B の写真" big="消したもの" size={72} />
      {TALK_LABELS.map((label, i) => {
        const s = sp(f - 14 - i * 5, {damping: 14, stiffness: 180, mass: 0.7});
        const g = goneOf(MARKS.talkBefore[i], f);
        return (
          <div key={label} style={{position: 'absolute', left: 130, top: 470 + i * 110, display: 'flex', alignItems: 'center', gap: 22, opacity: Math.min(1, s * 2), transform: `translateX(${(1 - s) * -60}px)`}}>
            <div style={{width: 64, height: 64, borderRadius: 32, background: C.read, color: C.meInk, fontSize: 38, fontWeight: 800, display: 'flex', alignItems: 'center', justifyContent: 'center'}}>{i + 1}</div>
            <div style={{position: 'relative', fontSize: 50, fontWeight: 800, color: g > 0.5 ? C.ink3 : C.ink, whiteSpace: 'nowrap'}}>
              {label}
              <div style={{position: 'absolute', left: 0, top: '52%', height: 6, width: `${g * 100}%`, background: C.read}} />
            </div>
          </div>
        );
      })}
      <div style={{position: 'absolute', left: 1250, top: 360, opacity: Math.min(1, tabIn * 2), transform: `scale(${0.6 + tabIn * 0.4})`, transformOrigin: '0% 50%'}}>
        <div style={{fontSize: 46, fontWeight: 700, color: C.ink2}}>下部タブ</div>
        <div style={{fontSize: 210, fontWeight: 800, color: C.me, lineHeight: 1.05, letterSpacing: '-0.04em'}}>5→{tab}</div>
      </div>
    </>
  );
};

const DemoAround: React.FC = () => (
  <>
    <SideText at={12} x={130} y={330} w={580} small="トークを長押しして" big={'「既読をつけずに\n読む」'} />
    <SideText at={70} x={1250} y={330} w={600} small="開くと案内が出る" big={'相手には、\n未読のまま。'} color={C.read} />
  </>
);

// ---------- B の画面（既読の山場） ----------

const PANEL_H = 900;
const PANEL_LEFT = 1450;
const Panel: React.FC = () => {
  const f = useCurrentFrame();
  const len = PANEL.end - PANEL.start;
  const s = sp(f, {damping: 17, stiffness: 140, mass: 0.8});
  const out = interpolate(f, [len - 14, len], [0, 1], {...clamp, easing: Easing.in(Easing.cubic)});
  const ring = interpolate(f, [8, 14, 30, 36], [0, 1, 1, 0], clamp);
  return (
    <div style={{position: 'absolute', left: PANEL_LEFT, top: 120, transform: `translateX(${(1 - s) * 560 + out * 600}px)`}}>
      <div style={{position: 'absolute', top: -56, left: 0, fontSize: 30, fontWeight: 700, color: C.ink2, whiteSpace: 'nowrap'}}>そのころ、B の画面</div>
      <ScreenBox height={PANEL_H} style={{borderRadius: 26, outline: `3px solid ${C.ink}`}}>
        <Layer src="screenshots/chat/room-read-disabled-mock.png" />
        <div style={{position: 'absolute', left: 44, top: 332, width: 1131, height: 207, borderRadius: 40, border: `10px solid ${C.read}`, opacity: ring}} />
        <Sequence from={26} layout="none">
          <MarkAllReadScreen ring={C.read} font={C.font} />
        </Sequence>
      </ScreenBox>
    </div>
  );
};

const PanelCaptions: React.FC = () => (
  <>
    <SideText at={-4} until={74} x={70} y={360} w={420} small="B は読んでいる。でも" big={'既読が、\nつかない。'} size={76} />
    <SideText at={76} x={70} y={360} w={420} small={'読み終えたら\n「すべて既読にする」で'} big={'まとめて、\n既読。'} size={76} color={C.read} />
  </>
);

// ---------- エンディング ----------

const CHIPS = ['広告を消す', 'Agent i を消す', '既読をつけずに読む'];
const Ending: React.FC = () => {
  const f = useCurrentFrame();
  const fade = (a: number) => interpolate(f, [a, a + 10], [0, 1], clamp);
  const rise = (a: number) => (1 - sp(f - a, {damping: 18, stiffness: 160})) * 40;
  const icon = pop(f - 2);
  const word = sp(f - 6, {damping: 12, stiffness: 170, mass: 0.7});
  return (
    <AbsoluteFill>
      <div style={{position: 'absolute', left: 160, top: 170, display: 'flex', alignItems: 'center', gap: 44}}>
        <Img src={staticFile('brand/icon.svg')} style={{width: 170, height: 170, transform: `scale(${icon})`}} />
        <div style={{fontSize: 200, fontWeight: 800, letterSpacing: '-0.04em', color: C.ink, lineHeight: 1, opacity: Math.min(1, word * 2), transform: `translateY(${(1 - word) * 60}px)`}}>Linimal</div>
      </div>
      <div style={{position: 'absolute', left: 160, top: 410, fontSize: 46, fontWeight: 700, color: C.ink2, opacity: fade(14), transform: `translateY(${rise(14)}px)`}}>
        公式 LINE Android 向けの Morphe パッチバンドル
      </div>
      <div style={{position: 'absolute', left: 160, top: 520, display: 'flex', gap: 22}}>
        {CHIPS.map((c, i) => {
          const s = pop(f - 22 - i * 5);
          return (
            <div key={c} style={{padding: '18px 34px', borderRadius: bubbleShape('me'), background: C.me, color: C.meInk, fontSize: 42, fontWeight: 700, transform: `scale(${0.4 + s * 0.6})`, transformOrigin: '0% 100%', opacity: Math.min(1, s * 2)}}>
              {c}
            </div>
          );
        })}
      </div>
      <div style={{position: 'absolute', left: 160, top: 700, fontSize: 30, fontWeight: 700, color: C.ink3, opacity: fade(40)}}>ソースとダウンロード</div>
      <div style={{position: 'absolute', left: 160, top: 744, fontSize: 64, fontWeight: 800, color: C.me, letterSpacing: '-0.01em', opacity: fade(42), transform: `translateY(${rise(42)}px)`}}>
        github.com/uta-a/linimal
      </div>
      <div style={{position: 'absolute', left: 160, right: 160, top: 960, paddingTop: 22, borderTop: `2px solid ${C.rule}`, fontSize: 26, lineHeight: 1.6, color: C.ink2, opacity: fade(50)}}>
        LINE・Morphe の公式プロジェクトではありません。対象は LINE 26.16.0。画面の名前とトークは架空です。
      </div>
    </AbsoluteFill>
  );
};

// ---------- 全体 ----------

const BrandTag: React.FC = () => (
  <div style={{position: 'absolute', left: 60, top: 44, display: 'flex', alignItems: 'center', gap: 16}}>
    <Img src={staticFile('brand/icon.svg')} style={{width: 52, height: 52}} />
    <div style={{fontSize: 36, fontWeight: 800, letterSpacing: '-0.02em', color: C.ink}}>Linimal</div>
  </div>
);

export const VariantChat: React.FC = () => {
  const f = useCurrentFrame();
  const {height} = useVideoConfig();
  const away = interpolate(f, [END - 4, END + 18], [0, 1], {...clamp, easing: Easing.in(Easing.cubic)});
  return (
    <AbsoluteFill style={{background: C.paper, color: C.ink, fontFamily: C.font, overflow: 'hidden'}}>
      <AbsoluteFill style={{transform: `translateY(${-away * height * 1.15}px)`}}>
        <BrandTag />
        <Conversation />
        <Sequence from={TALK_EXPAND.start} durationInFrames={TALK_EXPAND.end - TALK_EXPAND.start + 16}>
          <Expand
            start={TALK_EXPAND.start} end={TALK_EXPAND.end} index={TALK_INDEX}
            screen={<TalkScreen />} around={<TalkAround />}
          />
        </Sequence>
        <Sequence from={DEMO_EXPAND.start} durationInFrames={DEMO_EXPAND.end - DEMO_EXPAND.start + 16}>
          <Expand
            start={DEMO_EXPAND.start} end={DEMO_EXPAND.end} index={DEMO_INDEX}
            screen={
              <>
                <Layer src="screenshots/chat/scroll-preview-mock.png" />
                <Sequence from={12} layout="none"><OpenWithoutReceiptScreen ring={C.read} /></Sequence>
              </>
            }
            around={<DemoAround />}
          />
        </Sequence>
        <Sequence from={PANEL.start} durationInFrames={PANEL.end - PANEL.start + 2}>
          <Panel />
          <PanelCaptions />
        </Sequence>
      </AbsoluteFill>
      <Sequence from={END + 8}>
        <Ending />
      </Sequence>
    </AbsoluteFill>
  );
};

