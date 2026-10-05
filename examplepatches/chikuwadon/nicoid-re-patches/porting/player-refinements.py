#!/usr/bin/env python3
"""Apply after player-cache.py; leave event scheduling on the video clock."""
from pathlib import Path
import sys,re
r=Path(sys.argv[1])/'smali'
for cls in ['t','u']:
 p=r/f'e/e/a/{cls}.smali';s=p.read_text()
 pat=r'(\.method [^\n]* a\(Landroid/graphics/Canvas;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;\)V\n)(.*?)(\.end method)'
 def draw(m):
  b=m[2].replace('    move-object/from16 v1, p0','    move-object/from16 v1, p0\n    invoke-static {v1}, Le/e/a/CommentMotion;->frame(Ljava/lang/Object;)V',1)
  field='Q' if cls=='t' else 'P'
  b=b.replace('    :cond_0\n    iget v7, v1, Le/e/a/'+cls+';->'+field+':F','    :cond_0\n    invoke-static {v1, v11, v10}, Le/e/a/CommentMotion;->start(Ljava/lang/Object;Ljava/lang/Object;F)F\n    move-result v10\n    iget v7, v1, Le/e/a/'+cls+';->'+field+':F',1)
  b=re.sub(r'    iget (v\d+), (v\d+), Le/e/a/'+cls+';->'+field+r':F',lambda v:'    invoke-static {'+v[2]+'}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F\n    move-result '+v[1],b)
  return m[1]+b+m[3]
 s,n=re.subn(pat,draw,s,flags=re.S);assert n==1
 def run(m):
  b=m[2].replace(f'    iget v0, p0, Le/e/a/{cls};->a:I','    invoke-static {p0}, Le/e/a/CommentMotion;->fps(Ljava/lang/Object;)I\n    move-result v0',1)
  b=b.replace('    sub-long v2, v0, v2','    invoke-static {p0}, Le/e/a/CommentMotion;->period(Ljava/lang/Object;)J\n    move-result-wide v0\n    sub-long v2, v0, v2')
  return m[1]+b+m[3]
 s,n=re.subn(r'(\.method public run\(\)V\n)(.*?)(\.end method)',run,s,flags=re.S);assert n==1;p.write_text(s)
p=r/'com/sauzask/nicoid/NicoidVideoFragment.smali';s=p.read_text();s=re.sub(r'(    invoke-static \{([^}]+)\}, Le/e/a/ModernControls;->attach\(Lcom/sauzask/nicoid/NicoidVideoFragment;\)V)',lambda m:m[1]+'\n    invoke-static {'+m[2]+'}, Le/e/a/FullscreenControls;->update(Ljava/lang/Object;)V',s)
s=re.sub(r'(\.method public onConfigurationChanged\(Landroid/content/res/Configuration;\)V\n)(.*?)(\.end method)',lambda m:m[1]+m[2].replace('    return-void','    invoke-static {p0}, Le/e/a/FullscreenControls;->update(Ljava/lang/Object;)V\n    return-void')+m[3],s,flags=re.S);p.write_text(s)

p=r/'com/sauzask/nicoid/NicoidDownloadCache.smali';s=p.read_text().replace('    sput-wide v10, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J\n    return-void','    sput-wide v10, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J\n    invoke-static {v8, v9, v10, v11}, Le/e/a/CachePack;->completed(Ljava/lang/String;Ljava/lang/String;J)V\n    return-void',1);p.write_text(s)

p=r/'e/e/a/ModernComments.smali';s=p.read_text().replace('    invoke-static {v13, v12, v0}, Le/e/a/CacheHls;->saveComments','    invoke-static {v13, v12, v0}, Le/e/a/CacheFolders;->comments(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z\n    move-result v11\n    if-eqz v11, :decode_comments\n    invoke-static {v13, v12, v0}, Le/e/a/CacheHls;->saveComments');p.write_text(s)
