// 「Before / After 連打」版（LinimalVSplit、1920×1080、30fps、音声なし）。
// 画面を左右に二分割し、左に公式の LINE、右に Linimal を置いて、一定の拍でハードカットしながら比べる。
// 左は暗く彩度を落として赤の ✕ と取り消し線、右は明るい地にミントの印。消える要素は右側で縮んで消える。
// 最後は分割線が左へ抜けて右側（Linimal）が画面全体になり、設定の事実とエンディングを出す。
import React, {createContext, useContext} from 'react';
import {AbsoluteFill, Easing, Img, Sequence, interpolate, spring, staticFile, useCurrentFrame, useVideoConfig} from 'remotion';
import {Layer, MARKS, SH, SW, Touch} from '../shared/screens';
import {clamp} from '../x/parts';

// 配色とフォント（この案の色はここだけで決める）
const C = {
  darkBg: '#1E1E1E',
  darkInk: '#E8E8E8',
  darkInk2: '#8C8C8C',
  darkRule: '#3C3C3C',
  lightBg: '#EDF1EE',
  lightInk: '#0F1714',
  lightInk2: '#56625C',
  lightRule: '#C6D0CA',
  screen: '#111111', // LINE ダークモードの背景（画面の地）
  red: '#F0444B',
  mint: '#2FD8A0',
  mintInk: '#062018',
  white: '#FFFFFF',
  sans: "'Hiragino Sans', sans-serif",
  mono: "Menlo, 'Hiragino Sans', monospace",
};

// ---------- 尺（フレーム） ----------
const S = {
  open: 0,
  top: 54,
  tabs: 138,
  homeAgent: 204,
  homeCard: 270,
  settings: 336,
  read: 402,
  facts: 540,
  end: 660,
};
export const SPLIT_TOTAL = 744;

const MID = 960;
const PANE_CY = 600;
const PANE_W = 820;
const PANE_H = 720;

type Rect = [number, number, number, number];
const SRC = {
  talkB: 'screenshots/line-talk-list-before.png',
  talkA: 'screenshots/line-talk-list.png',
  homeB: 'screenshots/line-home-before.png',
  homeA: 'screenshots/line-home.png',
  setB: 'screenshots/line-settings-top-before.png',
  setA: 'screenshots/line-settings-top.png',
  unread: 'screenshots/chat/talk-list-unread-kept.png',
  readList: 'screenshots/chat/talk-list-after-mark-all-read.png',
  roomOff: 'screenshots/chat/room-read-disabled-mock.png',
  roomOn: 'screenshots/chat/room-read-enabled-mock.png',
};

// 実機座標（1220×2712）の該当箇所
const R = {
  topIcons: [[722, 165, 810, 292], [849, 165, 918, 292], [972, 165, 1058, 292]] as Rect[],
  searchAgent: [1046, 318, 1184, 444] as Rect,
  tabs: [[520, 2478, 701, 2662], [794, 2478, 914, 2662], [1053, 2478, 1151, 2662]] as Rect[],
  homeAgent: MARKS.homeBefore[0] as Rect,
  homeCard: MARKS.homeBefore[1] as Rect,
  setRow: [30, 1880, 1190, 2049] as Rect,
  setShift: 169, // 行が消えたあと下の項目が上がる量
  banner: [44, 332, 1175, 539] as Rect,
  badge: [1063, 521, 1183, 641] as Rect,
};

// ---------- 小物 ----------
const KCtx = createContext(1);
const useK = () => useContext(KCtx);
const at0 = (f: number, a: number) => f >= a;
const pop = (f: number, a: number, d = 9) => interpolate(f, [a, a + d], [0, 1], {...clamp, easing: Easing.out(Easing.cubic)});

// 印が叩き込まれた瞬間の揺れ
const hitShake = (f: number, hits: number[]) => {
  let x = 0;
  for (const h of hits) {
    const d = f - h;
    if (d >= 0 && d < 8) x += Math.sin(d * 2.4) * 10 * (1 - d / 8);
  }
  return x;
};

