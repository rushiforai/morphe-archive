// 15秒・横型。既存版を変更せず、モーションと音をフレームに同期する。
import React from 'react';
import {AbsoluteFill, Audio, Easing, Img, Sequence, interpolate, spring, staticFile, useCurrentFrame} from 'remotion';

export const SHORT_TOTAL = 450;
const C = {ink: '#111713', paper: '#f3f5ed', green: '#b7f65b', muted: '#9ba69c', rule: '#344037', white: '#ffffff'};
const FONT = '"Hiragino Sans", "Noto Sans JP", sans-serif';
const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;
const progress = (f: number, start: number, end: number) => interpolate(f, [start, end], [0, 1], {...clamp, easing: Easing.bezier(0.16, 1, 0.3, 1)});
const bounce = (f: number, delay = 0) => spring({frame: f - delay, fps: 30, config: {damping: 19, stiffness: 180, mass: 0.8}});

const Words: React.FC<{text: string; delay?: number; size?: number; color?: string}> = ({text, delay = 0, size = 116, color = C.paper}) => {
  const f = useCurrentFrame();
  return <div style={{fontSize: size, fontWeight: 800, letterSpacing: '-0.065em', lineHeight: 1.23, color, whiteSpace: 'nowrap'}}>
    {[...text].map((c, i) => {const p = bounce(f, delay + i * 1.3); return <span key={i} style={{display: 'inline-block', opacity: progress(f, delay + i * 1.3, delay + i * 1.3 + 4), transform: `translateY(${80 * (1 - p)}px) rotate(${(1 - p) * 7}deg)`}}>{c === ' ' ? '\u00a0' : c}</span>;})}
  </div>;
};
const Caption: React.FC<{children: React.ReactNode; delay?: number}> = ({children, delay = 14}) => {
  const f = useCurrentFrame(); const p = progress(f, delay, delay + 12);
  return <div style={{fontSize: 30, lineHeight: 1.6, color: C.muted, marginTop: 30, opacity: p, transform: `translateY(${20 * (1 - p)}px)`}}>{children}</div>;
};
const Base: React.FC<{light?: boolean; children: React.ReactNode}> = ({light, children}) => <AbsoluteFill style={{background: light ? C.green : C.ink, color: light ? C.ink : C.paper, fontFamily: FONT, overflow: 'hidden'}}>{children}</AbsoluteFill>;
const Tag: React.FC<{n: string; label: string; dark?: boolean}> = ({n, label, dark}) => <div style={{position: 'absolute', top: 70, left: 90, fontSize: 23, letterSpacing: '0.12em', color: dark ? C.ink : C.muted}}>{n} / {label}</div>;

const Hook: React.FC = () => {
  const f = useCurrentFrame(); const p = progress(f, 29, 47);
  return <Base>
    {['広告', 'AI', 'ニュース', 'ウォレット', 'おすすめ'].map((s, i) => {
      const x = [180, 1420, 210, 1330, 750][i]; const y = [125, 170, 750, 720, 845][i];
      return <div key={s} style={{position: 'absolute', left: x, top: y, fontSize: 34, padding: '18px 35px', border: `1px solid ${C.rule}`, color: C.muted, borderRadius: 100, transform: `translate(${(x - 960) * p * 2}px, ${(y - 500) * p * 2}px) rotate(${(i % 2 ? 1 : -1) * (4 + p * 40)}deg)`, opacity: 1 - p}}>{s}</div>;
    })}
    <div style={{position: 'absolute', left: 240, top: 337}}><Words text="LINEを、" size={130}/><Words text="もっと身軽に。" size={144} delay={12} color={C.green}/></div>
    <div style={{position: 'absolute', right: 90, bottom: 70, fontSize: 24, color: C.muted}}>Linimal / Android</div>
  </Base>;
};

const Clean: React.FC = () => {
  const f = useCurrentFrame(); const wipe = progress(f, 30, 65); const entry = bounce(f);
  return <Base><Tag n="01" label="LESS NOISE"/>
    <div style={{position: 'absolute', left: 90, top: 325}}><Words text="いらない表示、" size={96}/><Words text="まとめてオフ。" size={96} delay={6} color={C.green}/><Caption>広告も、AIの入口も、使わないタブも。</Caption></div>
    <div style={{position: 'absolute', left: 1020, top: 113, width: 720, height: 850, transform: `translateY(${(1 - entry) * 130}px)`}}>
      <div style={{position: 'absolute', left: 0, top: 90, width: 330, height: 734, overflow: 'hidden', opacity: 0.48, transform: 'rotate(-6deg)'}}><Img src={staticFile('screenshots/line-talk-list-before.png')} style={{width: '100%'}}/></div>
      <div style={{position: 'absolute', left: 310, width: 365, height: 812, overflow: 'hidden', transform: 'rotate(3deg)', border: `2px solid ${C.rule}`}}>
        <Img src={staticFile('screenshots/line-talk-list-before.png')} style={{position: 'absolute', width: '100%'}}/>
        <div style={{position: 'absolute', inset: 0, clipPath: `inset(0 0 ${100 * (1 - wipe)}% 0)`}}><Img src={staticFile('screenshots/line-talk-list.png')} style={{width: '100%'}}/></div>
        {wipe > 0 && wipe < 1 ? <div style={{position: 'absolute', top: wipe * 812, height: 5, width: '100%', background: C.green}}/> : null}
      </div>
      <div style={{position: 'absolute', left: 300, top: 850, color: C.green, fontSize: 21, letterSpacing: '0.08em', whiteSpace: 'nowrap'}}>YOUR LINE. LESS NOISE.</div>
    </div>
  </Base>;
};

