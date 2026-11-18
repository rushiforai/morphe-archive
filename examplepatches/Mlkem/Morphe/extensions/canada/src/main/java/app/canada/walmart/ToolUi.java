package app.canada.walmart;
import android.app.*;import android.content.*;import android.view.*;import android.widget.*;import android.text.InputType;
final class ToolUi {
 static int dp(Context c,int n){return Math.round(c.getResources().getDisplayMetrics().density*n);}
 static LinearLayout column(Context c){LinearLayout v=new LinearLayout(c);v.setOrientation(1);int p=dp(c,16);v.setPadding(p,p,p,p);return v;}
 static TextView text(LinearLayout parent,String value,int sp){TextView t=new TextView(parent.getContext());t.setText(value);t.setTextSize(sp);t.setPadding(0,dp(t.getContext(),6),0,dp(t.getContext(),6));parent.addView(t,new LinearLayout.LayoutParams(-1,-2));return t;}
 static Button button(LinearLayout parent,String label,Runnable action){Button b=new Button(parent.getContext());b.setText(label);b.setAllCaps(false);b.setMinHeight(dp(b.getContext(),48));parent.addView(b,new LinearLayout.LayoutParams(-1,-2));b.setOnClickListener(v->{try{action.run();}catch(Exception e){RuntimeStats.error(label,e);message(parent.getContext(),"Unavailable","This tool could not complete. Copy diagnostics for details.");}});return b;}
 static EditText input(LinearLayout parent,String hint,boolean number){EditText e=new EditText(parent.getContext());e.setHint(hint);e.setSingleLine(true);if(number)e.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_DECIMAL);parent.addView(e,new LinearLayout.LayoutParams(-1,-2));return e;}
 static AlertDialog dialog(Context c,String title,LinearLayout body){ScrollView scroll=new ScrollView(c);scroll.addView(body);return new AlertDialog.Builder(c).setTitle(title).setView(scroll).setNegativeButton("Close",null).show();}
 static void message(Context c,String title,String text){new AlertDialog.Builder(c).setTitle(title).setMessage(text).setPositiveButton("OK",null).show();}
 static void copy(Context c,String label,String text){((ClipboardManager)c.getSystemService(Context.CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText(label,text));Toast.makeText(c,"Copied "+label,Toast.LENGTH_SHORT).show();}
 static void share(Context c,String title,String text){Intent i=new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_SUBJECT,title).putExtra(Intent.EXTRA_TEXT,text);c.startActivity(Intent.createChooser(i,title));}
 static void export(Context c,String title,String text){new AlertDialog.Builder(c).setTitle(title).setItems(new String[]{"Copy to clipboard","Share…"},(d,w)->{if(w==0)copy(c,title,text);else share(c,title,text);}).setNegativeButton("Cancel",null).show();}
 static void confirm(Context c,String title,String message,Runnable action){new AlertDialog.Builder(c).setTitle(title).setMessage(message).setNegativeButton("Cancel",null).setPositiveButton("Confirm",(d,w)->action.run()).show();}
}
