Java.perform(function () {
  const app = Java.use('android.app.ActivityThread').currentApplication();
  const allowedPackages = [
    'jp.co.airfront.android.a2chMate.haiagaru.reporter191',
    'jp.co.airfront.android.a2chMate.haiagaru.reporter226',
    'jp.co.airfront.android.a2chMate.haiagaru.reporter242'
  ];
  if (allowedPackages.indexOf(String(app.getPackageName())) < 0) {
    throw new Error('Run only against an isolated reporter package');
  }

  const JSONObject = Java.use('org.json.JSONObject');
  const JSONArray = Java.use('org.json.JSONArray');
  const Parser = Java.use('app.morphe.extension.chmate.XMediaAttachments');
  const parse = Parser.fromJson.overload('java.lang.String', 'java.lang.String');

  function fixture(count) {
    const post = JSONObject.$new();
    const media = JSONArray.$new();
    post.put('id_str', 'fixture-post');
    for (let i = 0; i < count; i++) {
      const item = JSONObject.$new();
      item.put('media_url_https', 'https://pbs.twimg.com/media/fixture' + i + '.jpg');
      media.put(item);
    }
    post.put('mediaDetails', media);
    return String(post.toString());
  }

  const sixtyFour = parse.call(Parser, fixture(64), 'fixture-post');
  if (sixtyFour.length !== 64) throw new Error('Expected 64 images, got ' + sixtyFour.length);
  if (String(sixtyFour[63]) !== 'https://pbs.twimg.com/media/fixture63.jpg') {
    throw new Error('The final fixture image was not returned');
  }
  console.log('PASS Twitter media parser returns all supplied images without a fixed count cap');
});
