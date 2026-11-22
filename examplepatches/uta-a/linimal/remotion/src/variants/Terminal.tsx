// 開発者向け「ターミナル」版（16:9、1920×1080、30fps、音声なし）。
// 画面全体を 1 枚の端末として扱う。コマンドを打つ → パッチ適用のログが流れる → 実画面の差分 →
// 既読をつけずに読む → 設計の方針 → リポジトリ。ウィンドウ枠・端末の枠・発光・グラデーションは使わない。
// コマンドは README の実物、ログのパッチ名は patches-list.json の name の実物だけを使う。
import React from 'react';
import {AbsoluteFill, Easing, Img, Sequence, interpolate, spring, staticFile, useCurrentFrame, useVideoConfig} from 'remotion';
import {
  Layer, MARKS, Mark, MarkAllReadScreen, OpenWithoutReceiptScreen, SH, ScreenBox, ScrollPreviewScreen, SpeedContext, widthFor,
} from '../shared/screens';
import {Slam} from '../x/parts';

// ---------- 配色とフォント（この案の色はここだけ） ----------
const T = {
  bg: 'oklch(13% 0.004 160)',
  bar: 'oklch(19% 0.006 160)',
  ink: 'oklch(96% 0.004 160)',
  ink2: 'oklch(74% 0.008 160)',
  ink3: 'oklch(52% 0.008 160)',
  rule: 'oklch(32% 0.008 160)',
  accent: 'oklch(82% 0.15 155)',
  accentInk: 'oklch(18% 0.03 155)',
  alert: 'oklch(68% 0.19 28)',
  touch: 'oklch(82% 0.15 155)',
  sans: "'Hiragino Sans', sans-serif",
  mono: "Menlo, 'Hiragino Sans', monospace",
};
const MONO_W = 0.6021; // Menlo の 1 文字の幅（em）
const L = 120; // 左端

const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;
const expoOut = Easing.bezier(0.16, 1, 0.3, 1);
const inOut = Easing.inOut(Easing.cubic);

// ---------- 場面の長さ ----------
const SCENES = [
  ['patch', 270],
  ['diff', 150],
  ['read', 170],
  ['design', 125],
  ['end', 120],
] as const;
type SceneId = (typeof SCENES)[number][0];
const START = {} as Record<SceneId, number>;
let acc = 0;
for (const [id, len] of SCENES) {
  START[id] = acc;
  acc += len;
}
export const TERMINAL_TOTAL = acc;

// ---------- 部品 ----------
const Bg: React.FC<{children: React.ReactNode}> = ({children}) => (
  <AbsoluteFill style={{background: T.bg, color: T.ink, fontFamily: T.sans, overflow: 'hidden'}}>{children}</AbsoluteFill>
);

const typedLen = (f: number, at: number, rate: number, len: number) => Math.max(0, Math.min(len, Math.floor((f - at) * rate)));

// ブロックカーソル。打っている間は点灯、止まると点滅
const Cursor: React.FC<{size: number; active?: boolean; color?: string}> = ({size, active = false, color = T.accent}) => {
  const f = useCurrentFrame();
  const on = active || Math.floor(f / 9) % 2 === 0;
  return <span style={{display: 'inline-block', width: size * MONO_W, height: size * 1.08, verticalAlign: '-0.18em', background: on ? color : 'transparent'}} />;
};

// 1 文字ずつ打ち込まれるテキスト
const Typed: React.FC<{text: string; at: number; rate?: number; size: number; color?: string; cursor?: boolean; style?: React.CSSProperties}> = ({
  text, at, rate = 1.5, size, color = T.ink, cursor = false, style,
}) => {
  const f = useCurrentFrame();
  const n = typedLen(f, at, rate, text.length);
  const typing = n > 0 && n < text.length;
  return (
    <div style={{fontFamily: T.mono, fontSize: size, color, whiteSpace: 'pre', lineHeight: 1.35, ...style}}>
      {text.slice(0, n)}
      {cursor && f >= at - 10 ? <Cursor size={size} active={typing} /> : null}
    </div>
  );
};