// 実画面の切り抜き。rect（実機座標）を枠いっぱいに縮小して見せる。枠は角丸と細い線だけ
const Pane: React.FC<{
  side: 'L' | 'R';
  rect: Rect;
  children: React.ReactNode;
  over?: React.ReactNode;
  shake?: number;
  enterAt?: number;
}> = ({side, rect, children, over, shake = 0, enterAt}) => {
  const f = useCurrentFrame();
  const [x0, y0, x1, y1] = rect;
  const k = Math.min(PANE_W / (x1 - x0), PANE_H / (y1 - y0));
  const w = (x1 - x0) * k;
  const h = (y1 - y0) * k;
  const cx = side === 'L' ? MID / 2 : MID + MID / 2;
  const s = enterAt === undefined ? 1 : 1.05 - 0.05 * pop(f, enterAt, 6);
  return (
    <div
      style={{
        position: 'absolute', left: cx - w / 2 + shake, top: PANE_CY - h / 2, width: w, height: h,
        borderRadius: 22, overflow: 'hidden', background: C.screen,
        outline: `2px solid ${side === 'L' ? C.darkRule : C.lightRule}`, transform: `scale(${s})`,
      }}
    >
      <KCtx.Provider value={k}>
        <div style={{position: 'absolute', left: -x0 * k, top: -y0 * k, width: SW, height: SH, transform: `scale(${k})`, transformOrigin: 'top left'}}>
          <div style={{position: 'absolute', inset: 0, filter: side === 'L' ? 'saturate(0.25) brightness(0.78)' : undefined}}>{children}</div>
          {over}
        </div>
      </KCtx.Provider>
    </div>
  );
};

// 実画面の一部だけを切り抜いて置く
const Crop: React.FC<{src: string; r: Rect; style?: React.CSSProperties}> = ({src, r, style}) => (
  <div style={{position: 'absolute', left: r[0], top: r[1], width: r[2] - r[0], height: r[3] - r[1], overflow: 'hidden', ...style}}>
    <Img src={staticFile(src)} style={{position: 'absolute', left: -r[0], top: -r[1], width: SW, height: SH}} />
  </div>
);

// 赤い ✕。大きく出て縮みながら叩き込まれる
const StampX: React.FC<{r: Rect; at: number; scale?: number}> = ({r, at, scale = 1.05}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  const k = useK();
  if (!at0(f, at)) return null;
  const s = spring({frame: f - at, fps, config: {damping: 12, stiffness: 320, mass: 0.5}});
  const size = Math.max(r[2] - r[0], r[3] - r[1]) * scale;
  const t = 13 / k;
  const cx = (r[0] + r[2]) / 2;
  const cy = (r[1] + r[3]) / 2;
  return (
    <div style={{position: 'absolute', left: cx - size / 2, top: cy - size / 2, width: size, height: size, transform: `scale(${2.1 - 1.1 * s})`}}>
      {[45, -45].map((deg) => (
        <div key={deg} style={{position: 'absolute', left: 0, top: size / 2 - t / 2, width: size, height: t, borderRadius: t / 2, background: C.red, transform: `rotate(${deg}deg)`}} />
      ))}
    </div>
  );
};

// 赤い囲み
const RedBox: React.FC<{r: Rect; at: number}> = ({r, at}) => {
  const f = useCurrentFrame();
  const k = useK();
  if (!at0(f, at)) return null;
  const p = pop(f, at, 5);
  return (
    <div style={{
      position: 'absolute', left: r[0], top: r[1], width: r[2] - r[0], height: r[3] - r[1],
      border: `${6 / k}px solid ${C.red}`, borderRadius: 18 / k, transform: `scale(${1.15 - 0.15 * p})`,
    }} />
  );
};

