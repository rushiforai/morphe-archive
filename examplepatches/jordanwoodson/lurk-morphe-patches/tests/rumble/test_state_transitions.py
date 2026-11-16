#!/usr/bin/env python3
"""Run production Rumble identity/keyword, Anonymous chat and saved-speed helpers without an APK or SDK."""
from pathlib import Path
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'shared'))
from host_java import run

PROBE = '''
import java.lang.reflect.*;
import java.util.*;
import io.github.jordanwoodson.extension.shared.ChatFilter;
import io.github.jordanwoodson.extension.shared.rumble.RumbleChat;
import io.github.jordanwoodson.extension.shared.rumble.RumblePlayback;
import io.github.jordanwoodson.extension.shared.settings.Settings;
public class RumbleStateProbe {
  public static class User {long id;String userName;User(long i,String n){id=i;userName=n;}}
  public static class Dto {List<User> users;Dto(User... u){users=List.of(u);}}
  public static class Message {long userId=7,id=1;String text="hi";}
  enum Speed {NORMAL,FAST,SLOW,SPEED_1_5}
  static int checks;
  static void check(boolean b,String m){if(!b)throw new AssertionError(m);checks++;}
  static String self()throws Exception{Field f=RumbleChat.class.getDeclaredField("self");f.setAccessible(true);return (String)f.get(null);}
  static int mention(String text)throws Exception{return ChatFilter.classify("viewer",text,ChatFilter.lists(self(),""));}
  static void account(long id){RumbleChat.currentUserId("_u"+Long.toString(id,36));}
  public static void main(String[] args)throws Exception{
    Settings.values.put("chat_keywords","true");Settings.values.put("chat_highlight_mentions","true");
    List<Message> messages=List.of(new Message());Dto first=new Dto(new User(42," Lurker "));
    account(42);
    switch(args[0]){
      case "empty":
        List<?> empty=Collections.emptyList();
        check(RumbleChat.messages(empty,first)==empty,"empty list instance changed");
        check(mention("hi @LURKER")==ChatFilter.HIGHLIGHT,"empty join did not learn identity");break;
      case "off":
        Settings.values.put("chat_keywords","false");
        check(RumbleChat.messages(messages,first)==messages,"disabled keywords changed messages");
        Settings.values.put("chat_keywords","true");
        check(mention("hi @lurker")==ChatFilter.NONE,"keywords-off join read the users list");
        RumbleChat.messages(messages,first);
        check(mention("hi @lurker")==ChatFilter.HIGHLIGHT,"keywords-on update did not learn identity");break;
      case "account":
        RumbleChat.messages(messages,first);
        check(mention("hi @lurker")==ChatFilter.HIGHLIGHT,"first account not learned");
        account(43);
        check(mention("hi @lurker")==ChatFilter.NONE,"account transition retained old identity");
        RumbleChat.messages(Collections.emptyList(),new Dto(new User(42,"Lurker"),new User(43,"Second")));
        check(mention("hi @second")==ChatFilter.HIGHLIGHT,"empty join did not learn second account");
        check(mention("hi @lurker")==ChatFilter.NONE,"old account mentions survived transition");
        RumbleChat.currentUserId("");
        check(mention("hi @second")==ChatFilter.NONE,"sign-out retained second identity");break;
      case "anonymous":
        java.net.URLConnection on=new java.net.URL("http://127.0.0.1/chat/1/stream").openConnection();
        RumbleChat.streamCookie(on,"Cookie","u_s=session");
        check(on.getRequestProperty("Cookie").equals("u_s=session"),"unregistered switch dropped the cookie");
        check(!RumbleChat.sendBlocked(),"unregistered switch blocked sending");
        Settings.values.put("chat_anonymous","false");
        java.net.URLConnection off=new java.net.URL("http://127.0.0.1/chat/1/stream").openConnection();
        RumbleChat.streamCookie(off,"Cookie","u_s=session");
        check("u_s=session".equals(off.getRequestProperty("Cookie")),"switch off dropped the cookie");
        check(!RumbleChat.sendBlocked(),"switch off blocked sending");
        Settings.values.put("chat_anonymous","true");
        java.net.URLConnection guest=new java.net.URL("http://127.0.0.1/chat/1/stream").openConnection();
        guest.setRequestProperty("Accept","text/event-stream");
        RumbleChat.streamCookie(guest,"Cookie","u_s=session");
        check(guest.getRequestProperty("Cookie")==null,"switch on still sent the session cookie");
        check("text/event-stream".equals(guest.getRequestProperty("Accept")),"switch on changed other headers");
        check(RumbleChat.sendBlocked(),"switch on let a message out");
        RumbleChat.streamCookie(null,"Cookie","u_s=session");break;
      case "speed":
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==null,"speed enabled by default");
        Settings.values.put("remember_speed","true");
        RumblePlayback.onSpeedPicked(Speed.FAST);
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==Speed.FAST,"enabled speed not remembered");
        Settings.values.put("remember_speed","false");
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==null,"off still overrides speed");
        RumblePlayback.onSpeedPicked(Speed.SLOW);
        Settings.values.put("remember_speed","true");
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==Speed.FAST,"off/on lost previously saved speed");
        RumblePlayback.onSpeedPicked(Speed.SLOW);
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==Speed.SLOW,"new enabled pick did not replace speed");break;
      case "default-speed":
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==null,"default speed unregistered still applies");
        Settings.values.put("default_speed","150");
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==Speed.SPEED_1_5,"default speed not applied");
        RumblePlayback.onSpeedPicked(Speed.FAST);
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==null,"default speed overrode a pick");
        RumblePlayback.onSpeedReset();
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==Speed.SPEED_1_5,"default speed not back after a reset");
        Settings.values.put("remember_speed","true");
        RumblePlayback.onSpeedPicked(Speed.SLOW);
        RumblePlayback.onSpeedReset();
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==Speed.SLOW,"remembered pick lost to the default");
        Settings.values.put("default_speed","0");
        Settings.values.put("remember_speed","false");
        check(RumblePlayback.rememberedSpeed(Speed.NORMAL)==null,"1x default changed the speed");break;
      default:throw new AssertionError(args[0]);
    }
    System.out.println("PASS: Rumble "+args[0]+" "+checks+" state checks");
  }
}
'''

if __name__ == '__main__':
    run('RumbleStateProbe', ['SleepTimer.java', 'ChatFilter.java', 'rumble/RumbleChat.java',
                            'rumble/RumblePlayback.java'], PROBE, ['empty', 'off', 'account', 'anonymous', 'speed', 'default-speed'])
