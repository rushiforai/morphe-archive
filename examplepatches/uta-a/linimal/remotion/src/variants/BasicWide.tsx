// 28秒の基本版。操作は架空の会話を使った再現。既存の動画は変更しない。
import React from 'react';
import {AbsoluteFill, Img, Sequence, interpolate, staticFile, useCurrentFrame} from 'remotion';
import {Layer, MARKS, OpenWithoutReceiptScreen, ScrollPreviewScreen, SpeedContext, Touch} from '../shared/screens';
import {Shot, Slam, useSpring} from '../x/parts';

const C = {
  bg: '#171D1B', ink: '#F4F5F3', muted: '#B6C3BD', mint: '#8EE4C0',
  red: '#ED8075', rule: '#46564E', dark: '#19382B',
  sans: "'Hiragino Sans', sans-serif", mono: 'Menlo, monospace',
};
export const BASIC_WIDE_TOTAL = 840;
const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;
const mix = (f: number, a: number, b: number) => interpolate(f, [a, b], [0, 1], clamp);
const Box: React.FC<React.PropsWithChildren> = ({children}) => <AbsoluteFill style={{background: C.bg, color: C.ink, fontFamily: C.sans, overflow: 'hidden'}}>{children}</AbsoluteFill>;
const Text: React.FC<{lines: string[]; sub?: string; top?: number}> = ({lines, sub, top = 290}) => <div style={{position: 'absolute', left: 110, top, width: 1030}}>
  {lines.map((line, i) => <Slam key={line} text={line} at={-24 + i * 3} size={98} color={i === lines.length - 1 ? C.mint : C.ink} />)}
  {sub && <div style={{fontSize: 34, lineHeight: 1.7, marginTop: 38, color: C.muted, whiteSpace: 'pre-line'}}>{sub}</div>}
</div>;
const Screen: React.FC<React.PropsWithChildren> = ({children}) => <Shot h={960} left={1320} top={70} cropTop={120} at={-24}>{children}</Shot>;

const Hook: React.FC = () => {
  const f = useCurrentFrame();
  return <Box><div style={{position: 'absolute', left: 110, top: 95, fontFamily: C.mono, fontSize: 30, color: C.mint}}>Linimal / Android</div>
    <div style={{position: 'absolute', left: 110, top: 330, transform: `translateX(${Math.sin(f * 0.5) * Math.max(0, 1 - f / 35) * 3}px)`}}>
      <Slam text="その LINE、" at={-30} size={108} color={C.ink}/>
      <Slam text="ごちゃごちゃ" at={-30} size={140} color={C.mint}/>
      <Slam text="してない？" at={-30} size={140} color={C.ink}/>
    </div><Screen><Layer src="screenshots/line-talk-list-before.png" /></Screen></Box>;
};

const Compare: React.FC<{home?: boolean}> = ({home = false}) => {
  const f = useCurrentFrame();
  const p = mix(f, home ? 24 : 55, home ? 68 : 90);
  const stem = home ? 'line-home' : 'line-talk-list';
  const marks = home ? MARKS.homeBefore : MARKS.talkBefore;
  return <Box>
    <Text lines={home ? ['ホームも、', '必要な表示だけ。'] : ['使わない表示を、', 'すっきり。']} sub={home ? 'Agent i・おすすめ・投稿カードを非表示に。' : '上部のアイコン、検索欄の Agent i を非表示に。'}/>
    {!home && <div style={{position: 'absolute', left: 110, top: 690, fontSize: 42, color: C.muted}}>下部タブ <span style={{fontSize: 120, fontWeight: 800, color: C.mint}}>5 → 2</span></div>}
    <div style={{position: 'absolute', left: 1320, top: 22, fontSize: 26, color: p < 1 ? C.red : C.mint}}>{p < 1 ? '変更前 → Linimal' : 'Linimal 適用・設定後'}</div>
    <Screen>
      <Layer src={`screenshots/${stem}-before.png`} />
      {marks.map((m, i) => <div key={i} style={{position: 'absolute', left: m[0], top: m[1], width: m[2] - m[0], height: m[3] - m[1], border: `10px solid ${C.red}`, borderRadius: 22, opacity: mix(f, 5 + i * 4, 12 + i * 4) * (1 - p)}}/>)}
      <Layer src={`screenshots/${stem}.png`} style={{clipPath: home ? `inset(0 ${100 - p * 100}% 0 0)` : `inset(0 0 ${100 - p * 100}% 0)`}}/>
      {p > 0 && p < 1 && <div style={{position: 'absolute', background: C.mint, ...(home ? {left: 1220 * p, top: 120, bottom: 0, width: 12} : {left: 0, right: 0, top: 2712 * p, height: 12})}}/>}
    </Screen>
  </Box>;
};
const ReadTitle: React.FC = () => <AbsoluteFill style={{background: C.mint, color: C.dark, fontFamily: C.sans, padding: '300px 110px'}}>
  <Slam text="既読、" at={-20} size={160} color={C.dark}/><Slam text="つけずに読める。" at={-14} size={160} color={C.dark}/>
</AbsoluteFill>;