// 取り消し線。左から右へ一気に引く
const Strike: React.FC<{r: Rect; at: number}> = ({r, at}) => {
  const f = useCurrentFrame();
  const k = useK();
  if (!at0(f, at)) return null;
  const p = interpolate(f, [at, at + 5], [0, 1], {...clamp, easing: Easing.out(Easing.quad)});
  const t = 12 / k;
  return (
    <div style={{position: 'absolute', left: r[0] - 10, top: (r[1] + r[3]) / 2 - t / 2, width: (r[2] - r[0] + 20) * p, height: t, borderRadius: t / 2, background: C.red}} />
  );
};

// 右側：Before の該当箇所が縮んで消える。patch なら下地を画面の地で塞ぐ
const Vanish: React.FC<{src: string; r: Rect; at: number; patch?: boolean}> = ({src, r, at, patch}) => {
  const f = useCurrentFrame();
  const k = useK();
  if (!at0(f, at)) return null;
  const p = interpolate(f, [at, at + 9], [0, 1], {...clamp, easing: Easing.in(Easing.back(1.6))});
  const ring = interpolate(f, [at, at + 14], [0, 1], clamp);
  const box = {position: 'absolute' as const, left: r[0], top: r[1], width: r[2] - r[0], height: r[3] - r[1]};
  return (
    <>
      {patch ? <div style={{...box, background: C.screen}} /> : null}
      {p < 1 ? <Crop src={src} r={r} style={{transform: `scale(${Math.max(0, 1 - p)})`}} /> : null}
      {ring < 1 ? (
        <div style={{...box, border: `${5 / k}px solid ${C.mint}`, borderRadius: 18 / k, opacity: 1 - ring, transform: `scale(${1 + ring * 0.25})`}} />
      ) : null}
    </>
  );
};

// 右側：残す印（ミントの囲み）
const MintBox: React.FC<{r: Rect; at: number; round?: boolean}> = ({r, at, round}) => {
  const f = useCurrentFrame();
  const k = useK();
  if (!at0(f, at)) return null;
  const p = pop(f, at, 6);
  return (
    <div style={{
      position: 'absolute', left: r[0], top: r[1], width: r[2] - r[0], height: r[3] - r[1],
      border: `${6 / k}px solid ${C.mint}`, borderRadius: round ? 9999 : 20 / k, transform: `scale(${1.2 - 0.2 * p})`, opacity: p,
    }} />
  );
};

// ---------- 全体にかかる要素 ----------

// 拍ごとの大見出し。差の合成で、暗い左では白、明るい右では黒に見える
const HEADS: {at: number; text: string}[] = [
  {at: S.open, text: '左が公式。右が Linimal。'},
  {at: S.top, text: '上部のアイコン'},
  {at: S.top + 42, text: '検索欄の Agent i'},
  {at: S.tabs, text: '下部タブ'},
  {at: S.homeAgent, text: 'ホームの Agent i'},
  {at: S.homeCard, text: 'おすすめ・投稿カード'},
  {at: S.settings, text: '設定の Agent i'},
  {at: S.read, text: '既読'},
];
const Headline: React.FC = () => {
  const f = useCurrentFrame();
  if (f >= S.facts) return null;
  let cur = HEADS[0];
  for (const h of HEADS) if (f >= h.at) cur = h;
  const p = cur.at === 0 ? 1 : pop(f, cur.at, 5);
  return (
    <div style={{
      position: 'absolute', left: 0, right: 0, top: 92, textAlign: 'center', mixBlendMode: 'difference',
      color: C.white, fontFamily: C.sans, fontWeight: 800, fontSize: 100, letterSpacing: '-0.02em', lineHeight: 1.15,
      whiteSpace: 'nowrap', transform: `scale(${1.12 - 0.12 * p})`,
    }}>
      {cur.text}
    </div>
  );
};