const Read: React.FC = () => {
  const f = useCurrentFrame(); const p = bounce(f, 12);
  return <Base light><Tag n="02" label="YOUR PACE" dark/>
    <div style={{position: 'absolute', left: 90, top: 320}}><Words text="既読をつけずに、" size={100} color={C.ink}/><Words text="じっくり読む。" size={100} delay={7} color={C.ink}/><div style={{marginTop: 36, fontSize: 30}}>長押しメニューや通知から。設定で有効に。</div></div>
    <div style={{position: 'absolute', right: 125, top: 190, width: 650, height: 650, borderRadius: '50%', border: `2px solid ${C.ink}`, transform: `scale(${p})`}}>
      <div style={{position: 'absolute', left: 70, right: -20, top: 150, padding: '42px 45px', borderRadius: '40px 40px 40px 4px', background: C.ink, color: C.paper, fontSize: 38, lineHeight: 1.7, transform: `translateY(${Math.sin(f / 20) * 7}px)`}}>明日の待ち合わせ、<br/>駅前で大丈夫？<div style={{color: C.muted, fontSize: 23, marginTop: 15}}>架空のメッセージ</div></div>
      <div style={{position: 'absolute', top: 425, left: 190, padding: '18px 30px', borderRadius: 60, background: C.paper, fontSize: 31, transform: `scale(${bounce(f, 29)})`}}>未読のまま <span style={{display: 'inline-flex', marginLeft: 15, borderRadius: '50%', width: 44, height: 44, alignItems: 'center', justifyContent: 'center', background: C.ink, color: C.green}}>1</span></div>
    </div>
  </Base>;
};

const Choose: React.FC = () => {
  const f = useCurrentFrame();
  return <Base><Tag n="03" label="YOU ARE IN CONTROL"/>
    <div style={{position: 'absolute', left: 90, top: 330}}><Words text="使う機能は、" size={108}/><Words text="自分で選ぶ。" size={108} delay={6} color={C.green}/><Caption>LINEの設定から個別にON / OFF。</Caption></div>
    <div style={{position: 'absolute', left: 1100, top: 245, width: 650}}>
      {['広告を非表示', '既読をつけずに読む', '背景を真っ黒に'].map((label, i) => {const p = progress(f, 12 + i * 10, 22 + i * 10); return <div key={label} style={{height: 145, display: 'flex', alignItems: 'center', justifyContent: 'space-between', borderBottom: `1px solid ${C.rule}`, opacity: progress(f, i * 5, i * 5 + 10), fontSize: 36}}>{label}<div style={{width: 110, height: 60, borderRadius: 40, background: p > 0.5 ? C.green : C.rule, position: 'relative'}}><div style={{position: 'absolute', width: 44, height: 44, top: 8, left: 8 + 50 * p, borderRadius: '50%', background: C.ink}}/></div></div>;})}
    </div>
  </Base>;
};

const End: React.FC = () => {
  const f = useCurrentFrame(); const p = progress(f, 0, 18);
  return <Base>
    <div style={{position: 'absolute', width: 900, height: 900, borderRadius: '50%', border: `2px solid ${C.rule}`, left: 510, top: 90, transform: `scale(${0.8 + p * 0.2})`}}/>
    <div style={{position: 'absolute', left: 0, right: 0, top: 250, textAlign: 'center'}}>
      <div style={{fontSize: 36, color: C.green, opacity: p}}>LINEを、もっと身軽に。</div>
      <div style={{fontSize: 210, fontWeight: 800, letterSpacing: '-0.075em', lineHeight: 1.35, transform: `scale(${0.86 + 0.14 * bounce(f, 3)})`}}>Linimal<span style={{color: C.green}}>.</span></div>
      <div style={{fontSize: 30, color: C.muted}}>LINE Android向けの非公式カスタマイズパッチ</div>
      <div style={{display: 'inline-flex', gap: 45, alignItems: 'center', marginTop: 47, fontSize: 36, color: C.green, opacity: progress(f, 15, 26)}}>github.com/uta-a/linimal <span>↗</span></div>
    </div>
    <div style={{position: 'absolute', left: 90, right: 90, bottom: 67, display: 'flex', justifyContent: 'space-between', fontSize: 22, color: C.muted}}><span>対象：LINE 26.16.0 / Android arm64-v8a</span><span>LINE・Morpheの公式プロジェクトではありません</span></div>
  </Base>;
};

export const LinimalShort: React.FC = () => {
  const f = useCurrentFrame();
  // カット点の直前だけアクセント面が横切る。文字の可読時間は確保する。
  const cut = [60, 165, 255, 330].find(t => f >= t - 6 && f < t + 5);
  const x = cut === undefined ? -2000 : interpolate(f, [cut - 6, cut, cut + 5], [-2000, 0, 2000]);
  return <AbsoluteFill>
    <Audio src={staticFile('audio/short-beat.wav')} volume={0.7}/>
    <Sequence durationInFrames={60}><Hook/></Sequence>
    <Sequence from={60} durationInFrames={105}><Clean/></Sequence>
    <Sequence from={165} durationInFrames={90}><Read/></Sequence>
    <Sequence from={255} durationInFrames={75}><Choose/></Sequence>
    <Sequence from={330} durationInFrames={120}><End/></Sequence>
    {cut !== undefined ? <AbsoluteFill style={{background: C.green, transform: `translateX(${x}px) skewX(-12deg)`}}/> : null}
    <div style={{position: 'absolute', bottom: 0, left: 0, height: 5, width: `${(f + 1) / SHORT_TOTAL * 100}%`, background: C.green}}/>
  </AbsoluteFill>;
};
