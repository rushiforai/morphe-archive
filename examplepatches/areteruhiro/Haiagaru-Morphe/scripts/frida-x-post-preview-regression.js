Java.perform(function () {
  const app = Java.use('android.app.ActivityThread').currentApplication();
  if (String(app.getPackageName()) !== 'jp.co.airfront.android.a2chMate.haiagaru.reporter242')
    throw new Error('Use the isolated reporter242 package');
  const Preview = Java.use('app.morphe.extension.chmate.XPostPreview');
  const Prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
  const key = 'xPostWarningThresholdMode', had = Prefs.contains(key), before = Prefs.getInt(key, 1);
  const fullKey='xPostPreviewFullText',fullHad=Prefs.contains(fullKey),fullBefore=Prefs.getBoolean(fullKey,false);
  const checks = [];
  function check(ok, label) { if (!ok) throw new Error('FAIL ' + label); checks.push(label); console.log('PASS ' + label); }
  function post(text, extra) {
    const value = Object.assign({id_str:'123', text:text, user:{name:'test',screen_name:'test'}, created_at:'now'}, extra||{});
    return Preview.parse.overload('java.lang.String','java.lang.String').call(Preview, JSON.stringify(value), '123');
  }
  function possibly(data) { return data.possiblyTruncated(Prefs.getInt(key, 1) === 0); }
  function notice(data, full, detailed) { return String(data.notice(full, detailed, data.body(full, detailed))); }
  try {
    Prefs.edit().putInt(key, 1).apply();
    const reply='@a '+'漢'.repeat(139);
    check(!possibly(post(reply,{in_reply_to_status_id_str:'1'})), '420-byte mode excludes the reply handle');
    Prefs.edit().putInt(key, 0).apply();
    check(!possibly(post(reply,{in_reply_to_status_id_str:'1'})), 'detailed mode excludes the reply handle');
    check(!possibly(post('漢'.repeat(140))), 'Detailed exact 280-point post remains displayable');
    check(possibly(post('漢'.repeat(140)+'a')), 'Detailed warning starts above 280 points');
    const weighted = post('@reply ' + 'a'.repeat(281), {in_reply_to_status_id_str:'1'});
    check(String(weighted.body(false,true)) === '@reply ' + 'a'.repeat(280), 'collapsed preview uses 280 points and excludes reply handle');
    check(String(weighted.body(false,false)).endsWith('a'.repeat(281)), 'switching to byte mode uses cached body with the new limit');
    check(notice(weighted,false,true) === '［以下省略］', 'locally shortened display uses the short caption');
    check(notice(weighted,true,true) === '［省略の可能性］', 'full display preserves possible server truncation warning');
    const short = '漢'.repeat(140);
    const limited = post(short, {full_text:short, truncated:true});
    check(notice(limited,true,true) === '［省略の可能性］', 'repeated full_text with server truncation is not full content');
    const note = post(short, {truncated:true,note_tweet:{text:short+'続き'}});
    check(notice(note,true,true) === '' && String(note.body(true,true)).endsWith('続き'), 'a complete Note recovers the full display');
    const quoted = post('引用しました', {quoted_tweet:{id_str:'456'}});
    const quote=quoted.getClass().getDeclaredField('quote');quote.setAccessible(true);
    check(quote.getBoolean(quoted) && !quote.getBoolean(post('https://x.com/example/status/456')), 'only quote metadata sets the quote label');

    const links=Java.use('android.text.SpannableStringBuilder').$new();
    const method=Preview.class.getDeclaredMethod('appendBody',Java.array('java.lang.Class',[links.getClass(),Java.use('java.lang.String').class]));
    method.setAccessible(true);method.invoke(null,Java.array('java.lang.Object',[links,'Card URL https://example.com/path).']));
    const linkType=Java.use('app.morphe.extension.chmate.XPostPreviewTouch$PostLink');
    const spans=links.getSpans(0,links.length(),linkType.class);
    const urlSpan=Java.use('android.text.style.URLSpan');
    check(spans.length===1 && String(Java.cast(spans[0],urlSpan).getURL())==='https://example.com/path', 'X card URL is clickable and trailing punctuation is excluded');
    const cacheField=Preview.class.getDeclaredField('CACHE');cacheField.setAccessible(true);const cache=cacheField.get(null);
    const data=post('External link https://example.com/rich-card');
    const entryType=Java.use('app.morphe.extension.chmate.XPostPreview$Entry');const entry=entryType.$new();
    const dataField=entry.getClass().getDeclaredField('data');dataField.setAccessible(true);dataField.set(entry,data);
    const expiry=entry.getClass().getDeclaredField('expires');expiry.setAccessible(true);expiry.setLong(entry,Java.use('android.os.SystemClock').elapsedRealtime()+60000);
    Java.cast(cache,Java.use('java.util.Map')).put('123',entry);
    const previewMethods=Preview.class.getDeclaredMethods();let decorate=null;
    for(let i=0;i<previewMethods.length;i++)if(String(previewMethods[i].getName())==='decorate'&&previewMethods[i].getParameterTypes().length===3)decorate=previewMethods[i];
    if(decorate===null)throw new Error('X decorate method unavailable');
    decorate.setAccessible(true);
    const original=Java.use('android.text.SpannableStringBuilder').$new(Java.use('java.lang.String').$new('https://x.com/example/status/123'));
    const rendered=decorate.invoke(null,Java.array('java.lang.Object',[original,null,Java.use('java.lang.Boolean').$new(false)]));
    const SiteCards=Java.use('app.morphe.extension.chmate.SiteCards');
    const siteMethods=SiteCards.class.getDeclaredMethods();let urlsMethod=null;
    for(let i=0;i<siteMethods.length;i++)if(String(siteMethods[i].getName())==='urls'&&siteMethods[i].getParameterTypes().length===1)urlsMethod=siteMethods[i];
    if(urlsMethod===null)throw new Error('Site card URL method unavailable');urlsMethod.setAccessible(true);
    const richUrls=urlsMethod.invoke(null,Java.array('java.lang.Object',[rendered]));
    check(String(richUrls.toString()).indexOf('https://example.com/rich-card')>=0, 'Ordinary rich link-card extraction includes URLs inside the X preview');
    Prefs.edit().remove(fullKey).commit();
    check(!Java.use('app.morphe.extension.chmate.Haiagaru').xPostPreviewFullText(), 'full-text display defaults off when preference is unset');
    console.log('RESULT PASS '+checks.length+' X preview checks; synthetic data only, no network or post actions');
  } catch (e) {
    console.log('RESULT FAIL '+checks.length+' '+e);
    throw e;
  } finally {
    const edit=Prefs.edit();if(had)edit.putInt(key,before);else edit.remove(key);if(fullHad)edit.putBoolean(fullKey,fullBefore);else edit.remove(fullKey);edit.apply();
  }
});