// 左右の下に出す一言
type Cap = {at: number; side: 'L' | 'R'; text: string; until: number};
const CAPS: Cap[] = [
  {at: S.tabs + 16, side: 'L', text: 'タブは 5 つ', until: S.homeAgent},
  {at: S.tabs + 34, side: 'R', text: 'タブは 2 つ', until: S.homeAgent},
  {at: S.homeCard + 28, side: 'R', text: '表示しない', until: S.settings},
  {at: S.read + 24, side: 'L', text: '開くと、相手に既読がつく', until: S.read + 78},
  {at: S.read + 30, side: 'R', text: '既読をつけずに読む', until: S.read + 78},
  {at: S.read + 78, side: 'L', text: '未読の印も消える', until: S.facts},
  {at: S.read + 84, side: 'R', text: '未読のまま残る', until: S.facts},
];
const Captions: React.FC = () => {
  const f = useCurrentFrame();
  return (
    <>
      {CAPS.filter((c) => f >= c.at && f < c.until).map((c, i) => {
        const p = pop(f, c.at, 6);
        const left = c.side === 'L';
        return (
          <div key={i} style={{
            position: 'absolute', top: 984, left: left ? 0 : MID, width: MID, display: 'flex', justifyContent: 'center',
            transform: `translateY(${(1 - p) * 30}px)`, opacity: p,
          }}>
            <div style={{
              fontFamily: C.sans, fontSize: 46, fontWeight: 800, lineHeight: 1, padding: '14px 26px', borderRadius: 12,
              color: left ? C.red : C.mintInk, background: left ? 'transparent' : C.mint, border: left ? `4px solid ${C.red}` : 'none',
            }}>
              {c.text}
            </div>
          </div>
        );
      })}
    </>
  );
};

// 左右の名札（常に出しておく）
const SideTags: React.FC = () => {
  const f = useCurrentFrame();
  if (f >= S.facts) return null;
  const tag = (side: 'L' | 'R') => (
    <div style={{
      position: 'absolute', top: 34, ...(side === 'L' ? {left: 60} : {right: 60}), display: 'flex', alignItems: 'center', gap: 14,
      fontFamily: C.sans, fontSize: 32, fontWeight: 700, color: side === 'L' ? C.darkInk2 : C.lightInk2,
    }}>
      <div style={{width: 18, height: 18, borderRadius: 4, background: side === 'L' ? C.red : C.mint}} />
      {side === 'L' ? '公式の LINE' : 'Linimal'}
    </div>
  );
  return <>{tag('L')}{tag('R')}</>;
};

// 左右の地と分割線。場面の頭で線が跳ね、最後は左へ抜ける
const JOLTS = [S.top, S.tabs, S.homeAgent, S.homeCard, S.settings, S.read];
const Ground: React.FC = () => {
  const f = useCurrentFrame();
  let x = MID;
  JOLTS.forEach((j, i) => {
    x += interpolate(f, [j, j + 3, j + 12], [0, (i % 2 ? -1 : 1) * 46, 0], {...clamp, easing: Easing.out(Easing.quad)});
  });
  x -= interpolate(f, [S.facts, S.facts + 12], [0, MID + 10], {...clamp, easing: Easing.inOut(Easing.cubic)});
  return (
    <>
      <AbsoluteFill style={{background: C.lightBg}} />
      <div style={{position: 'absolute', left: 0, top: 0, bottom: 0, width: Math.max(0, x), background: C.darkBg}} />
      {/* 見出しの帯（上 80〜230）では線を切って、文字と重ねない */}
      <div style={{position: 'absolute', left: x - 4, top: 0, height: 80, width: 8, background: C.mint}} />
      <div style={{position: 'absolute', left: x - 4, top: 230, bottom: 0, width: 8, background: C.mint}} />
    </>
  );
};

// ---------- 場面 ----------

