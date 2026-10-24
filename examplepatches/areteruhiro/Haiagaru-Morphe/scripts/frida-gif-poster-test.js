// One-pixel synthetic GIF served on Android loopback; no external network or user files.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.haiagaru.resumefix226'))throw Error('Verification app only');
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),G=Java.use('app.morphe.extension.chmate.GifAutoFetch'),Thread=Java.use('java.lang.Thread');
 const prefs=H.preferences(app),key='urlGifFetchMode',had=prefs.contains(key),saved=prefs.getInt(key,-1);prefs.edit().putInt(key,1).commit();
 const server=Java.use('java.net.ServerSocket').$new(0,1,Java.use('java.net.InetAddress').getByName('127.0.0.1'));server.setSoTimeout(10000);
 const url='http://127.0.0.1:'+server.getLocalPort()+'/fixture.gif';
 const bytes=Java.use('android.util.Base64').decode('R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==',0);
 const Serve=Java.registerClass({name:'app.morphe.extension.test.GifPosterServe'+Date.now(),implements:[Java.use('java.lang.Runnable')],methods:{run:function(){try{
  const client=server.accept();client.setSoTimeout(8000);const reader=Java.use('java.io.BufferedReader').$new(Java.use('java.io.InputStreamReader').$new(client.getInputStream()));let line;while((line=reader.readLine())!==null&&String(line)!==''){}const output=client.getOutputStream();output.write(Java.use('java.lang.String').$new('HTTP/1.1 200 OK\r\nContent-Type: image/gif\r\nContent-Length: '+bytes.length+'\r\nConnection: close\r\n\r\n').getBytes('US-ASCII'));output.write(bytes);output.flush();client.close();
 }catch(e){console.log('SERVER '+e);}finally{server.close();}}}});Thread.$new(Serve.$new()).start();
 try{
 if(Java.use('android.os.Looper').myLooper()&&Java.use('android.os.Looper').myLooper().equals(Java.use('android.os.Looper').getMainLooper()))throw Error('Must decode off main');
 G.generate(url);
 const f=G.class.getDeclaredField('POSTERS');f.setAccessible(true);const map=Java.cast(f.get(null),Java.use('java.util.Map')),value=map.get(url);if(!value)throw Error('Poster not generated');
 const connection=Java.cast(Java.use('java.net.URL').$new(String(value)).openConnection(),Java.use('java.net.HttpURLConnection'));connection.setConnectTimeout(3000);connection.setReadTimeout(3000);if(connection.getResponseCode()!==200)throw Error('Poster endpoint failed');
 const bitmap=Java.use('android.graphics.BitmapFactory').decodeStream(connection.getInputStream());if(!bitmap||bitmap.getWidth()!==1||bitmap.getHeight()!==1)throw Error('Decoded poster mismatch');bitmap.recycle();connection.disconnect();map.remove(url);
 const digest=Java.use('java.security.MessageDigest').getInstance('SHA-256').digest(Java.use('java.lang.String').$new(url).getBytes('UTF-8'));const name='gif-'+Array.from(digest).map(b=>('0'+(b&255).toString(16)).slice(-2)).join('')+'.jpg';
 const file=Java.use('java.io.File').$new(app.getCacheDir(),'haiagaru-gif-posters/'+name);if(file.exists())file.delete();
 console.log('GIF_POSTER_COMPLETE actual background GIF decode, JPEG cache and loopback delivery PASS');
 }catch(e){console.log('FAIL '+e.stack);}finally{server.close();const e=prefs.edit();if(had)e.putInt(key,saved);else e.remove(key);e.commit();console.log('GIF_POSTER_STATE_RESTORED');}
});
