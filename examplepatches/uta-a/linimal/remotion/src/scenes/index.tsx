import React from 'react';
import {AbsoluteFill, Img, interpolate, spring, staticFile, useCurrentFrame, useVideoConfig, Easing} from 'remotion';
import {Badge, Caption, Phone, SceneBg, Screen, ScreenVideo, Wipe, useRise} from '../components';
import {C} from '../theme';

const PHONE_H = 900;
const phonePos: React.CSSProperties = {position: 'absolute', left: 230, top: (1080 - PHONE_H) / 2 - 16};

// 1. オープニング
export const Intro: React.FC = () => {
  const frame = useCurrentFrame();
  const {fps} = useVideoConfig();
  const logo = spring({frame, fps, config: {damping: 200}});
  const sub = useRise(20);
  const note = useRise(34);
  const fan = (i: number) => spring({frame: frame - 8 - i * 6, fps, config: {damping: 200}});
  const shots = ['screenshots/line-talk-list.png', 'screenshots/linimal-settings-top.png', 'screenshots/chat/room-read-disabled-mock.png'];
  return (
    <SceneBg>
      <div style={{position: 'absolute', left: 140, top: 330, width: 900}}>
        <Img src={staticFile('brand/wordmark-light.svg')} style={{width: 620, opacity: logo, transform: `scale(${0.9 + logo * 0.1})`, transformOrigin: 'left center'}} />
        <div style={{...sub, fontSize: 56, fontWeight: 800, marginTop: 40, lineHeight: 1.4}}>
          広告や使わない機能を消して、
          <br />
          既読も自分で選べる LINE に。
        </div>
        <div style={{...note, fontSize: 28, color: C.muted, marginTop: 30}}>公式 LINE Android 向けの Morphe パッチバンドル</div>
      </div>
      {shots.map((s, i) => {
        const p = fan(i);
        const rot = [-8, 0, 8][i];
        const x = [1080, 1300, 1520][i];
        return (
          <Phone key={s} height={640} style={{position: 'absolute', left: x, top: 210 + (i === 1 ? -30 : 20), opacity: p, transform: `translateY(${(1 - p) * 80}px) rotate(${rot * p}deg)`, zIndex: i === 1 ? 2 : 1}}>
            <Screen src={s} />
          </Phone>
        );
      })}
    </SceneBg>
  );
};

// 2. トーク一覧 Before / After
export const TalkListBA: React.FC = () => {
  const frame = useCurrentFrame();
  const after = frame > 75;
  return (
    <SceneBg>
      <div style={phonePos}>
        <Phone height={PHONE_H}>
          <Wipe before="screenshots/line-talk-list-before.png" after="screenshots/line-talk-list.png" start={60} duration={40} />
        </Phone>
        <Badge label={after ? 'Linimal' : '公式 LINE'} color={after ? C.accent : '#BBBBBB'} style={{top: -20, left: -20}} />
      </div>
      <Caption
        kicker="表示を消す"
        title={<>トーク一覧を、<br />すっきりと</>}
        items={['上部の AI Friends・カレンダー・オープンチャット', '検索欄の横にある Agent i', '使わない下部タブ（ショッピング・ニュース・アプリなど）', 'Smart Channel の広告']}
      />
    </SceneBg>
  );
};

// 3. ホーム Before / After
export const HomeBA: React.FC = () => {
  const frame = useCurrentFrame();
  const after = frame > 75;
  return (
    <SceneBg>
      <div style={phonePos}>
        <Phone height={PHONE_H}>
          <Wipe before="screenshots/line-home-before.png" after="screenshots/line-home.png" start={60} duration={40} />
        </Phone>
        <Badge label={after ? 'Linimal' : '公式 LINE'} color={after ? C.accent : '#BBBBBB'} style={{top: -20, left: -20}} />
      </div>
      <Caption
        kicker="広告・Agent i・LINE AI"
        title={<>ホームも、<br />必要なものだけ</>}
        items={['ホームの広告とフィード広告', 'ホーム上部の Agent i', '投稿カード・話題・おすすめ・特集枠', 'メッセージ長押しの LINE AI など 8 か所の入口']}
      />
    </SceneBg>
  );
};

// 4. 章タイトル
export const Chapter: React.FC<{kicker: string; title: string; sub?: string}> = ({kicker, title, sub}) => {
  const k = useRise(0);
  const t = useRise(6);
  const s = useRise(14);
  const frame = useCurrentFrame();
  const line = interpolate(frame, [4, 30], [0, 360], {extrapolateRight: 'clamp', easing: Easing.out(Easing.cubic)});
  return (
    <SceneBg>
      <AbsoluteFill style={{justifyContent: 'center', alignItems: 'center', textAlign: 'center'}}>
        <div style={{...k, color: C.accent, fontSize: 34, fontWeight: 700, letterSpacing: 4}}>{kicker}</div>
        <div style={{width: line, height: 4, background: C.accent, margin: '28px 0', borderRadius: 2}} />
        <div style={{...t, fontSize: 96, fontWeight: 800}}>{title}</div>
        {sub ? <div style={{...s, fontSize: 36, color: C.muted, marginTop: 30}}>{sub}</div> : null}
      </AbsoluteFill>
    </SceneBg>
  );
};