const Open: React.FC = () => {
  const full: Rect = [0, 0, SW, SH];
  return (
    <>
      <Pane side="L" rect={full} over={MARKS.talkBefore.map((m, i) => <RedBox key={i} r={m as Rect} at={14 + i * 4} />)}>
        <Layer src={SRC.talkB} />
      </Pane>
      <Pane side="R" rect={full} over={MARKS.talkBefore.map((m, i) => <MintBox key={i} r={m as Rect} at={30 + i * 4} />)}>
        <Layer src={SRC.talkA} />
      </Pane>
    </>
  );
};

const Top: React.FC = () => {
  const f = useCurrentFrame();
  const rect: Rect = [0, 120, SW, 470];
  const T1 = 18;
  const T2 = 54;
  const hits = [T1, T1 + 3, T1 + 6, T2];
  return (
    <>
      <Pane side="L" rect={rect} enterAt={0} shake={hitShake(f, hits)} over={
        <>
          {R.topIcons.map((r, i) => <StampX key={i} r={r} at={T1 + i * 3} />)}
          <StampX r={R.searchAgent} at={T2} />
        </>
      }>
        <Layer src={SRC.talkB} />
      </Pane>
      <Pane side="R" rect={rect} enterAt={0} over={
        <>
          {R.topIcons.map((r, i) => <Vanish key={i} src={SRC.talkB} r={r} at={T1 + i * 3} patch />)}
          <Vanish src={SRC.talkB} r={R.searchAgent} at={T2} />
        </>
      }>
        <Layer src={f < T2 ? SRC.talkB : SRC.talkA} />
      </Pane>
    </>
  );
};

const Tabs: React.FC = () => {
  const f = useCurrentFrame();
  const rect: Rect = [0, 2440, SW, 2712];
  const T = 16;
  const SWAP = 34;
  return (
    <>
      <Pane side="L" rect={rect} enterAt={0} shake={hitShake(f, [T, T + 3, T + 6])} over={R.tabs.map((r, i) => <StampX key={i} r={r} at={T + i * 3} scale={0.9} />)}>
        <Layer src={SRC.talkB} />
      </Pane>
      <Pane side="R" rect={rect} enterAt={0} over={f < SWAP ? R.tabs.map((r, i) => <Vanish key={i} src={SRC.talkB} r={r} at={T + i * 3} patch />) : null}>
        <Layer src={f < SWAP ? SRC.talkB : SRC.talkA} />
      </Pane>
    </>
  );
};

const HomeAgent: React.FC = () => {
  const f = useCurrentFrame();
  const rect: Rect = [0, 110, SW, 340];
  const T = 16;
  return (
    <>
      <Pane side="L" rect={rect} enterAt={0} shake={hitShake(f, [T])} over={<StampX r={R.homeAgent} at={T} />}>
        <Layer src={SRC.homeB} />
      </Pane>
      <Pane side="R" rect={rect} enterAt={0} over={<Vanish src={SRC.homeB} r={R.homeAgent} at={T} patch />}>
        <Layer src={SRC.homeB} />
        {f >= T + 12 ? <Layer src={SRC.homeA} /> : null}
      </Pane>
    </>
  );
};

const HomeCard: React.FC = () => {
  const f = useCurrentFrame();
  // 友だちリストまで入れて、その下が詰まって何もないことを見せる
  const rect: Rect = [0, 780, SW, 2480];
  const T = 16;
  return (
    <>
      <Pane side="L" rect={rect} enterAt={0} shake={hitShake(f, [T])} over={
        <>
          <RedBox r={R.homeCard} at={T - 4} />
          <StampX r={[R.homeCard[0] + 200, R.homeCard[1] + 120, R.homeCard[2] - 200, R.homeCard[3] - 120]} at={T} scale={0.82} />
        </>
      }>
        <Layer src={SRC.homeB} />
      </Pane>
      <Pane side="R" rect={rect} enterAt={0} over={<Vanish src={SRC.homeB} r={R.homeCard} at={T} patch />}>
        <Layer src={SRC.homeB} />
        {f >= T + 12 ? <Layer src={SRC.homeA} /> : null}
      </Pane>
    </>
  );
};