// 実画面。枠は描かず、角丸と細い線だけ
const Screen: React.FC<{h: number; left: number; top: number; children: React.ReactNode; style?: React.CSSProperties}> = ({h, left, top, children, style}) => (
  <div style={{position: 'absolute', left, top, ...style}}>
    <ScreenBox height={h} style={{borderRadius: 26, outline: `2px solid ${T.rule}`}}>{children}</ScreenBox>
  </div>
);

// 場面転換。端末の行が上から順に塗られ、また消えていく
const RowWipe: React.FC<{at: number}> = ({at}) => {
  const f = useCurrentFrame();
  if (f < at - 14 || f > at + 16) return null;
  const ROWS = 9;
  return (
    <AbsoluteFill style={{pointerEvents: 'none'}}>
      {Array.from({length: ROWS}, (_, i) => {
        const d = i * 0.6;
        const cover = interpolate(f, [at - 13 + d, at - 5 + d], [0, 1], {...clamp, easing: Easing.in(Easing.cubic)});
        const uncover = interpolate(f, [at + 1 + d, at + 9 + d], [0, 1], {...clamp, easing: Easing.out(Easing.cubic)});
        const covering = uncover === 0;
        return (
          <div key={i} style={{
            position: 'absolute', left: 0, right: 0, top: (i * 1080) / ROWS, height: 1080 / ROWS + 1, background: T.accent,
            transformOrigin: covering ? '0% 50%' : '100% 50%', transform: `scaleX(${covering ? cover : 1 - uncover})`,
          }} />
        );
      })}
    </AbsoluteFill>
  );
};

// 画面下のステータス行（端末の一部として描く）と進行
const StatusLine: React.FC = () => {
  const f = useCurrentFrame();
  const {durationInFrames} = useVideoConfig();
  const id = [...SCENES].reverse().find(([s]) => f >= START[s])?.[0] ?? 'patch';
  const label: Record<SceneId, string> = {patch: 'patch', diff: 'diff', read: 'read', design: 'design', end: 'repo'};
  return (
    <div style={{position: 'absolute', left: 0, right: 0, bottom: 0, height: 44, background: T.bar, fontFamily: T.mono, fontSize: 22, color: T.ink2, display: 'flex', alignItems: 'center', padding: `0 ${L - 60}px`, justifyContent: 'space-between'}}>
      <div style={{position: 'absolute', left: 0, top: 0, height: 4, width: `${(f / (durationInFrames - 1)) * 100}%`, background: T.accent}} />
      <span><span style={{color: T.accentInk, background: T.accent, padding: '2px 12px', marginRight: 18}}>{label[id]}</span>linimal  LINE 26.16.0 (261600106)  arm64-v8a</span>
      <span>GPL-3.0</span>
    </div>
  );
};

// ---------- 1. コマンドとログ ----------
const CMD = [
  'java -jar morphe-desktop-*-all.jar patch \\',
  '    --patches patches-*.mpp \\',
  '    --out line-linimal.apk \\',
  '    <LINE の APKM>',
];
const CMD_AT = [22, 64, 80, 96];
const CMD_RATE = [1.25, 2.2, 2.2, 1.6];
const CMD_SIZE = 58;
const CMD_LH = 82;
const CMD_TOP = 400;
const ENTER = 110;

type LogLine = {k: 'info' | 'ok' | 'done'; text: string};
// patches-list.json の name から。ログの書式は演出（Morphe の実際の出力ではない）
const PATCH_NAMES = [
  'Linimal extension', 'Linimal bootstrap', 'Linimal patch status', 'Linimal settings entry', 'Linimal settings component',
  'Linimal settings strings', 'Smart Channel ads', 'Home ads', 'Agent i in home header', 'Agent i in wallet header',
  'Agent i in chat plus menu', 'Agent i in message box', 'Agent i in chat information', 'Agent i in settings',
  'LINE AI in message context menu', 'LINE AI beside image messages', 'LINE AI in photo and video viewer',
  'Home recommendations', 'Home trending', 'Home feed post cards', 'Home feed live streams', 'Home recent history',
  'Home featured collections', 'Premium in settings', 'Premium prompt on unsend', 'Premium prompt in scroll preview',
  'Scrollable preview', 'Read without receipt', 'Read without receipt (scroll preview)', 'Read without receipt from notifications',
  'Read without receipt unread keep', 'Explicit mark as read', 'Group readers', 'AMOLED theme targets',
  'Open links in external browser', 'Chat plus menu items', 'Chat list header icons', 'Push notifications while closed',
  'Agent i in chat list search', 'Bottom tabs',
];
const DIFF_TARGETS = ['Chat list header icons', 'Agent i in chat list search', 'Bottom tabs'];
const LOG: LogLine[] = [
  {k: 'info', text: 'patches-*.mpp を読み込み'},
  {k: 'info', text: '入力  LINE 26.16.0 (261600106) arm64-v8a  APKM'},
  ...PATCH_NAMES.map((text) => ({k: 'ok' as const, text})),
  {k: 'done', text: 'line-linimal.apk を書き出し'},
];
const LOG_TOP = CMD_TOP + CMD.length * CMD_LH + 40;
const LOG_SIZE = 32;
const LOG_LH = 50;
const LOG_FROM = 118;
const LOG_TO = 208;
const VIEW_BOTTOM = 990;
const HL_AT = 214;