// 実機動画 + 説明の汎用シーン
export const VideoScene: React.FC<{
  src: string;
  startFrom?: number;
  playbackRate?: number;
  kicker: string;
  title: React.ReactNode;
  body?: React.ReactNode;
  items?: string[];
}> = ({src, startFrom, playbackRate, kicker, title, body, items}) => (
  <SceneBg>
    <div style={phonePos}>
      <Phone height={PHONE_H}>
        <ScreenVideo src={src} startFrom={startFrom} playbackRate={playbackRate} />
      </Phone>
    </div>
    <Caption kicker={kicker} title={title} body={body} items={items} />
  </SceneBg>
);

// 未読が残るトーク一覧（Linimal 行を強調）
export const UnreadKept: React.FC = () => {
  const frame = useCurrentFrame();
  const {fps} = useVideoConfig();
  const hl = spring({frame: frame - 20, fps, config: {damping: 200}});
  // 行は y=441〜662（1220×2712 基準）
  const scale = PHONE_H / 2712;
  return (
    <SceneBg>
      <div style={phonePos}>
        <Phone height={PHONE_H}>
          <Screen src="screenshots/chat/talk-list-unread-kept.png" />
          <div
            style={{
              position: 'absolute',
              left: 6,
              right: 6,
              top: 441 * scale,
              height: 221 * scale,
              borderRadius: 18,
              border: `4px solid ${C.accent}`,
              opacity: hl,
              boxShadow: `0 0 30px ${C.accent}66`,
            }}
          />
        </Phone>
      </div>
      <Caption
        kicker="既読をつけずに読む"
        title={<>読んだあとも、<br />未読のまま</>}
        body={<>相手に既読はつかず、トーク一覧の未読バッジも残ります。<br />メッセージを送信すると、その時点で既読になります。</>}
      />
    </SceneBg>
  );
};

// 設定画面
export const Settings: React.FC = () => {
  const frame = useCurrentFrame();
  const {durationInFrames} = useVideoConfig();
  // 縦長に結合した「表示を消す」ページを下へスクロール
  const y = interpolate(frame, [30, durationInFrames - 30], [0, -(4642 - 2712) / 4642 * 100], {
    extrapolateLeft: 'clamp',
    extrapolateRight: 'clamp',
    easing: Easing.inOut(Easing.cubic),
  });
  return (
    <SceneBg>
      <div style={phonePos}>
        <Phone height={PHONE_H}>
          <Img
            src={staticFile('screenshots/linimal-page-hide-full.png')}
            style={{position: 'absolute', left: 0, top: 0, width: '100%', transform: `translateY(${y}%)`}}
          />
        </Phone>
      </div>
      <Caption
        kicker="設定"
        title={<>37 の項目を、<br />ひとつずつ ON / OFF</>}
        body={<>LINE の設定の一番下に「Linimal」が追加されます。<br />広告・Agent i・LINE AI・表示を消す・既読・一般の 5 ページ。</>}
      />
    </SceneBg>
  );
};

// 設計方針
export const Principles: React.FC = () => {
  const cards = [
    {t: 'OFF なら公式 LINE と同じ', d: '設定を切れば、公式 LINE の動作に戻ります。'},
    {t: '迷ったら公式の動作', d: '対象を特定できない機能は自動で無効になります。'},
    {t: '表示だけを消す', d: '広告の配信・課金・LINE の通信は変更しません。'},
    {t: '既読は送信経路で止める', d: '見た目ではなく、実際の既読の送信を抑えます。'},
  ];
  const head = useRise(0);
  return (
    <SceneBg>
      <div style={{position: 'absolute', left: 140, top: 140, ...head}}>
        <div style={{color: C.accent, fontSize: 30, fontWeight: 700, letterSpacing: 2}}>設計の方針</div>
        <div style={{fontSize: 64, fontWeight: 800, marginTop: 14}}>安全側に倒す作り</div>
      </div>
      <div style={{position: 'absolute', left: 140, right: 140, top: 400, display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 36}}>
        {cards.map((c, i) => (
          <Card key={c.t} title={c.t} desc={c.d} delay={12 + i * 8} />
        ))}
      </div>
    </SceneBg>
  );
};
const Card: React.FC<{title: string; desc: string; delay: number}> = ({title, desc, delay}) => {
  const r = useRise(delay);
  return (
    <div style={{...r, background: C.surface, borderRadius: 28, padding: '40px 48px', borderLeft: `8px solid ${C.accent}`}}>
      <div style={{fontSize: 42, fontWeight: 800}}>{title}</div>
      <div style={{fontSize: 30, color: C.muted, marginTop: 14}}>{desc}</div>
    </div>
  );
};

// エンディング
export const Outro: React.FC = () => {
  const a = useRise(0);
  const b = useRise(12);
  const c = useRise(24);
  const d = useRise(36);
  return (
    <SceneBg>
      <AbsoluteFill style={{justifyContent: 'center', alignItems: 'center', textAlign: 'center'}}>
        <Img src={staticFile('brand/wordmark-light.svg')} style={{width: 560, ...a}} />
        <div style={{...b, fontSize: 40, fontWeight: 700, marginTop: 50}}>Morphe Manager にパッチソースとして追加</div>
        <div style={{...c, fontSize: 52, fontWeight: 800, marginTop: 24, color: C.accent}}>github.com/uta-a/linimal</div>
        <div style={{...d, fontSize: 26, color: C.muted, marginTop: 70, lineHeight: 1.8}}>
          対象：LINE 26.16.0（arm64-v8a） ／ ライセンス：GPL-3.0
          <br />
          Linimal は独立したプロジェクトであり、LINE および Morphe の公式プロジェクトではありません。
        </div>
      </AbsoluteFill>
    </SceneBg>
  );
};
