package app.morphe.extension.chmate;
public final class BoardPostResultTest {
 static int checks;
 static final String BOARD="https://board.example/a/",POST="https://board.example/test/bbs.cgi";
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);checks++;}
 public static void main(String[] args){
  String body="書きこみが終わりました。画面を切り替えるまでしばらくお待ち下さい。";
  check(BoardPostResult.success(BOARD,POST,"書きこみました。",body,false),"ex0ch positive response");
  check(BoardPostResult.success(BOARD,POST+"?posted=1","書き込みました。","書き込みが完了しました。",false),"posting endpoint with query");
  for(String title:new String[]{"Captcha認証","認証完了","計算による投稿確認","ERROR","書き込みエラー","スレッド本文","投稿確認",""})
   check(!BoardPostResult.success(BOARD,POST,title,body,false),"ordinary/error/challenge titles preserve draft: "+title);
  for(String text:new String[]{"ERROR: 投稿失敗 "+body,"エラー "+body,"ＥＲＲＯＲ "+body,"失敗 "+body,"認証が完了しました。","", "認証してください。"})
   check(!BoardPostResult.success(BOARD,POST,"書きこみました。",text,false),"errors and authentication are not posts");
  for(String url:new String[]{"http://board.example/test/bbs.cgi","https://evil.example/test/bbs.cgi","https://board.example/test/read.cgi/a/1/","https://board.example/a/","https://user:pass@board.example/test/bbs.cgi"})
   check(!BoardPostResult.success(BOARD,url,"書きこみました。",body,false),"only native same-origin posting result");
  check(!BoardPostResult.success(BOARD,POST,"書きこみました。",body,true),"confirmation with form is not completion");
  byte[] before=BoardPostResult.fingerprint("original\n本文😀");
  check(BoardPostResult.sameDraft(before,"original\n本文😀"),"unchanged original draft");
  check(!BoardPostResult.sameDraft(before,"new draft"),"new draft must be preserved");
  check(!BoardPostResult.sameDraft(before,"original\n本文"),"Unicode differences are preserved");
  check(!BoardPostResult.sameDraft(null,"text")&&!BoardPostResult.sameDraft(before,null),"missing binding fails closed");
  System.out.println("PASS "+checks+" posted-response and draft-preservation checks");
 }
}