const LogRow: React.FC<{line: LogLine; hl: number}> = ({line, hl}) => {
  const tag = {info: '[info]', ok: '[ ok ]', done: '[done]'}[line.k];
  const tagColor = line.k === 'info' ? T.ink3 : T.accent;
  const textColor = line.k === 'info' ? T.ink2 : line.k === 'done' ? T.accent : T.ink;
  return (
    <div style={{height: LOG_LH, display: 'flex', alignItems: 'center', fontFamily: T.mono, fontSize: LOG_SIZE, whiteSpace: 'pre'}}>
      <span style={{color: hl > 0.5 ? T.bg : tagColor, background: hl > 0.5 ? T.alert : 'transparent', padding: '0 6px'}}>{tag}</span>
      <span style={{color: hl > 0.5 ? T.bg : textColor, background: hl > 0.5 ? T.alert : 'transparent', padding: '0 12px 0 14px', fontWeight: line.k === 'done' ? 700 : 400}}>{line.text}</span>
    </div>
  );
};

const PatchScene: React.FC = () => {
  const f = useCurrentFrame();
  const cw = CMD_SIZE * MONO_W;

  // 打ち込み中のカーソル位置（カメラの原点にする）
  let line = 0;
  for (let i = 0; i < CMD.length; i++) if (f >= CMD_AT[i]) line = i;
  const col = typedLen(f, CMD_AT[line], CMD_RATE[line], CMD[line].length) + (line === 0 ? 2 : 0);
  const curX = L + col * cw;
  const curY = CMD_TOP + line * CMD_LH + CMD_LH / 2;

  // ログの行数（加速しながら流れる）と、それに合わせた端末のスクロール
  const n = interpolate(f, [LOG_FROM, LOG_TO], [0, LOG.length], {...clamp, easing: Easing.in(Easing.quad)});
  const scroll = Math.max(0, LOG_TOP + n * LOG_LH - VIEW_BOTTOM);
  const enterFlash = f >= ENTER && f < ENTER + 3;

  // カメラ: 1 行目はカーソルに寄って追い、引く。最後は消える 3 行に寄る
  const z1 = interpolate(f, [16, 30, 56, 74], [1, 1.26, 1.26, 1], {...clamp, easing: inOut});
  const hlIdx = DIFF_TARGETS.map((t) => LOG.findIndex((l) => l.text === t));
  const finalScroll = Math.max(0, LOG_TOP + LOG.length * LOG_LH - VIEW_BOTTOM);
  const hlY = LOG_TOP + ((hlIdx[0] + hlIdx[hlIdx.length - 1] + 1) / 2) * LOG_LH - finalScroll;
  const z2 = interpolate(f, [HL_AT + 2, HL_AT + 26], [1, 1.5], {...clamp, easing: expoOut}) * interpolate(f, [250, 270], [1, 1.25], {...clamp, easing: Easing.in(Easing.cubic)});

  // 流れている間に重ねる見出し
  const boxIn = spring({frame: f - 132, fps: 30, config: {damping: 16, stiffness: 170, mass: 0.7}});
  const boxOut = interpolate(f, [HL_AT - 8, HL_AT + 4], [0, 1], {...clamp, easing: Easing.in(Easing.cubic)});
  const labelO = interpolate(f, [HL_AT + 10, HL_AT + 18], [0, 1], clamp);
  const headNudge = Math.sin(f * 0.9) * 10 * interpolate(f, [0, 14], [1, 0], clamp);
  const headLine = interpolate(f, [0, 16], [0.3, 1], {...clamp, easing: expoOut});

  return (
    <Bg>
      <div style={{position: 'absolute', inset: 0, transform: `scale(${z2})`, transformOrigin: `${L}px ${VIEW_BOTTOM - 10}px`}}>
        <div style={{position: 'absolute', inset: 0, transform: `scale(${z1})`, transformOrigin: `${curX}px ${curY}px`}}>
          <div style={{position: 'absolute', left: 0, right: 0, top: 0, transform: `translateY(${-scroll}px)`}}>
            <div style={{position: 'absolute', left: L, top: 92, fontFamily: T.mono, fontSize: 30, color: T.ink3, whiteSpace: 'pre'}}>
              # Linimal  公式 LINE Android 向けの Morphe パッチバンドル
            </div>
            <div style={{position: 'absolute', left: L - 6, top: 150}}>
              {/* 0 フレーム目（X のサムネイル）で見出しは着地済み。動きは小さな揺れと下線の伸びだけ */}
              <div style={{transform: `translateY(${headNudge}px)`}}>
                <Slam text="LINE を、身軽にする。" at={-40} size={150} color={T.ink} />
              </div>
              <div style={{marginTop: 6, marginLeft: 6, height: 10, width: 1390 * headLine, background: T.accent}} />
            </div>
            {CMD.map((text, i) => {
              const len = typedLen(f, CMD_AT[i], CMD_RATE[i], text.length);
              const isCur = i === line && f < ENTER;
              const typing = len > 0 && len < text.length;
              return (
                <div key={i} style={{position: 'absolute', left: L, top: CMD_TOP + i * CMD_LH, height: CMD_LH, fontFamily: T.mono, fontSize: CMD_SIZE, whiteSpace: 'pre', display: 'flex', alignItems: 'center', color: T.ink}}>
                  {i === 0 ? <span style={{color: T.accent}}>$ </span> : null}
                  <span style={{background: enterFlash ? T.accent : 'transparent', color: enterFlash ? T.accentInk : T.ink}}>{text.slice(0, len)}</span>
                  {isCur ? <Cursor size={CMD_SIZE} active={typing} /> : null}
                </div>
              );
            })}
            <div style={{position: 'absolute', left: L, top: LOG_TOP}}>
              {LOG.slice(0, Math.floor(n)).map((l, i) => {
                const hl = hlIdx.includes(i) ? interpolate(f, [HL_AT + hlIdx.indexOf(i) * 4, HL_AT + 2 + hlIdx.indexOf(i) * 4], [0, 1], clamp) : 0;
                return <LogRow key={i} line={l} hl={hl} />;
              })}
            </div>
          </div>
        </div>
        <div style={{position: 'absolute', left: L + 700, top: hlY - 26, fontSize: 36, fontWeight: 800, color: T.alert, opacity: labelO, whiteSpace: 'nowrap'}}>
          ← トーク一覧で消える表示
        </div>
      </div>
      <div style={{
        // 右下の空き（コマンドより下、ログの行より右）。文字はカードの外に出ないよう clip し、カードと一緒に動かす
        position: 'absolute', right: 36, top: 770, width: 716, height: 236, boxSizing: 'border-box', padding: '30px 36px 0', background: T.accent,
        overflow: 'hidden', opacity: Math.min(1, boxIn * 2) * (1 - boxOut), transform: `translateX(${(1 - boxIn) * 820 + boxOut * 820}px)`,
      }}>
        <Slam text="機能の ON / OFF は、" at={136} size={54} color={T.accentInk} />
        <Slam text="あとから LINE の設定で。" at={142} size={54} color={T.accentInk} />
        <div style={{marginTop: 12, fontFamily: T.mono, fontSize: 26, color: T.accentInk}}>設定 → 一番下の Linimal</div>
      </div>
    </Bg>
  );
};

