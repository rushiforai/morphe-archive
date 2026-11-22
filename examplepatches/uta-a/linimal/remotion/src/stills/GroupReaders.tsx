/* Hallmark · pre-emit critique: P4 H5 E4 S5 R5 V4
 * macrostructure: Map / Diagram (static poster) · theme: existing Linimal brand, dark
 * audience: 初めて知る人 · use: グループで誰が読んだかわかることを伝える
 * 実機 UI の切り抜きを使用。背景・名前・会話・アイコンはモックに差し替え済み。
 */
import React from 'react';
import {AbsoluteFill, Img, staticFile} from 'remotion';
import './tokens.css';

const C = {
  paper: 'var(--color-paper)', ink: 'var(--color-ink)',
  muted: 'var(--color-muted)', rule: 'var(--color-rule)', accent: 'var(--color-accent)',
};

export const GroupReaders: React.FC = () => <AbsoluteFill style={{
  background: C.paper, color: C.ink, fontFamily: 'var(--font-body)',
  fontWeight: 300, fontStyle: 'normal', fontVariantNumeric: 'tabular-nums',
}}>
  <div style={{position: 'absolute', left: 80, top: 56, display: 'flex', alignItems: 'center', gap: 'var(--space-md)'}}>
    <Img src={staticFile('brand/icon.svg')} style={{width: 44, height: 44}}/>
    <span style={{fontFamily: 'var(--font-outlier)', fontSize: 30, letterSpacing: -1}}>Linimal</span>
  </div>
  <div style={{position: 'absolute', right: 80, top: 67, fontSize: 20, color: C.muted}}>LINE のグループトークを、もっとわかりやすく。</div>

  <h1 style={{position: 'absolute', left: 80, top: 180, margin: 0,
    fontFamily: 'var(--font-display)', fontSize: 'var(--text-display)',
    fontWeight: 700, lineHeight: 1.35, letterSpacing: '-0.045em'}}>
    グループで、<br/>誰が読んだかわかる。
  </h1>
  <p style={{position: 'absolute', left: 84, top: 407, margin: 0, fontSize: 25,
    color: C.muted, lineHeight: 1.65}}>
    既読の横にメンバーのアイコンを表示。<br/>
    タップや長押しから、既読・未読の一覧へ。
  </p>

  {/* 原本は参照せず、白リスト方式で加工した公開用 PNG だけを読み込む。 */}
  <figure style={{position: 'absolute', left: 80, top: 520, width: 1040, margin: 0}}>
    <Img alt="実機トーク画面の加工画像。相手のメッセージに既読4、自分のメッセージに既読5と匿名アイコンを表示。"
      src={staticFile('screenshots/readers/chat-anonymized.png')}
      style={{display: 'block', width: '100%', borderRadius: 12}}/>
  </figure>

  <svg aria-hidden="true" width="180" height="320" viewBox="0 0 180 320"
    style={{position: 'absolute', left: 1120, top: 520}}>
    <path d="M0 298 H72 V24 H170 M159 13 L170 24 L159 35" fill="none"
      stroke={C.accent} strokeWidth="2" strokeLinejoin="round" strokeLinecap="round"/>
  </svg>
  <div style={{position: 'absolute', left: 828, top: 950, fontSize: 20, color: C.accent}}>タップで既読者一覧へ</div>

  <figure style={{position: 'absolute', left: 1310, top: 160, width: 500, margin: 0}}>
    <Img alt="実機の既読者一覧を加工した画像。既読5、未読0。架空のメンバーAからEを表示。"
      src={staticFile('screenshots/readers/dialog-anonymized.png')}
      style={{display: 'block', width: '100%', border: `1px solid ${C.rule}`, borderRadius: 36}}/>
  </figure>

  <div style={{position: 'absolute', left: 80, right: 80, bottom: 40, display: 'flex',
    justifyContent: 'space-between', alignItems: 'center', borderTop: `1px solid ${C.rule}`, paddingTop: 20}}>
    <span style={{fontSize: 17, color: C.muted}}>実機画面を加工。背景・会話・名前・アイコンはモックです。</span>
    <span style={{fontSize: 19, color: C.ink}}>設定場所：LINE 設定 → Linimal → 既読者</span>
  </div>
</AbsoluteFill>;
