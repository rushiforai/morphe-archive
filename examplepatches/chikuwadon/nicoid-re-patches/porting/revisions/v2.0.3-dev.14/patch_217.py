# v2.0.3-dev.14: compact rows, concise estimated totals, efficient list refresh
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.13/patch_216.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev13",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES

def once(source, before, after, name):
    count=source.count(before)
    if count != 1:
        raise AssertionError(f"{name}: expected one anchor, got {count}")
    return source.replace(before,after)

def compact_ui(source):
    # The "約" prefix already makes an approximate total unambiguous.
    source=once(source,'+"（推定）"','', "drop redundant suffix")
    initial='''if(old==null){int pad=PanelUi.dp(context,12);row.setPadding(pad,pad,pad,pad);row.addView(PanelUi.text(context,"",16));row.addView(PanelUi.text(context,"",12));ProgressBar p=new ProgressBar(context,null,android.R.attr.progressBarStyleHorizontal);p.setProgressTintList(ColorStateList.valueOf(UiDialogs.accent(context)));p.setIndeterminateTintList(ColorStateList.valueOf(UiDialogs.accent(context)));row.addView(p,new LinearLayout.LayoutParams(-1,PanelUi.dp(context,6)));row.addView(PanelUi.text(context,"",12));}'''
    replacement='''if(old==null){
      int horizontal=PanelUi.dp(context,12),vertical=PanelUi.dp(context,8);
      row.setPadding(horizontal,vertical,horizontal,vertical);
      row.setMinimumHeight(PanelUi.dp(context,56));
      TextView heading=PanelUi.text(context,"",16);
      heading.setPadding(0,0,0,0);
      heading.setMaxLines(2);
      heading.setEllipsize(android.text.TextUtils.TruncateAt.END);
      row.addView(heading,new LinearLayout.LayoutParams(-1,-2));
      TextView details=PanelUi.text(context,"",12);
      details.setPadding(0,PanelUi.dp(context,3),0,0);
      row.addView(details,new LinearLayout.LayoutParams(-1,-2));
      ProgressBar p=new ProgressBar(context,null,android.R.attr.progressBarStyleHorizontal);
      p.setProgressTintList(ColorStateList.valueOf(UiDialogs.accent(context)));
      p.setIndeterminateTintList(ColorStateList.valueOf(UiDialogs.accent(context)));
      LinearLayout.LayoutParams progressSize=new LinearLayout.LayoutParams(-1,PanelUi.dp(context,3));
      progressSize.topMargin=PanelUi.dp(context,6);
      row.addView(p,progressSize);
    }'''
    source=once(source,initial,replacement,"three-child compact download row")
    source=once(source,'''      TextView oldCapacity=(TextView)row.getChildAt(3);
      oldCapacity.setText("");
      oldCapacity.setVisibility(View.GONE);
      return row;''','''      return row;''',"remove legacy fourth text view")
    source=once(source,
      'boolean closed,scanning;String cacheActive="";',
      'boolean closed,scanning;String cacheActive="";long renderedRevision=-1;',
      "remember last rendered job revision")
    source=once(source,
      'if(closed)return;update();if(mode==1&&SystemClock.elapsedRealtime()-lastScan>=5000)reload();MAIN.postDelayed(this,1000);',
      '''if(closed)return;
        if(mode==0)update();
        else if(mode==1&&SystemClock.elapsedRealtime()-lastScan>=5000)reload();
        else if(mode==2){
          long current;
          synchronized(DownloadJobs115.class){current=DownloadJobs115.revision;}
          if(current!=renderedRevision)update();
        }
        MAIN.postDelayed(this,1000);''',
      "avoid full row allocation on saved/error tabs")
    source=once(source,
      'rows.addAll(queuedCaches());}notifyDataSetChanged();}',
      '''rows.addAll(queuedCaches());}
      synchronized(DownloadJobs115.class){renderedRevision=DownloadJobs115.revision;}
      notifyDataSetChanged();}''',
      "record rendered job revision")
    return source

def stage(base,destination):
    files=previous.stage(base,destination)
    target=Path(destination)/"DownloadUi115.java"
    target.write_text(compact_ui(target.read_text(encoding="utf-8")),encoding="utf-8")
    return files