// ---------- 2. 差分（トーク一覧の Before / After） ----------
const DIFF_H = 920;
const DIFF_TOP = 60;
const DIFF_LEFT = 150;
const DIFF_SUB = ['トーク一覧上部のアイコン', '検索欄の Agent i', '下部タブ 5 個 → 2 個'];

const DiffScene: React.FC = () => {
  const f = useCurrentFrame();
  const p = interpolate(f, [40, 92], [0, 100], {...clamp, easing: inOut});
  const scanY = (p / 100) * SH;
  const gone = (m: Mark) => interpolate(scanY, [m[1] - 60, m[1] + 20], [0, 1], clamp);
  const cam = interpolate(f, [0, 18], [1.12, 1], {...clamp, easing: expoOut}) * interpolate(f, [120, 150], [1, 1.06], {...clamp, easing: Easing.in(Easing.quad)});
  const shotIn = spring({frame: f, fps: 30, config: {damping: 16, stiffness: 140, mass: 0.8}});
  const X0 = 720;
  return (
    <Bg>
      <div style={{position: 'absolute', inset: 0, transform: `scale(${cam})`, transformOrigin: '40% 50%'}}>
        <Screen h={DIFF_H} left={DIFF_LEFT} top={DIFF_TOP} style={{transform: `translateX(${(1 - shotIn) * -300}px)`, opacity: Math.min(1, shotIn * 2)}}>
          <Layer src="screenshots/line-talk-list-before.png" />
          <Layer src="screenshots/line-talk-list.png" style={{clipPath: `inset(0 0 ${100 - p}% 0)`}} />
          {MARKS.talkBefore.map((m, i) => {
            const s = spring({frame: f - 12 - i * 6, fps: 30, config: {damping: 11, stiffness: 220, mass: 0.6}});
            return (
              <div key={i} style={{
                position: 'absolute', left: m[0], top: m[1], width: m[2] - m[0], height: m[3] - m[1], border: `12px solid ${T.alert}`, borderRadius: 30,
                opacity: Math.min(1, s * 2) * (1 - gone(m)), transform: `scale(${1.25 - s * 0.25})`,
              }} />
            );
          })}
          {p > 0 && p < 100 ? <div style={{position: 'absolute', left: 0, right: 0, top: scanY - 10, height: 20, background: T.accent}} /> : null}
        </Screen>
        <div style={{position: 'absolute', left: X0, top: 96}}>
          <Typed text="--- 公式 LINE 26.16.0" at={2} rate={3} size={38} color={T.alert} />
          <Typed text="+++ Linimal" at={8} rate={3} size={38} color={T.accent} />
        </div>
        {DIFF_TARGETS.map((name, i) => {
          const m = MARKS.talkBefore[i];
          const s = spring({frame: f - 14 - i * 6, fps: 30, config: {damping: 15, stiffness: 190, mass: 0.7}});
          const done = gone(m) > 0.5;
          const tagS = spring({frame: f - 46 - i * 16, fps: 30, config: {damping: 12, stiffness: 240, mass: 0.6}});
          return (
            <div key={name} style={{position: 'absolute', left: X0, top: 270 + i * 150, opacity: Math.min(1, s * 2), transform: `translateX(${(1 - s) * 200}px)`}}>
              <div style={{fontFamily: T.mono, fontSize: 46, whiteSpace: 'pre', color: done ? T.ink3 : T.alert, display: 'flex', alignItems: 'center'}}>
                <span style={{textDecoration: done ? 'line-through' : 'none', textDecorationColor: T.alert, textDecorationThickness: 4}}>- {name}</span>
                {done ? (
                  <span style={{marginLeft: 26, fontFamily: T.sans, fontSize: 30, fontWeight: 800, color: T.accentInk, background: T.accent, padding: '4px 16px', transform: `scale(${0.5 + tagS * 0.5})`, display: 'inline-block'}}>非表示</span>
                ) : null}
              </div>
              <div style={{marginTop: 6, fontSize: 32, fontWeight: 600, color: T.ink2}}>{DIFF_SUB[i]}</div>
            </div>
          );
        })}
        {f >= 94 ? (
          <div style={{position: 'absolute', left: X0 - 8, top: 755}}>
            <Slam text="消すのは、表示だけ。" at={96} per={1} size={118} color={T.accent} />
          </div>
        ) : null}
      </div>
    </Bg>
  );
};

