// テスト配信の中身を映さないよう、実機の UI を再現したモック画像を動かして操作を見せる
import React from 'react';
import {Img, interpolate, spring, staticFile, useCurrentFrame, useVideoConfig, Easing} from 'remotion';
import {Caption, Phone, SceneBg} from '../components';
import {C, FONT} from '../theme';

const PHONE_H = 900;
const SW = 1220;
const SH = 2712;
const phonePos: React.CSSProperties = {position: 'absolute', left: 230, top: (1080 - PHONE_H) / 2 - 16};
const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;

// 実機の画面座標（1220×2712）でレイアウトし、スマホ枠の大きさへ縮小する
const Native: React.FC<{children: React.ReactNode}> = ({children}) => (
  <div style={{position: 'absolute', left: 0, top: 0, width: SW, height: SH, transform: `scale(${PHONE_H / SH})`, transformOrigin: 'top left', overflow: 'hidden'}}>
    {children}
  </div>
);

const Layer: React.FC<{src: string; style?: React.CSSProperties}> = ({src, style}) => (
  <Img src={staticFile(src)} style={{position: 'absolute', left: 0, top: 0, width: SW, height: SH, ...style}} />
);

// 指の位置。at から押し始め、hold フレーム押し続ける（長押しは輪が広がる）
const Touch: React.FC<{x: number; y: number; at: number; hold?: number; toX?: number; toY?: number; moveFrom?: number; moveTo?: number}> = ({
  x,
  y,
  at,
  hold = 8,
  toX,
  toY,
  moveFrom = 0,
  moveTo = 0,
}) => {
  const frame = useCurrentFrame();
  const f = frame - at;
  if (f < -6 || f > hold + 18) return null;
  const appear = interpolate(f, [-6, 0], [0, 1], clamp);
  const leave = interpolate(f, [hold, hold + 12], [1, 0], clamp);
  const ring = interpolate(f, [0, hold + 10], [0, 1], clamp);
  const mx = toX !== undefined ? interpolate(frame, [moveFrom, moveTo], [x, toX], {...clamp, easing: Easing.inOut(Easing.quad)}) : x;
  const my = toY !== undefined ? interpolate(frame, [moveFrom, moveTo], [y, toY], {...clamp, easing: Easing.inOut(Easing.quad)}) : y;
  return (
    <>
      <div style={{position: 'absolute', left: mx - 70, top: my - 70, width: 140, height: 140, borderRadius: 70, background: 'rgba(255,255,255,0.28)', border: '5px solid rgba(255,255,255,0.75)', opacity: appear * leave, transform: `scale(${0.8 + appear * 0.2})`}} />
      <div style={{position: 'absolute', left: mx - 70, top: my - 70, width: 140, height: 140, borderRadius: 70, border: `6px solid ${C.accent}`, opacity: (1 - ring) * leave, transform: `scale(${1 + ring * 1.4})`}} />
    </>
  );
};

const MockScene: React.FC<{children: React.ReactNode; caption: React.ComponentProps<typeof Caption>}> = ({children, caption}) => (
  <SceneBg>
    <div style={phonePos}>
      <Phone height={PHONE_H}>
        <Native>{children}</Native>
      </Phone>
    </div>
    <Caption {...caption} />
  </SceneBg>
);

// プレビューのカード内（会話）だけをスクロールさせる
const PreviewWithScroll: React.FC<{scroll: number}> = ({scroll}) => {
  // 縦長の会話画像（1220×2155）は、トーク画面の座標で描いたもの。プレビューでは右へ 52px ずれる
  const TALL_H = 1721; // chat-mock-messages-tall-preview.png（プレビューの座標で描いたもの）
  const bottom = 1625; // 最新メッセージの下端（余白込み）
  return (
    <>
      <Layer src="screenshots/chat/scroll-preview-mock.png" />
      <div style={{position: 'absolute', left: 52, top: 234, width: 1116, height: 1402, borderRadius: 52, overflow: 'hidden', background: '#1A1A1A'}}>
        <Img
          src={staticFile('screenshots/chat/chat-mock-messages-tall-preview.png')}
          style={{position: 'absolute', left: -52, top: bottom - 234 - TALL_H + scroll, width: SW, height: TALL_H}}
        />
        {/* スクロールバー */}
        <div style={{position: 'absolute', right: 14, width: 10, height: 260, borderRadius: 5, background: 'rgba(255,255,255,0.35)', top: interpolate(scroll, [0, 300], [1402 - 290, 30], clamp), opacity: scroll > 4 ? 1 : 0}} />
      </div>
    </>
  );
};