const Settings: React.FC = () => {
  const f = useCurrentFrame();
  const rect: Rect = [0, 1250, SW, 2460];
  const T = 16;
  const [, rowTop, , rowBottom] = R.setRow;
  const p = interpolate(f, [T, T + 10], [0, 1], {...clamp, easing: Easing.inOut(Easing.cubic)});
  const done = f >= T + 12;
  return (
    <>
      <Pane side="L" rect={rect} enterAt={0} shake={hitShake(f, [T])} over={
        <>
          <RedBox r={R.setRow} at={T - 4} />
          <Strike r={[R.setRow[0] + 40, R.setRow[1], R.setRow[2] - 40, R.setRow[3]]} at={T} />
        </>
      }>
        <Layer src={SRC.setB} />
      </Pane>
      <Pane side="R" rect={rect} enterAt={0}>
        {done ? (
          <Layer src={SRC.setA} />
        ) : f < T ? (
          <Layer src={SRC.setB} />
        ) : (
          <>
            {/* 行が縮んで、下の項目が詰まる */}
            <Crop src={SRC.setB} r={[0, 0, SW, rowTop]} />
            <Crop src={SRC.setB} r={R.setRow} style={{transform: `scale(${1 - p * 0.3}, ${1 - p})`, transformOrigin: '50% 0%', opacity: 1 - p}} />
            <Crop src={SRC.setB} r={[0, rowBottom, SW, SH]} style={{transform: `translateY(${-R.setShift * p}px)`}} />
          </>
        )}
      </Pane>
    </>
  );
};

const Read: React.FC = () => {
  const f = useCurrentFrame();
  const list: Rect = [0, 420, SW, 1110];
  const room: Rect = [0, 120, SW, 1500];
  const OPEN = 24;
  const BACK = 78;
  const phase = f < OPEN ? 0 : f < BACK ? 1 : 2;
  const rect = phase === 1 ? room : list;
  const enter = phase === 0 ? 0 : phase === 1 ? OPEN : BACK;
  return (
    <>
      <Pane side="L" rect={rect} enterAt={enter} over={
        phase === 0 ? <Touch ring={C.red} x={620} y={551} at={8} hold={10} /> : null
      }>
        <Layer src={phase === 0 ? SRC.unread : phase === 1 ? SRC.roomOn : SRC.readList} />
      </Pane>
      <Pane side="R" rect={rect} enterAt={enter} over={
        phase === 0 ? <Touch ring={C.mint} x={620} y={551} at={8} hold={10} /> : phase === 1 ? <MintBox r={R.banner} at={OPEN + 8} /> : <MintBox r={R.badge} at={BACK + 8} round />
      }>
        <Layer src={phase === 1 ? SRC.roomOff : SRC.unread} />
      </Pane>
    </>
  );
};

