#!/usr/bin/env python3
"""Apply cache/gesture/comment hooks after the existing porting patches."""
import pathlib,re,sys
root=pathlib.Path(sys.argv[1])/'smali'
def edit(path,fn):
 p=root/path;s=p.read_text();n=fn(s);p.write_text(n)
def method(s,signature,body):
 pat=r'(\.method [^\n]* '+re.escape(signature)+r'\n).*?\.end method'
 n,count=re.subn(pat,lambda m:m[1]+body+'\n.end method',s,flags=re.S)
 assert count==1,signature
 return n
edit(pathlib.Path('e/e/a/o.smali'),lambda s:method(s,'c(Landroid/content/Context;)Ljava/lang/String;','    .locals 1\n    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;\n    move-result-object v0\n    return-object v0'))
for name in ['t','u']:
 path=pathlib.Path('e/e/a/'+name+'.smali')
 def clock(s):
  for signature,div in [('getPosition()I','    div-int/lit8 v0, v0, 0xa\n'),('getPositionRes()I','')]:
   s=method(s,signature,'    .locals 1\n    invoke-static {p0}, Le/e/a/CommentClock;->position(Ljava/lang/Object;)I\n    move-result v0\n'+div+'    return v0')
  return method(s,'setPlaySpeed(F)V','    .locals 0\n    invoke-static {p0, p1}, Le/e/a/CommentClock;->speed(Ljava/lang/Object;F)V\n    return-void')
 edit(path,clock)
edit(pathlib.Path('com/sauzask/nicoid/NicoidVideoActivity.smali'),lambda s:s.replace('Le/e/a/ModernShorts;->touch(', 'Le/e/a/PlayerGestures;->touch(').replace('    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V','    invoke-static {p0}, Le/e/a/PlayerGestures;->destroy(Landroid/app/Activity;)V\n    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V'))
edit(pathlib.Path('com/sauzask/nicoid/NicoidSetting.smali'),lambda s:re.sub(r'(\.method protected onResume\(\)V\n.*?)(\.end method)',lambda m:m[1].replace('    return-void','    invoke-static {p0}, Le/e/a/CacheFolders;->summary(Landroid/preference/PreferenceActivity;)V\n    return-void')+m[2],s,flags=re.S))
# Replace constructors only, preserving original File-typed method signatures.
for base in ['e/e/a','com/sauzask/nicoid']:
 for p in (root/base).rglob('*.smali'):
  s=p.read_text()
  for orig,new in [('File','CacheFile'),('FileInputStream','CacheInputStream'),('FileOutputStream','CacheOutputStream')]:
   s=re.sub(r'(new-instance [^\n]+, )Ljava/io/'+orig+r';',r'\1Le/e/a/'+new+';',s)
   s=s.replace('Ljava/io/'+orig+';-><init>(', 'Le/e/a/'+new+';-><init>(')
  s=s.replace('Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;', 'Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;').replace('Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;', 'Le/e/a/CachePlayback;->fromFile(Ljava/io/File;)Landroid/net/Uri;')
  s=re.sub(r'invoke-virtual(/range)? (\{[^}]+\}), Landroid/content/Context;->(startService|startForegroundService)\(Landroid/content/Intent;\)Landroid/content/ComponentName;',lambda m:'invoke-static'+(m[1] or '')+' '+m[2]+', Le/e/a/CacheFolders;->'+m[3]+'(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;',s)
  s=re.sub(r'invoke-virtual(/range)? (\{[^}]+\}), Landroid/media/MediaPlayer;->setDataSource\(Ljava/lang/String;\)V',lambda m:'invoke-static'+(m[1] or '')+' '+m[2]+', Le/e/a/CachePlayback;->dataSource(Landroid/media/MediaPlayer;Ljava/lang/String;)V',s)
  p.write_text(s)

edit(pathlib.Path('com/devbrackets/android/exomedia/ui/widget/VideoView.smali'),lambda s:s.replace('Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;', 'Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;'))