// ---------- 3. 既読をつけずに読む ----------
const READ_H = 900;
const READ_TOP = 70;
const READ_LEFT = Math.round((1920 - widthFor(READ_H)) / 2);
const READ_PATCHES: [number, string][] = [
  [2, 'Scrollable preview'],
  [8, 'Read without receipt (scroll preview)'],
  [54, 'Read without receipt'],
  [62, 'Read without receipt unread keep'],
  [122, 'Explicit mark as read'],
];
const READ_CAPS: [number, string, string?][] = [
  [0, '長押しで、\nプレビュー'],
  [50, '既読を\nつけずに開く'],
  [92, '相手には、\n未読のまま。', T.accent],
  [124, '読み終えたら、\nまとめて既読。'],
];

const ReadScene: React.FC = () => {
  const f = useCurrentFrame();
  const shotIn = spring({frame: f, fps: 30, config: {damping: 16, stiffness: 140, mass: 0.8}});
  const zoom = interpolate(f, [96, 112], [1, 1.14], {...clamp, easing: expoOut});
  const punch = interpolate(f, [118, 130], [1.08, 1], {...clamp, easing: expoOut});
  const RIGHT_EDGE = READ_LEFT - 60;
  return (
    <Bg>
      <div style={{position: 'absolute', right: 1920 - RIGHT_EDGE, top: 120, textAlign: 'right'}}>
        <Typed text="# 使っているパッチ" at={0} rate={3} size={26} color={T.ink3} />
        {READ_PATCHES.map(([at, name], i) => {
          const next = READ_PATCHES.find(([a]) => a > at + 10)?.[0] ?? 10000;
          const current = f >= at && f < next + 30;
          return (
            <div key={name} style={{marginTop: i === 2 || i === 4 ? 40 : 10}}>
              <Typed text={name} at={at} rate={2.6} size={28} color={current ? T.accent : T.ink2} />
            </div>
          );
        })}
      </div>
      <Screen h={READ_H} left={READ_LEFT} top={READ_TOP} style={{transform: `translateY(${(1 - shotIn) * 300}px) scale(${zoom * punch})`, transformOrigin: '50% 20%', opacity: Math.min(1, shotIn * 2)}}>
        <Sequence durationInFrames={52} layout="none">
          <SpeedContext.Provider value={1.4}><ScrollPreviewScreen ring={T.touch} /></SpeedContext.Provider>
        </Sequence>
        <Sequence from={52} durationInFrames={66} layout="none">
          <SpeedContext.Provider value={1.35}><OpenWithoutReceiptScreen ring={T.touch} /></SpeedContext.Provider>
        </Sequence>
        <Sequence from={118} layout="none">
          <SpeedContext.Provider value={1.6}><MarkAllReadScreen ring={T.touch} font={T.sans} /></SpeedContext.Provider>
        </Sequence>
      </Screen>
      {READ_CAPS.map(([at, text, color], i) => {
        const end = READ_CAPS[i + 1]?.[0] ?? 100000;
        if (f < at || f >= end + 6) return null;
        const inP = interpolate(f, [at + (i > 0 ? 6 : 0), at + (i > 0 ? 16 : 10)], [0, 1], {...clamp, easing: expoOut});
        const outP = interpolate(f, [end, end + 6], [0, 1], {...clamp, easing: Easing.in(Easing.cubic)});
        return (
          <div key={i} style={{
            position: 'absolute', left: READ_LEFT + widthFor(READ_H) + 110, top: 380, fontSize: 78, fontWeight: 800, lineHeight: 1.22,
            letterSpacing: '-0.03em', whiteSpace: 'pre', color: color ?? T.ink, opacity: inP * (1 - outP),
            transform: `translateY(${(1 - inP) * 60 - outP * 60}px)`,
          }}>
            {text}
          </div>
        );
      })}
    </Bg>
  );
};