// 分割線が抜けたあと、右側（Linimal）の地で事実を積み上げる
const FACTS: {big: string; small: string}[] = [
  {big: '9 か所', small: 'Agent i・LINE AI の入口を消せる'},
  {big: '7 ページ', small: 'の設定に分かれている'},
  {big: '個別に', small: 'すべての機能を ON / OFF'},
  {big: 'OFF なら', small: '公式の LINE と同じ動作'},
];
const MiniSwitch: React.FC<{at: number}> = ({at}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  const s = spring({frame: f - at - 4, fps, config: {damping: 14, stiffness: 260, mass: 0.6}});
  const on = s > 0.5;
  return (
    <div style={{position: 'relative', width: 120, height: 68, borderRadius: 34, background: on ? C.mint : C.lightRule, flexShrink: 0}}>
      <div style={{position: 'absolute', top: 8, left: 8 + s * 52, width: 52, height: 52, borderRadius: 26, background: on ? C.mintInk : C.white}} />
    </div>
  );
};
const Facts: React.FC = () => {
  const f = useCurrentFrame();
  const START = 12;
  const STEP = 24;
  return (
    <AbsoluteFill style={{fontFamily: C.sans, color: C.lightInk}}>
      <div style={{position: 'absolute', left: 160, top: 70, fontSize: 36, fontWeight: 700, color: C.lightInk2, opacity: pop(f, START - 4, 6)}}>
        Linimal の設定
      </div>
      {FACTS.map((it, i) => {
        const at = START + i * STEP;
        if (f < at) return null;
        const p = pop(f, at, 6);
        return (
          <div key={i} style={{
            position: 'absolute', left: 160, top: 170 + i * 190, display: 'flex', alignItems: 'center', gap: 56,
            transform: `translateX(${(1 - p) * 80}px)`, opacity: Math.min(1, p * 2),
          }}>
            <MiniSwitch at={at} />
            <div style={{width: 560, fontSize: 116, fontWeight: 800, letterSpacing: '-0.03em', lineHeight: 1, whiteSpace: 'nowrap'}}>{it.big}</div>
            <div style={{fontSize: 52, fontWeight: 700, lineHeight: 1.2, whiteSpace: 'nowrap', color: C.lightInk}}>{it.small}</div>
          </div>
        );
      })}
    </AbsoluteFill>
  );
};

const End: React.FC = () => {
  const f = useCurrentFrame();
  const p = pop(f, 0, 8);
  const u = pop(f, 10, 8);
  const n = pop(f, 18, 8);
  return (
    <AbsoluteFill style={{background: C.lightBg, fontFamily: C.sans, color: C.lightInk}}>
      <div style={{position: 'absolute', left: 160, top: 250, transform: `translateY(${(1 - p) * 40}px)`, opacity: p}}>
        <div style={{fontSize: 230, fontWeight: 800, letterSpacing: '-0.04em', lineHeight: 1}}>Linimal</div>
        <div style={{marginTop: 18, width: 560 * p, height: 16, background: C.mint}} />
      </div>
      <div style={{position: 'absolute', left: 164, top: 600, fontFamily: C.mono, fontSize: 56, fontWeight: 700, opacity: u}}>
        github.com/uta-a/linimal
      </div>
      <div style={{position: 'absolute', left: 164, top: 700, fontSize: 40, fontWeight: 600, color: C.lightInk, opacity: u}}>
        公式の LINE Android 向けの Morphe パッチバンドル
      </div>
      <div style={{position: 'absolute', left: 164, right: 120, top: 920, fontSize: 30, fontWeight: 500, lineHeight: 1.5, color: C.lightInk2, opacity: n}}>
        LINE・Morphe の公式プロジェクトではありません。対象は LINE 26.16.0。画面の名前とトークは架空です。
      </div>
    </AbsoluteFill>
  );
};

// ---------- 全体 ----------
const SCENES: [number, number, React.FC][] = [
  [S.open, S.top, Open],
  [S.top, S.tabs, Top],
  [S.tabs, S.homeAgent, Tabs],
  [S.homeAgent, S.homeCard, HomeAgent],
  [S.homeCard, S.settings, HomeCard],
  [S.settings, S.read, Settings],
  [S.read, S.facts, Read],
  [S.facts, S.end, Facts],
  [S.end, SPLIT_TOTAL, End],
];

export const VariantSplit: React.FC = () => (
  <AbsoluteFill style={{background: C.lightBg, fontFamily: C.sans, overflow: 'hidden'}}>
    <Ground />
    {SCENES.map(([from, to, Scene]) => (
      <Sequence key={from} from={from} durationInFrames={to - from} layout="none">
        <Scene />
      </Sequence>
    ))}
    <SideTags />
    <Captions />
    <Headline />
  </AbsoluteFill>
);
