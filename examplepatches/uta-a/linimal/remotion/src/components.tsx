import React from 'react';
import {
  AbsoluteFill,
  Img,
  OffthreadVideo,
  interpolate,
  spring,
  staticFile,
  useCurrentFrame,
  useVideoConfig,
  Easing,
} from 'remotion';
import {C, FONT} from './theme';

// 実機画面は 1220×2712
export const SCREEN_RATIO = 2712 / 1220;

export const useFadeInOut = (inFrames = 12, outFrames = 12) => {
  const frame = useCurrentFrame();
  const {durationInFrames} = useVideoConfig();
  return Math.min(
    interpolate(frame, [0, inFrames], [0, 1], {extrapolateRight: 'clamp'}),
    interpolate(frame, [durationInFrames - outFrames, durationInFrames], [1, 0], {
      extrapolateLeft: 'clamp',
    }),
  );
};

export const useRise = (delay = 0) => {
  const frame = useCurrentFrame();
  const {fps} = useVideoConfig();
  const s = spring({frame: frame - delay, fps, config: {damping: 200}});
  return {opacity: s, transform: `translateY(${(1 - s) * 30}px)`};
};

// スマホの枠。children に画面の中身（Img / OffthreadVideo）を入れる
export const Phone: React.FC<{height: number; children: React.ReactNode; style?: React.CSSProperties}> = ({
  height,
  children,
  style,
}) => {
  const w = height / SCREEN_RATIO;
  const bezel = height * 0.018;
  return (
    <div
      style={{
        width: w + bezel * 2,
        height: height + bezel * 2,
        padding: bezel,
        borderRadius: height * 0.06,
        background: '#2A2A2A',
        boxShadow: '0 40px 80px rgba(0,0,0,0.55), inset 0 0 0 2px #3A3A3A',
        ...style,
      }}
    >
      <div
        style={{
          width: w,
          height,
          borderRadius: height * 0.05,
          overflow: 'hidden',
          position: 'relative',
          background: '#000',
        }}
      >
        {children}
      </div>
    </div>
  );
};

export const Screen: React.FC<{src: string; style?: React.CSSProperties}> = ({src, style}) => (
  <Img src={staticFile(src)} style={{position: 'absolute', inset: 0, width: '100%', height: '100%', ...style}} />
);

export const ScreenVideo: React.FC<{src: string; startFrom?: number; playbackRate?: number}> = ({
  src,
  startFrom = 0,
  playbackRate = 1,
}) => (
  <OffthreadVideo
    src={staticFile(src)}
    startFrom={startFrom}
    playbackRate={playbackRate}
    muted
    style={{position: 'absolute', inset: 0, width: '100%', height: '100%'}}
  />
);

// Before → After を左から右へのワイプで切り替える
export const Wipe: React.FC<{before: string; after: string; start: number; duration?: number}> = ({
  before,
  after,
  start,
  duration = 30,
}) => {
  const frame = useCurrentFrame();
  const p = interpolate(frame, [start, start + duration], [0, 100], {
    extrapolateLeft: 'clamp',
    extrapolateRight: 'clamp',
    easing: Easing.inOut(Easing.cubic),
  });
  return (
    <>
      <Screen src={before} />
      <Screen src={after} style={{clipPath: `inset(0 ${100 - p}% 0 0)`}} />
      {p > 0 && p < 100 ? (
        <div
          style={{
            position: 'absolute',
            top: 0,
            bottom: 0,
            left: `${p}%`,
            width: 4,
            marginLeft: -2,
            background: C.accent,
            boxShadow: `0 0 24px ${C.accent}`,
          }}
        />
      ) : null}
    </>
  );
};

export const Badge: React.FC<{label: string; color: string; style?: React.CSSProperties}> = ({label, color, style}) => (
  <div
    style={{
      position: 'absolute',
      padding: '8px 22px',
      borderRadius: 999,
      background: color,
      color: '#111',
      fontFamily: FONT,
      fontWeight: 800,
      fontSize: 26,
      letterSpacing: 1,
      ...style,
    }}
  >
    {label}
  </div>
);

export const SceneBg: React.FC<{children: React.ReactNode}> = ({children}) => {
  const opacity = useFadeInOut();
  return (
    <AbsoluteFill
      style={{
        background: `radial-gradient(1200px 800px at 25% 50%, #1b2621 0%, ${C.bg} 60%)`,
        fontFamily: FONT,
        color: C.text,
        opacity,
      }}
    >
      {children}
    </AbsoluteFill>
  );
};

// 右側の説明テキスト
export const Caption: React.FC<{
  kicker?: string;
  title: React.ReactNode;
  body?: React.ReactNode;
  items?: string[];
  left?: number;
  width?: number;
}> = ({kicker, title, body, items, left = 820, width = 960}) => {
  const k = useRise(4);
  const t = useRise(10);
  const b = useRise(18);
  return (
    <div style={{position: 'absolute', left, top: 0, bottom: 0, width, display: 'flex', flexDirection: 'column', justifyContent: 'center'}}>
      {kicker ? (
        <div style={{...k, color: C.accent, fontSize: 30, fontWeight: 700, letterSpacing: 2, marginBottom: 18}}>{kicker}</div>
      ) : null}
      <div style={{...t, fontSize: 64, fontWeight: 800, lineHeight: 1.3}}>{title}</div>
      {body ? <div style={{...b, fontSize: 32, color: C.muted, lineHeight: 1.7, marginTop: 28}}>{body}</div> : null}
      {items ? (
        <div style={{marginTop: 36, display: 'flex', flexDirection: 'column', gap: 18}}>
          {items.map((it, i) => (
            <Item key={it} text={it} delay={24 + i * 8} />
          ))}
        </div>
      ) : null}
    </div>
  );
};

const Item: React.FC<{text: string; delay: number}> = ({text, delay}) => {
  const r = useRise(delay);
  return (
    <div style={{...r, display: 'flex', alignItems: 'center', gap: 20, fontSize: 34}}>
      <div style={{width: 14, height: 14, borderRadius: 7, background: C.accent, flexShrink: 0}} />
      <div>{text}</div>
    </div>
  );
};