// ---------- 4. 設計の方針 ----------
const PRINCIPLES: [number, string, string][] = [
  [2, '設定 OFF', 'OFF なら、公式 LINE と同じ動作。'],
  [28, 'fail-open', '特定できない機能は、自動で無効に。'],
];
const DesignScene: React.FC = () => {
  const f = useCurrentFrame();
  const pan = interpolate(f, [0, 125], [30, -30]);
  return (
    <Bg>
      <div style={{position: 'absolute', left: L, top: 0, right: 0, bottom: 0, transform: `translateY(${pan}px)`}}>
        {PRINCIPLES.map(([at, tag, big], i) => {
          const active = f >= at && (PRINCIPLES[i + 1] ? f < PRINCIPLES[i + 1][0] : true);
          return (
            <div key={i} style={{position: 'absolute', left: 0, top: 130 + i * 280}}>
              <div style={{display: 'flex', alignItems: 'center', fontFamily: T.mono, fontSize: 32, color: T.ink3, whiteSpace: 'pre'}}>
                <span style={{color: f >= at ? T.accent : T.ink3}}>{`0${i + 1}  `}</span>
                <Typed text={tag} at={at} rate={3} size={32} color={T.ink2} />
              </div>
              <div style={{marginTop: 8, opacity: f >= at + 6 ? (active ? 1 : 0.42) : 0}}>
                <Slam text={big} at={at + 6} size={100} color={active ? T.ink : T.ink2} />
              </div>
            </div>
          );
        })}
      </div>
    </Bg>
  );
};

