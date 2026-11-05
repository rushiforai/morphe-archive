// ==UserScript==
// @name         TaobaoLingo for Web
// @namespace    https://github.com/GoodLight999/TaobaoLingo
// @version      0.1.0
// @description  TaobaoのWeb画面を日本語化し、価格を円換算で併記します。検索・商品・カート画面のUI文字列を置換し、「アプリで開く」誘導を消します。
// @author       GoodLight999
// @match        *://*.taobao.com/*
// @match        *://*.tmall.com/*
// @grant        GM_xmlhttpRequest
// @grant        GM_getValue
// @grant        GM_setValue
// @connect      open.er-api.com
// @run-at       document-idle
// @noframes
// @license      GPL-3.0
// @downloadURL  https://raw.githubusercontent.com/GoodLight999/TaobaoLingo/main/userscript/taobaolingo.user.js
// @updateURL    https://raw.githubusercontent.com/GoodLight999/TaobaoLingo/main/userscript/taobaolingo.user.js
// ==/UserScript==

(function () {
  'use strict';

  // ---------- UI dictionary: Simplified Chinese -> Japanese ----------
  // Exact-match replacements applied to visible text nodes.
  const DICT = {
    // Global / navigation
    '首页': 'ホーム', '我的淘宝': 'マイ淘宝', '购物车': 'カート', '收藏夹': 'お気に入り',
    '搜索': '検索', '登录': 'ログイン', '注册': '登録', '退出': 'ログアウト',
    '天猫': 'Tmall', '淘宝': 'Taobao', '店铺': 'ショップ', '客服': 'サポート',
    '消息': 'メッセージ', '分类': 'カテゴリ', '全部': 'すべて', '返回': '戻る',
    '确定': 'OK', '取消': 'キャンセル', '关闭': '閉じる', '更多': 'もっと見る',
    '中国大陆': '中国大陸', '全球': 'グローバル', '海外': '海外',
    // Search / listing
    '综合排序': '総合順', '销量': '売上順', '价格': '価格順', '新品': '新着順',
    '价格从低到高': '価格の安い順', '价格从高到低': '価格の高い順',
    '包邮': '送料無料', '二手': '中古', '正品保障': '正規品保証',
    '退货运费险': '返品送料保険', '货到付款': '代金引換', '信用卡': 'クレジットカード',
    '找同款': '同じ商品を探す', '找相似': '似た商品を探す', '收藏': 'お気に入り',
    '月销': '月間販売', '已售': '販売済み', '件': '件', '人付款': '人が購入',
    '人收货': '人が受取', '发货': '発送', '承诺': 'お約束', '小时内发货': '時間以内に発送',
    '48小时内发货': '48時間以内に発送', '24小时内发货': '24時間以内に発送',
    // Item page
    '加入购物车': 'カートに入れる', '立即购买': '今すぐ購入', '领券购买': 'クーポンで購入',
    '立即抢购': '今すぐ購入', '马上抢': '今すぐ購入', '购买': '購入',
    '数量': '数量', '库存': '在庫', '运费': '送料', '规格': '仕様',
    '颜色分类': 'カラー', '尺码': 'サイズ', '尺寸': 'サイズ',
    '图文详情': '商品詳細', '产品参数': '商品パラメータ', '规格参数': '仕様パラメータ',
    '累计评价': 'レビュー', '宝贝评价': '商品レビュー', '查看全部评价': 'レビューをすべて見る',
    '进店逛逛': 'ショップを見る', '全部宝贝': '全商品', '宝贝': '商品',
    '掌柜推荐': '店長のおすすめ', '看了又看': 'こちらもチェック', '猜你喜欢': 'おすすめ',
    '优惠': 'お得', '优惠券': 'クーポン', '领券': 'クーポンを受け取る',
    '满减': 'まとめ割引', '包邮价': '送料込み価格', '到手价': '実質価格',
    '原价': '通常価格', '现价': '現在の価格', '活动价': 'セール価格',
    '担保交易': 'エスクロー取引', '七天退货': '7日間返品可', '假一赔四': '偽物なら4倍補償',
    // Cart / checkout
    '结算': 'レジに進む', '删除': '削除', '全选': 'すべて選択',
    '合计': '合計', '已选商品': '選択中の商品', '移入收藏夹': 'お気に入りへ移動',
    '提交订单': '注文を確定', '收货地址': 'お届け先', '实付款': 'お支払い額',
    '订单': '注文', '我的订单': '注文履歴', '待付款': '支払い待ち', '待发货': '発送待ち',
    '待收货': '受取待ち', '待评价': 'レビュー待ち', '确认收货': '受取を確認',
    '查看物流': '配送状況', '申请退款': '返金を申請', '再次购买': 'もう一度購入',
    // Misc UI
    '知道了': 'OK', '立即打开': '今すぐ開く', '去逛逛': '見てみる',
    '加载中': '読み込み中', '没有更多了': 'これ以上ありません',
    '网络竟然崩溃了': 'ネットワークエラー', '服务竟然出错了': 'サーバーエラー',
    '请登录': 'ログインしてください', '免费注册': '無料登録',
  };

  // Regex rules for templated strings, applied after exact matches.
  const REGEX_RULES = [
    [/^已售\s*([\d.]+[万千]?)\s*件$/, '販売済み $1件'],
    [/^月销\s*([\d.]+[万千]?)\s*件?$/, '月間 $1件'],
    [/^([\d.]+[万千]?)\s*人付款$/, '$1人が購入'],
    [/^库存\s*([\d]+)\s*件$/, '在庫 $1件'],
    [/^共\s*([\d]+)\s*件$/, '合計 $1件'],
  ];

  // "Open in app" nag phrases: hide the smallest enclosing block that
  // contains one of these and little else.
  const NAG_PHRASES = ['打开App', '在App中打开', '打开淘宝', '去App', '下载淘宝', '打开手机淘宝'];
  const PROCESSED = 'data-tbl-done';

  // ---------- Exchange rate (CNY -> JPY), cached for 24h ----------
  const FALLBACK_RATE = 21.0;
  let rate = FALLBACK_RATE;

  function loadRate() {
    try {
      const cached = JSON.parse(GM_getValue('cny_jpy_rate', 'null') || 'null');
      if (cached && Date.now() - cached.ts < 24 * 3600 * 1000 && cached.rate > 0) {
        rate = cached.rate;
        return;
      }
    } catch (e) { /* ignore */ }
    GM_xmlhttpRequest({
      method: 'GET',
      url: 'https://open.er-api.com/v6/latest/CNY',
      onload(res) {
        try {
          const j = JSON.parse(res.responseText);
          if (j && j.rates && j.rates.JPY > 0) {
            rate = j.rates.JPY;
            GM_setValue('cny_jpy_rate', JSON.stringify({ rate, ts: Date.now() }));
            processAll(document.body);
          }
        } catch (e) { /* keep fallback */ }
      },
    });
  }

  function jpyText(cny) {
    const jpy = Math.round(cny * rate);
    return '（約' + jpy.toLocaleString('ja-JP') + '円）';
  }

  // ---------- Text processing ----------
  const PRICE_RE = /[¥￥]\s?(\d{1,3}(?:,\d{3})*(?:\.\d{1,2})?|\d+(?:\.\d{1,2})?)/g;

  function translateString(s) {
    const t = s.trim();
    if (!t) return null;
    if (Object.prototype.hasOwnProperty.call(DICT, t)) {
      return s.replace(t, DICT[t]);
    }
    for (const [re, rep] of REGEX_RULES) {
      if (re.test(t)) return s.replace(t, t.replace(re, rep));
    }
    return null;
  }

  function processTextNode(node) {
    const text = node.nodeValue;
    if (!text || !text.trim()) return;
    let out = translateString(text);
    if (out !== null) {
      node.nodeValue = out;
      return;
    }
    // Price annotation: append JPY equivalent after CNY prices.
    if (text.includes('¥') || text.includes('￥')) {
      if (text.includes('約') && text.includes('円）')) return; // already annotated
      const annotated = text.replace(PRICE_RE, (m, num) => {
        const v = parseFloat(String(num).replace(/,/g, ''));
        if (!isFinite(v) || v <= 0) return m;
        return m + jpyText(v);
      });
      if (annotated !== text) node.nodeValue = annotated;
    }
  }

  function hideNags(root) {
    const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT);
    const hits = [];
    let n;
    while ((n = walker.nextNode())) {
      const t = (n.nodeValue || '').trim();
      if (t && NAG_PHRASES.some((p) => t === p || t.startsWith(p))) hits.push(n.parentElement);
    }
    for (const el of hits) {
      let target = el;
      // Climb to a small banner-like container, but never hide big regions.
      for (let i = 0; i < 3 && target.parentElement; i++) {
        const p = target.parentElement;
        if (p.innerText && p.innerText.length > 60) break;
        if (p === document.body) break;
        target = p;
      }
      if (target && !target.hasAttribute(PROCESSED)) {
        target.setAttribute(PROCESSED, 'nag');
        target.style.setProperty('display', 'none', 'important');
      }
    }
  }

  function processAll(root) {
    if (!root) return;
    const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT, {
      acceptNode(node) {
        const p = node.parentElement;
        if (!p) return NodeFilter.FILTER_REJECT;
        const tag = p.tagName;
        if (tag === 'SCRIPT' || tag === 'STYLE' || tag === 'TEXTAREA' || tag === 'INPUT') {
          return NodeFilter.FILTER_REJECT;
        }
        return NodeFilter.FILTER_ACCEPT;
      },
    });
    const nodes = [];
    let n;
    while ((n = walker.nextNode())) nodes.push(n);
    for (const node of nodes) processTextNode(node);
    hideNags(root);
  }

  // ---------- Boot + SPA observation ----------
  loadRate();
  processAll(document.body);

  let scheduled = false;
  const observer = new MutationObserver(() => {
    if (scheduled) return;
    scheduled = true;
    requestAnimationFrame(() => {
      scheduled = false;
      processAll(document.body);
    });
  });
  observer.observe(document.body, { childList: true, subtree: true });
})();
