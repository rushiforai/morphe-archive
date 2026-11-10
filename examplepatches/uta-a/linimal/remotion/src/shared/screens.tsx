// 実機の UI を再現したモック画像を、実機の画面座標（1220×2712）で動かす共通部品。
// レイアウト（枠・配置・文字）は持たない。各デザイン案が自由に配置する。
import React, {createContext, useContext} from 'react';
import {Img, interpolate, spring, staticFile, useCurrentFrame, useVideoConfig, Easing} from 'remotion';

export const SW = 1220;
export const SH = 2712;
export const widthFor = (h: number) => (h * SW) / SH;
const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;

// 画面の操作アニメーションの再生速度。デザイン案ごとに Provider で変える（既定は等速）
export const SpeedContext = createContext(1);
export const useSpeed = () => useContext(SpeedContext);
// 速度を掛けたフレーム番号
const useF = () => useCurrentFrame() * useSpeed();

// 画面 1 枚分の箱。height に合わせて縮小する。枠は描かない（実画面だけを見せる）
export const ScreenBox: React.FC<{height: number; children: React.ReactNode; style?: React.CSSProperties}> = ({height, children, style}) => (
  <div style={{position: 'relative', width: widthFor(height), height, overflow: 'hidden', ...style}}>
    <div style={{position: 'absolute', left: 0, top: 0, width: SW, height: SH, transform: `scale(${height / SH})`, transformOrigin: 'top left'}}>
      {children}
    </div>
  </div>
);

export const Layer: React.FC<{src: string; style?: React.CSSProperties}> = ({src, style}) => (
  <Img src={staticFile(src)} style={{position: 'absolute', left: 0, top: 0, width: SW, height: SH, ...style}} />
);

// 指の位置。発光はさせず、半透明の円と細い輪だけ
export const Touch: React.FC<{x: number; y: number; at: number; hold?: number; toY?: number; moveFrom?: number; moveTo?: number; ring: string}> = ({
  x, y, at, hold = 8, toY, moveFrom = 0, moveTo = 0, ring,
}) => {
  const frame = useF();
  const f = frame - at;
  if (f < -6 || f > hold + 16) return null;
  const appear = interpolate(f, [-6, 0], [0, 1], clamp);
  const leave = interpolate(f, [hold, hold + 10], [1, 0], clamp);
  const grow = interpolate(f, [0, hold + 8], [0, 1], clamp);
  const my = toY !== undefined ? interpolate(frame, [moveFrom, moveTo], [y, toY], {...clamp, easing: Easing.inOut(Easing.quad)}) : y;
  return (
    <>
      <div style={{position: 'absolute', left: x - 64, top: my - 64, width: 128, height: 128, borderRadius: 64, background: 'rgba(255,255,255,0.22)', border: '4px solid rgba(255,255,255,0.7)', opacity: appear * leave}} />
      <div style={{position: 'absolute', left: x - 64, top: my - 64, width: 128, height: 128, borderRadius: 64, border: `4px solid ${ring}`, opacity: (1 - grow) * leave, transform: `scale(${1 + grow * 1.2})`}} />
    </>
  );
};

// Before / After の該当箇所を囲む（座標は実機の画面座標）
export type Mark = [number, number, number, number];
export const Marks: React.FC<{marks: Mark[]; color: string; from: number}> = ({marks, color, from}) => {
  const frame = useF();
  return (
    <>
      {marks.map((m, i) => (
        <div
          key={i}
          style={{
            position: 'absolute', left: m[0], top: m[1], width: m[2] - m[0], height: m[3] - m[1],
            border: `8px solid ${color}`, borderRadius: 24,
            opacity: interpolate(frame, [from + i * 6, from + i * 6 + 8], [0, 1], clamp),
          }}
        />
      ))}
    </>
  );
};

// 実機座標の該当箇所
export const MARKS = {
  talkBefore: [[700, 165, 1072, 290], [1046, 318, 1184, 444], [500, 2470, 1210, 2666]] as Mark[],
  homeBefore: [[690, 155, 815, 297], [40, 1395, 1180, 2470], [500, 2470, 1210, 2666]] as Mark[],
  settingsBefore: [[30, 1880, 1190, 2070]] as Mark[],
};

// プレビュー内で会話をスクロール
const PreviewWithScroll: React.FC<{scroll: number}> = ({scroll}) => {
  const TALL_H = 1721; // chat-mock-messages-tall-preview.png
  return (
    <>
      <Layer src="screenshots/chat/scroll-preview-mock.png" />
      <div style={{position: 'absolute', left: 52, top: 234, width: 1116, height: 1402, borderRadius: 52, overflow: 'hidden', background: '#1A1A1A'}}>
        <Img src={staticFile('screenshots/chat/chat-mock-messages-tall-preview.png')} style={{position: 'absolute', left: -52, top: 1625 - 234 - TALL_H + scroll, width: SW, height: TALL_H}} />
        <div style={{position: 'absolute', right: 14, width: 10, height: 260, borderRadius: 5, background: 'rgba(255,255,255,0.35)', top: interpolate(scroll, [0, 300], [1402 - 290, 30], clamp), opacity: scroll > 4 ? 1 : 0}} />
      </div>
    </>
  );
};