// ---------- 5. エンディング ----------
const EndScene: React.FC = () => {
  const f = useCurrentFrame();
  const icon = spring({frame: f - 2, fps: 30, config: {damping: 11, stiffness: 160, mass: 0.7}});
  const fade = (a: number) => interpolate(f, [a, a + 10], [0, 1], clamp);
  const cam = interpolate(f, [0, 120], [1.05, 1], {easing: Easing.out(Easing.quad)});
  return (
    <Bg>
      <div style={{position: 'absolute', inset: 0, transform: `scale(${cam})`, transformOrigin: '0% 40%'}}>
        <div style={{position: 'absolute', left: L, top: 160, display: 'flex', alignItems: 'center', gap: 44}}>
          <Img src={staticFile('brand/icon.svg')} style={{width: 170, height: 170, transform: `scale(${icon})`}} />
          <Slam text="Linimal" at={6} per={1} size={210} color={T.ink} />
        </div>
        <div style={{position: 'absolute', left: L, top: 430, fontSize: 52, fontWeight: 700, color: T.ink2, opacity: fade(16)}}>
          公式 LINE Android 向けの Morphe パッチバンドル
        </div>
        <div style={{position: 'absolute', left: L, top: 560, display: 'flex', alignItems: 'center', fontFamily: T.mono, fontSize: 64, whiteSpace: 'pre'}}>
          <span style={{color: T.ink3}}>$ </span>
          <Typed text="github.com/uta-a/linimal" at={24} rate={1.4} size={64} color={T.accent} cursor />
        </div>
        <div style={{position: 'absolute', left: L, top: 690, fontFamily: T.mono, fontSize: 30, color: T.ink3, opacity: fade(44)}}>
          LINE 26.16.0 (261600106)  arm64-v8a  APKM  GPL-3.0
        </div>
      </div>
      <div style={{position: 'absolute', left: L, right: L, top: 920, fontSize: 30, fontWeight: 600, lineHeight: 1.6, color: T.ink2, opacity: fade(30)}}>
        LINE・Morphe の公式プロジェクトではありません。対象は LINE 26.16.0。画面の名前とトークは架空です。
      </div>
    </Bg>
  );
};

const COMPONENTS: Record<SceneId, React.FC> = {patch: PatchScene, diff: DiffScene, read: ReadScene, design: DesignScene, end: EndScene};

export const VariantTerminal: React.FC = () => (
  <AbsoluteFill style={{background: T.bg}}>
    {SCENES.map(([id, len]) => {
      const C = COMPONENTS[id];
      return (
        <Sequence key={id} from={START[id]} durationInFrames={len}>
          <C />
        </Sequence>
      );
    })}
    <RowWipe at={START.diff} />
    <RowWipe at={START.read} />
    <RowWipe at={START.design} />
    <RowWipe at={START.end} />
    <StatusLine />
  </AbsoluteFill>
);
