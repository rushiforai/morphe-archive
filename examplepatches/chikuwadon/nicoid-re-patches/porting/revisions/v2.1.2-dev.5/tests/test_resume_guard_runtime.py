#!/usr/bin/env python3
"""Run the *production* resume identity guard against a JVM session model."""
from pathlib import Path
from tempfile import TemporaryDirectory
import subprocess
source=Path(__file__).resolve().parents[1]/'ResumeGuard273.java'
with TemporaryDirectory(prefix='nicoid-return-test-') as d:
    root=Path(d)
    def make(path,body):
        f=root/path;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(body);return f
    a=make('android/util/Log.java','package android.util; public class Log {public static int i(String t,String m){return 0;}}')
    b=make('e/e/a/DirectBackground235.java','package e.e.a; public class DirectBackground235 {public static Object active;}')
    c=make('e/e/a/TestReturn.java','''package e.e.a;
public class TestReturn {
  static class State {public Object service;}
  static void ok(boolean b){if(!b)throw new AssertionError("identity regression");}
  public static void main(String[] args){
    DirectBackground235.active=null;
    ok(!ResumeGuard273.capture(null));
    ok(!ResumeGuard273.matches(new Object())); // newly opened popup must NOT return
    State old=new State();DirectBackground235.active=old;
    ok(ResumeGuard273.capture(null)); // background handoff still preparing
    ok(ResumeGuard273.matches(null)); // may retry without a service
    Object original=new Object();old.service=original;
    ok(ResumeGuard273.matches(original));
    ok(!ResumeGuard273.matches(new Object())); // not that state's service
    DirectBackground235.active=new State();
    ok(!ResumeGuard273.matches(original)); // session was replaced
    DirectBackground235.active=null;
    ok(ResumeGuard273.capture(original));
    ok(ResumeGuard273.matches(original));
    ok(!ResumeGuard273.matches(new Object()));
    System.out.println("PASS: missing-session startup, pending background service, service swap, state swap and retained return");
  }
}''')
    out=root/'classes';out.mkdir()
    subprocess.run(['javac','--release','8','-d',str(out),str(source),str(a),str(b),str(c)],check=True)
    subprocess.run(['java','-cp',str(out),'e.e.a.TestReturn'],check=True)
