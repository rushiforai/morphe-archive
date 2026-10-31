package app.morphe.extension.chmate;
import java.nio.file.*;import java.util.*;
public class F9NgTemplateTest {
 public static void main(String[] args)throws Exception{
  List<ProgrammableNgScript.Input> inputs=new ArrayList<>();for(String p:args)inputs.add(new ProgrammableNgScript.Input(Files.readString(Path.of(p)),Map.of()));
  String[] ordinary={"こんにちは","普通の日本語の文章です。","東京都新宿区西新宿一丁目","情報処理安全確保支援士試験の結果です","https://example.org/","あいうえお","日本語の文章です。".repeat(200)};
  for(String s:ordinary)inputs.add(new ProgrammableNgScript.Input(s,Map.of()));
  var script=new ProgrammableNgScript(F9NgTemplate.SCRIPT);int[] result=script.evaluate(inputs);if(script.error()!=null)throw new AssertionError(script.error());
  for(int i=0;i<result.length;i++)if((result[i]!=0)!=(i<args.length))throw new AssertionError("case "+i+" result "+result[i]);
  System.out.println("PASS "+result.length+" F9 template cases");
 }
}
