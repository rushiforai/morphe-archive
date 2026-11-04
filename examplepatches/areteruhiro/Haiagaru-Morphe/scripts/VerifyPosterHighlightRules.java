package app.morphe.extension.chmate;

public final class VerifyPosterHighlightRules {
    static int checks;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    public static void main(String[] args){
        var a=new PosterHighlightRules.Poster("ID:Abc+/123", "名前 ◆trip+/ (ﾜｯﾁｮｲ ab12-cD+/)", "2026/10/17");
        check(a.id.equals("Abc+/123"),"Literal ID and symbols");
        check(a.slip.equals("ab12-cD+/"),"Full slip from header");
        check(a.suffix.equals("cD+/"),"Four character suffix");
        check(a.trip.equals("trip+/"),"Trip code");
        var shitaraba=new PosterHighlightRules.Poster("52h0j/J60","areteruhiro ◆2ofgBR.b9E\u3000","");
        check(shitaraba.trip.equals("2ofgBR.b9E"),"Shitaraba trip does not include fullwidth separator");
        check(new PosterHighlightRules.Rule(4,2,"","◆2ofgBR.b9E",true).matches(shitaraba,null,"any","any"),"Global shitaraba trip rule");
        check(new PosterHighlightRules.Rule(4,2,"","\u00a0◆2ofgBR.b9E\u200e",true).matches(shitaraba,null,"any","any"),"Saved trip ignores boundary spacing and direction marks");
        check(new PosterHighlightRules.Poster("","name ◆\u00a02ofgBR.b9E\u200e","").trip.equals(shitaraba.trip),"Native HTML spacing around trip");
        check(new PosterHighlightRules.Poster("","name ◇fake ◆2ofgBR.b9E","").trip.equals(shitaraba.trip),"Hollow marker cannot shadow actual trip");
        check(!new PosterHighlightRules.Rule(4,2,"","2ofgbr.b9E",true).matches(shitaraba,null,"any","any"),"Trip remains case sensitive");
        var nativeTrip=new PosterHighlightRules.Poster("mLBTD5WQ0","areteruhiro\u0002 ◆2ofgBR.b9E\u0001","");
        check(nativeTrip.trip.equals("2ofgBR.b9E"),"Actual native Shitaraba control delimiters");
        check(new PosterHighlightRules.Rule(4,2,"","2ofgBR.b9E",true).matches(nativeTrip,null,"any","any"),"Saved global rule matches native trip");
        check(new PosterHighlightRules.Rule(4,2,"","◆2ofgBR.b9E\u0001",true).matches(nativeTrip,null,"any","any"),"Legacy rule with native terminator remains usable");
        for(char separator:new char[]{1,2,0,31,127}) {
            check(new PosterHighlightRules.Poster("","name ◆2ofgBR.b9E"+separator+"next","").trip.equals("2ofgBR.b9E"),"Control delimiter ends trip "+(int)separator);
        }
        var mobile=new PosterHighlightRules.Poster("different", "名前 (ｽｯﾌﾟ ef34-cD+/)", "");
        check(mobile.suffix.equals(a.suffix),"Carrier prefix independent suffix");
        check(!mobile.slip.equals(a.slip),"Full slip keeps prefix four characters");
        var symbols=new PosterHighlightRules.Poster("a", "名前 (ﾜｯﾁｮｲ -ab+-x|/+)", "");
        check(symbols.slip.equals("-ab+-x|/+") && symbols.suffix.equals("x|/+"),"Symbols including leading hyphen");
        check(new PosterHighlightRules.Poster("???","名無し","").id.isEmpty(),"Unknown IDs never grouped");
        check(new PosterHighlightRules.Poster("!slip:ignore","名無し","").slip.isEmpty(),"No slip inferred from ID");
        check(new PosterHighlightRules.Poster("a","名無し ◇fake","").trip.isEmpty(),"Hollow trip marker is not authenticated trip");
        check(new PosterHighlightRules.Poster("a","名前", "2026 (ﾜｯﾁｮｲ ab12-cD+/)").slip.equals(a.slip),"Slip stored in date header");
        String thread=PosterHighlightRules.thread("https://egg.5ch.io/test/read.cgi/android/1792102288/167");
        String board=PosterHighlightRules.board(thread);
        check(thread.equals("egg.5ch.io/android/1792102288"),"Canonical thread scope");
        check(board.equals("egg.5ch.io/android"),"Canonical board scope");
        check(thread.equals(PosterHighlightRules.thread("http://egg.5ch.io/test/read.cgi/android/1792102288/1")),"Response number and scheme independent");
        check(!thread.equals(PosterHighlightRules.thread("https://egg.5ch.io/test/read.cgi/android/1792102289/1")),"Different threads isolated");
        check(PosterHighlightRules.thread("https://talk.jp/boards/operation/1736158664/49").equals("talk.jp/operation/1736158664"),"Talk scope");
        check(PosterHighlightRules.thread("https://jbbs.example/bbs/read.cgi/internet/1234/6789/1").endsWith("/internet/1234/6789"),"External nested boards keep thread ID");
        check(PosterHighlightRules.thread("https://user:pass@example/a/1").isEmpty(),"Invalid authenticated URL rejected");
        var id=new PosterHighlightRules.Rule(1,0,thread,a.id,true);
        check(id.matches(a,null,thread,board),"ID exact match");
        check(!id.matches(mobile,null,thread,board),"ID not substring");
        check(!id.matches(a,null,thread+"9",board),"Thread scope restriction");
        var suffix=new PosterHighlightRules.Rule(3,1,board,a.suffix,true);
        check(suffix.matches(mobile,null,thread+"9",board),"Board suffix across threads");
        check(!suffix.matches(mobile,null,thread,board+"2"),"Board boundary restriction");
        var lower=new PosterHighlightRules.Poster("x","名前 (ﾜｯﾁｮｲ ef34-cd+/)","");
        check(!suffix.matches(lower,null,thread,board),"Suffix case preserved");
        check(!new PosterHighlightRules.Rule(3,2,"",a.suffix,false).matches(a,null,thread,board),"Disabled rule");
        check(new PosterHighlightRules.Rule(4,2,"",a.trip,true).matches(a,null,"other","other"),"Global trip");
        check(!new PosterHighlightRules.Rule(2,2,"",a.slip,true).matches(mobile,null,thread,board),"Full slip not suffix match");
        var op=new PosterHighlightRules.Rule(0,0,thread,"",true);
        check(op.matches(a,a,thread,board),"OP by first response ID");
        check(!op.matches(mobile,a,thread,board),"OP does not guess from suffix");
        check(!op.matches(a,null,thread,board),"Missing first response never guessed");
        var anonymous=new PosterHighlightRules.Poster("???","名無し","");
        check(!op.matches(anonymous,anonymous,thread,board),"Anonymous posts never all highlighted");
        var tripFirst=new PosterHighlightRules.Poster("","名前 ◆trip+/","");
        check(op.matches(a,tripFirst,thread,board),"OP trip fallback");
        var slipFirst=new PosterHighlightRules.Poster("","名前 (ﾜｯﾁｮｲ ab12-cD+/)","");
        check(op.matches(a,slipFirst,thread,board),"OP full slip fallback");
        try {new PosterHighlightRules.Rule(3,2,"","x",true);throw new AssertionError("Expected suffix validation");}
        catch(IllegalArgumentException expected){checks++;}
        check(PosterHighlightRules.COLORS.length==12,"12 highlight colors available");
        check(PosterHighlightRules.COLOR_NAMES.length==PosterHighlightRules.COLORS.length,"Every color has a label");
        check(id.colorIndex==-1 && id.color(123)==123,"Legacy rule inherits shared color");
        java.util.Set<Integer> palette=new java.util.HashSet<>();
        for(int i=0;i<PosterHighlightRules.COLORS.length;i++) {
            var colored=new PosterHighlightRules.Rule(1,0,thread,a.id,true,i);
            check(colored.color(123)==PosterHighlightRules.COLORS[i],"Individual color "+i);
            check(colored.matches(a,null,thread,board),"Color does not alter matching "+i);
            palette.add(colored.color(123));
        }
        check(palette.size()==12,"All colors distinct");
        check(new PosterHighlightRules.Rule(1,0,thread,a.id,true,999).color(123)==123,"Invalid stored color falls back safely");
        System.out.println("PASS "+checks+" literal poster-highlight identity and scope checks");
    }
}