export const ScrollPreviewScreen: React.FC<{ring: string}> = ({ring}) => {
  const frame = useF();
  const {fps} = useVideoConfig();
  const open = spring({frame: frame - 32, fps, config: {damping: 200}});
  const scroll =
    interpolate(frame, [80, 130], [0, 300], {...clamp, easing: Easing.inOut(Easing.cubic)}) -
    interpolate(frame, [165, 210], [0, 300], {...clamp, easing: Easing.inOut(Easing.cubic)});
  return (
    <>
      <Layer src="screenshots/chat/talk-list-unread-kept.png" />
      <div style={{position: 'absolute', inset: 0, opacity: open}}>
        <PreviewWithScroll scroll={scroll} />
      </div>
      <Touch ring={ring} x={700} y={551} at={4} hold={26} />
      <Touch ring={ring} x={610} y={600} at={80} hold={50} toY={1300} moveFrom={80} moveTo={130} />
      <Touch ring={ring} x={610} y={1300} at={165} hold={45} toY={600} moveFrom={165} moveTo={210} />
    </>
  );
};

export const OpenWithoutReceiptScreen: React.FC<{ring: string}> = ({ring}) => {
  const frame = useF();
  const slide = interpolate(frame, [34, 56], [100, 0], {...clamp, easing: Easing.out(Easing.cubic)});
  const prevFade = interpolate(frame, [34, 50], [1, 0], clamp);
  const mark = interpolate(frame, [70, 80], [0, 1], clamp);
  return (
    <>
      <div style={{position: 'absolute', inset: 0, opacity: prevFade}}>
        <Layer src="screenshots/chat/scroll-preview-mock.png" />
        <div style={{position: 'absolute', left: 52, width: 814, top: 1690, height: 140, background: 'rgba(255,255,255,0.08)', opacity: interpolate(frame, [18, 22], [0, 1], clamp)}} />
      </div>
      <Touch ring={ring} x={319} y={1775} at={18} hold={8} />
      <div style={{position: 'absolute', inset: 0, transform: `translateX(${slide}%)`}}>
        <Layer src="screenshots/chat/room-read-disabled-mock.png" />
        <div style={{position: 'absolute', left: 44, top: 332, width: 1131, height: 207, borderRadius: 40, border: `8px solid ${ring}`, opacity: mark}} />
      </div>
    </>
  );
};

export const MarkAllReadScreen: React.FC<{ring: string; font: string}> = ({ring, font}) => {
  const frame = useF();
  const swap = interpolate(frame, [40, 52], [0, 1], clamp);
  const toast = interpolate(frame, [48, 58, 125, 140], [0, 1, 1, 0], clamp);
  return (
    <>
      <Layer src="screenshots/chat/room-read-disabled-mock.png" />
      <Layer src="screenshots/chat/room-read-enabled-mock.png" style={{opacity: swap}} />
      <Touch ring={ring} x={938} y={2390} at={30} hold={8} />
      <div style={{position: 'absolute', left: 150, top: 2350, height: 100, padding: '0 44px 0 24px', borderRadius: 50, background: 'rgb(58,58,58)', display: 'flex', alignItems: 'center', gap: 22, opacity: toast, fontFamily: font, fontSize: 40, fontWeight: 600, color: '#F2F2F2'}}>
        <div style={{width: 52, height: 52, borderRadius: 14, background: '#4CC764'}} />
        既読処理を実行しました
      </div>
    </>
  );
};

export const NotificationScreen: React.FC<{ring: string}> = ({ring}) => {
  const frame = useF();
  const open = interpolate(frame, [34, 56], [0, 1], {...clamp, easing: Easing.out(Easing.cubic)});
  return (
    <>
      <Layer src="screenshots/chat/notification-shade-mock.png" />
      <Touch ring={ring} x={600} y={575} at={22} hold={8} />
      <div style={{position: 'absolute', inset: 0, opacity: open}}>
        <Layer src="screenshots/chat/room-read-disabled-mock.png" />
      </div>
    </>
  );
};

export const UnreadKeptScreen: React.FC<{ring: string}> = ({ring}) => {
  const frame = useF();
  const on = interpolate(frame, [16, 26], [0, 1], clamp);
  return (
    <>
      <Layer src="screenshots/chat/talk-list-unread-kept.png" />
      <div style={{position: 'absolute', left: 18, right: 18, top: 445, height: 213, borderRadius: 30, border: `8px solid ${ring}`, opacity: on}} />
    </>
  );
};

// 縦長の設定ページをスクロール
export const SettingsScrollScreen: React.FC<{src: string; tallH: number; from?: number; to?: number}> = ({src, tallH, from = 30, to}) => {
  const frame = useF();
  const {durationInFrames} = useVideoConfig();
  const speed = useSpeed();
  const y = interpolate(frame, [from, to ?? durationInFrames * speed - 30], [0, -(tallH - SH)], {...clamp, easing: Easing.inOut(Easing.cubic)});
  return <Img src={staticFile(src)} style={{position: 'absolute', left: 0, top: y, width: SW, height: tallH}} />;
};