const Demo: React.FC = () => {
  const f = useCurrentFrame();
  // 見出しは排他的に切り替える。受信側の画面に相手側の既読表示は重ねない。
  const lines = f < 45 ? ['トークを', '長押し。'] : f < 125 ? ['メニューから、', '未読のまま読む。'] : ['読み終えたら、', 'まとめて既読。'];
  return <Box><Text key={lines[0]} lines={lines} sub={f < 125 ? '「既読をつけずに読む」を選択。' : '「すべて既読にする」をタップ。'}/>
    <Screen><SpeedContext.Provider value={1.4}>
      <Sequence durationInFrames={45} layout="none"><ScrollPreviewScreen ring={C.mint}/></Sequence>
      <Sequence from={45} durationInFrames={80} layout="none"><OpenWithoutReceiptScreen ring={C.mint}/></Sequence>
      <Sequence from={125} layout="none"><Layer src="screenshots/chat/room-read-disabled-mock.png"/><Layer src="screenshots/chat/room-read-enabled-mock.png" style={{opacity: mix(f, 154, 162)}}/><Touch x={938} y={2390} at={30} ring={C.mint}/></Sequence>
    </SpeedContext.Provider></Screen>
  </Box>;
};
const Readers: React.FC = () => {
  const f = useCurrentFrame();
  const p = useSpring(35);
  return <Box><Text lines={['グループで、', '誰が読んだか。']} top={130} sub="既読の横にアイコン。タップで一覧へ。"/>
    <div style={{position: 'absolute', left: 110, top: 550, width: 1030, overflow: 'hidden', borderRadius: 20, outline: `2px solid ${C.rule}`}}>
      <Img src={staticFile('screenshots/readers/chat-anonymized.png')} style={{display: 'block', width: '100%'}}/>
      <div style={{position: 'absolute', left: 738 / 1220 * 1030, top: 318 / 1220 * 1030, width: 168 / 1220 * 1030, height: 64 / 1220 * 1030, border: `4px solid ${C.mint}`, borderRadius: 25, opacity: mix(f, 6, 12)}}/>
    </div>
    <Img src={staticFile('screenshots/readers/dialog-anonymized.png')} style={{position: 'absolute', left: 1300, top: 90, width: 470, borderRadius: 20, outline: `2px solid ${C.rule}`, opacity: Math.min(1, p), transform: `translateY(${(1 - p) * 700}px)`}}/>
  </Box>;
};
const Settings: React.FC = () => {
  const f = useCurrentFrame();
  return <Box><Text lines={['使う機能だけ、', '個別に ON / OFF。']} top={250} sub={'設定 OFF なら、公式と同じ動作。\n※終了した VOOM は常に非表示。\n表示系の設定は再起動後に反映。'}/>
    <div style={{position: 'absolute', left: 1200, top: 210, width: 600}}>
      {['広告を表示しない', 'Agent i を表示しない', '背景を真っ黒に', 'リンクを外部ブラウザで'].map((label, i) => <div key={label} style={{height: 145, borderTop: `2px solid ${C.rule}`, display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 15}}>
        <span style={{fontSize: 32, fontWeight: 700}}>{label}</span><span style={{fontFamily: C.mono, fontSize: 28, padding: '14px 18px', background: f > 8 + i * 12 ? C.mint : C.rule, color: f > 8 + i * 12 ? C.dark : C.ink}}>{f > 8 + i * 12 ? 'ON' : 'OFF'}</span>
      </div>)}<div style={{fontSize: 23, color: C.muted, marginTop: 24}}>設定項目の紹介イメージ</div>
    </div></Box>;
};
const End: React.FC = () => <Box><div style={{position: 'absolute', left: 110, top: 205}}>
  <Slam text="Linimal" at={-20} size={220} color={C.ink}/>
  <div style={{fontSize: 44, marginTop: 35, color: C.muted}}>公式 LINE Android 版向けの Morphe パッチバンドル</div>
  <div style={{fontFamily: C.mono, fontSize: 56, color: C.mint, marginTop: 65}}>github.com/uta-a/linimal</div>
</div><div style={{position: 'absolute', left: 110, right: 110, bottom: 100, fontSize: 30, lineHeight: 1.8, color: C.muted}}>LINE・Morphe の公式プロジェクトではありません。対象は LINE 26.16.0。<br/>画面の名前とトークは架空です。</div></Box>;

const Transition: React.FC<{at: number}> = ({at}) => {
  const f = useCurrentFrame();
  if (f < at - 7 || f > at + 7) return null;
  const x = interpolate(f, [at - 7, at, at + 7], [-130, 0, 130]);
  return <AbsoluteFill style={{background: C.mint, transform: `translateX(${x}%) skewX(-12deg)`}}/>;
};
export const LinimalBasicWide: React.FC = () => {
  const f = useCurrentFrame();
  return <Box>
    <Sequence durationInFrames={60}><Hook/></Sequence>
    <Sequence from={60} durationInFrames={135}><Compare/></Sequence>
    <Sequence from={195} durationInFrames={90}><Compare home/></Sequence>
    <Sequence from={285} durationInFrames={45}><ReadTitle/></Sequence>
    <Sequence from={330} durationInFrames={195}><Demo/></Sequence>
    <Sequence from={525} durationInFrames={105}><Readers/></Sequence>
    <Sequence from={630} durationInFrames={90}><Settings/></Sequence>
    <Sequence from={720} durationInFrames={120}><End/></Sequence>
    {[60, 195, 285, 330, 525, 630, 720].map(at => <Transition key={at} at={at}/>)}
    <div style={{position: 'absolute', left: 0, bottom: 0, height: 8, width: `${f / (BASIC_WIDE_TOTAL - 1) * 100}%`, background: C.mint}}/>
  </Box>;
};