// 5. 長押しでスクロールプレビューを開き、中をスクロールする
export const ScrollPreviewMock: React.FC = () => {
  const frame = useCurrentFrame();
  const {fps} = useVideoConfig();
  const open = spring({frame: frame - 32, fps, config: {damping: 200}});
  const scroll =
    interpolate(frame, [80, 130], [0, 300], {...clamp, easing: Easing.inOut(Easing.cubic)}) -
    interpolate(frame, [165, 210], [0, 300], {...clamp, easing: Easing.inOut(Easing.cubic)});
  return (
    <MockScene
      caption={{
        kicker: 'スクロールプレビュー',
        title: <>長押しで、<br />中身をのぞく</>,
        body: <>トークを長押しするとプレビューが開きます。<br />スクロールして過去のメッセージも確認できます。</>,
      }}
    >
      <Layer src="screenshots/chat/talk-list-unread-kept.png" />
      <div style={{position: 'absolute', inset: 0, opacity: open, transform: `scale(${0.94 + open * 0.06})`, transformOrigin: '50% 30%'}}>
        <PreviewWithScroll scroll={scroll} />
      </div>
      <Touch x={700} y={551} at={4} hold={26} />
      <Touch x={610} y={600} at={80} hold={50} toY={1300} moveFrom={80} moveTo={130} />
      <Touch x={610} y={1300} at={165} hold={45} toY={600} moveFrom={165} moveTo={210} />
    </MockScene>
  );
};

// 6. メニューの「既読をつけずに読む」から開く
export const OpenWithoutReceiptMock: React.FC = () => {
  const frame = useCurrentFrame();
  const slide = interpolate(frame, [34, 56], [100, 0], {...clamp, easing: Easing.out(Easing.cubic)});
  const prevFade = interpolate(frame, [34, 50], [1, 0], clamp);
  const pulse = interpolate(frame, [70, 85, 100, 115], [0, 1, 1, 0], clamp);
  return (
    <MockScene
      caption={{
        kicker: '既読をつけずに読む',
        title: <>メニューから、<br />既読をつけずに開く</>,
        body: <>開いている間は、上部に「既読は無効です」と表示されます。</>,
      }}
    >
      <div style={{position: 'absolute', inset: 0, opacity: prevFade}}>
        <Layer src="screenshots/chat/scroll-preview-mock.png" />
        {/* 押した行のハイライト */}
        <div style={{position: 'absolute', left: 52, width: 814, top: 1690, height: 140, background: 'rgba(255,255,255,0.08)', opacity: interpolate(frame, [18, 22, 34], [0, 1, 1], clamp)}} />
      </div>
      <Touch x={319} y={1775} at={18} hold={8} />
      <div style={{position: 'absolute', inset: 0, transform: `translateX(${slide}%)`, boxShadow: '-30px 0 60px rgba(0,0,0,0.5)'}}>
        <Layer src="screenshots/chat/room-read-disabled-mock.png" />
        <div style={{position: 'absolute', left: 52, top: 340, width: 1115, height: 191, borderRadius: 34, border: `6px solid ${C.accent}`, opacity: pulse, boxShadow: `0 0 40px ${C.accent}`}} />
      </div>
    </MockScene>
  );
};

// 8. 「すべて既読にする」を押す
export const MarkAllReadMock: React.FC = () => {
  const frame = useCurrentFrame();
  const swap = interpolate(frame, [40, 52], [0, 1], clamp);
  const toast = interpolate(frame, [48, 58, 125, 140], [0, 1, 1, 0], clamp);
  return (
    <MockScene
      caption={{
        kicker: 'すべて既読にする',
        title: <>読み終えたら、<br />ボタンひとつで既読に</>,
        body: <>入力欄の上のボタンで、いつでも既読にできます。<br />押すと案内とボタンが消え、通常の LINE に戻ります。</>,
      }}
    >
      <Layer src="screenshots/chat/room-read-disabled-mock.png" />
      <Layer src="screenshots/chat/room-read-enabled-mock.png" style={{opacity: swap}} />
      <Touch x={938} y={2390} at={30} hold={8} />
      <div
        style={{
          position: 'absolute',
          left: 150,
          top: 2350,
          height: 100,
          padding: '0 44px 0 24px',
          borderRadius: 50,
          background: 'rgba(58,58,58,0.97)',
          display: 'flex',
          alignItems: 'center',
          gap: 22,
          opacity: toast,
          transform: `translateY(${(1 - toast) * 20}px)`,
          fontFamily: FONT,
          fontSize: 40,
          fontWeight: 600,
          color: '#F2F2F2',
          boxShadow: '0 10px 30px rgba(0,0,0,0.4)',
        }}
      >
        <div style={{width: 52, height: 52, borderRadius: 14, background: '#4CC764'}} />
        既読処理を実行しました
      </div>
    </MockScene>
  );
};

// 9. 通知から開く
export const NotificationMock: React.FC = () => {
  const frame = useCurrentFrame();
  const {fps} = useVideoConfig();
  const shadeIn = spring({frame, fps, config: {damping: 200}});
  const open = interpolate(frame, [34, 58], [0, 1], {...clamp, easing: Easing.out(Easing.cubic)});
  return (
    <MockScene
      caption={{
        kicker: '通知から既読をつけずに開く',
        title: <>通知から開いても、<br />既読はつかない</>,
        body: <>メッセージ通知から開いたトークにも適用できます。</>,
      }}
    >
      <Layer src="screenshots/chat/notification-shade-mock.png" style={{opacity: shadeIn, transform: `translateY(${(1 - shadeIn) * -60}px)`}} />
      <Touch x={600} y={575} at={22} hold={8} />
      <div style={{position: 'absolute', inset: 0, opacity: open, transform: `scale(${0.85 + open * 0.15})`, transformOrigin: '50% 21%'}}>
        <Layer src="screenshots/chat/room-read-disabled-mock.png" />
      </div>
    </MockScene>
  );
};
