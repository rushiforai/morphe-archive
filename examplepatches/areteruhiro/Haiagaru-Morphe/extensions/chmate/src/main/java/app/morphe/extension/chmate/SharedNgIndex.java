package app.morphe.extension.chmate;

import java.util.*;

/** Immutable, settings-filtered index. Only keyword candidates require body normalization. */
final class SharedNgIndex {
    static final String[] KINDS = {"id", "wacchoi", "prefix", "suffix", "keyword", "name", "trip", "reporter"};
    private final Map<String, Bucket> boards = new HashMap<>();
    private static final class Bucket {
        final Set<String> ids=new HashSet<>(), slips=new HashSet<>(), prefixes=new HashSet<>(), suffixes=new HashSet<>(), reporters=new HashSet<>();
        final List<String> names=new ArrayList<>(), words=new ArrayList<>();
        final List<SharedNgRules.Rule> expressions=new ArrayList<>();
        void add(SharedNgRules.Rule r) {
            if(r.regex){expressions.add(r);return;}
            switch(r.kind) {
                case "id":ids.add(r.value);break;
                case "reporter":reporters.add(r.value);break;
                case "wacchoi":slips.add(r.value);break;
                case "prefix":prefixes.add(r.value);break;
                case "suffix":suffixes.add(r.value);break;
                case "name":case "trip":names.add(r.value);break;
                case "keyword":words.add(r.value);break;
            }
        }
        boolean identity(String id,String name) {
            for(SharedNgRules.Rule r:expressions)if(!r.kind.equals("keyword")){
                String input=r.kind.equals("id")?id:r.kind.equals("name")||r.kind.equals("trip")?name:SharedNgRules.wacchoi(name);
                if(r.kind.equals("prefix")&&input.length()==9)input=input.substring(0,4);
                if(r.kind.equals("suffix")&&input.length()==9)input=input.substring(5);
                if(r.expressionMatches(input))return true;
            }
            if(ids.contains(id))return true;
            for(String value:names)if(name.contains(value))return true;
            if(slips.isEmpty()&&prefixes.isEmpty()&&suffixes.isEmpty())return false;
            String slip=SharedNgRules.wacchoi(name);
            return slips.contains(slip)||(slip.length()==9&&(prefixes.contains(slip.substring(0,4))||suffixes.contains(slip.substring(5))));
        }
        boolean hasBody(){if(!words.isEmpty())return true;for(SharedNgRules.Rule r:expressions)if(r.kind.equals("keyword"))return true;return false;}
        boolean body(String body,String raw) {for(String word:words)if(body.contains(word))return true;for(SharedNgRules.Rule r:expressions)if(r.kind.equals("keyword")&&r.expressionMatches(raw))return true;return false;}
    }
    SharedNgIndex(List<SharedNgRules.Rule> rules,int votes,Set<String> exceptions,Set<String> excludedBoards,int kinds) {
        for(SharedNgRules.Rule rule:rules) {
            int kind=Arrays.asList(KINDS).indexOf(rule.kind);
            if(kind<0||(kinds&(1<<kind))==0||rule.revoked||rule.votes<Math.max(votes,rule.minVotes)
                    ||exceptions.contains(rule.id)||excludedBoards.contains(rule.board))continue;
            // Unscoped past identities apply globally; poster names and reporter IDs still require a family.
            if(rule.board.equals("*")&&rule.kind.equals("reporter"))continue;
            boards.computeIfAbsent(rule.board,key->new Bucket()).add(rule);
        }
    }
    boolean matchesTitle(String board,String reporter) {
        Bucket local=boards.get(board);return local!=null&&"edge/all".equals(board)&&local.reporters.contains(reporter);
    }
    boolean matches(String board,String id,String name,String rawBody) {
        Bucket local=boards.get(board),global=boards.get("*");
        if(local!=null&&local.identity(id,name)||global!=null&&global.identity(id,name))return true;
        if((local==null||!local.hasBody())&&(global==null||!global.hasBody()))return false;
        String body=SharedNgRules.text(rawBody);
        return local!=null&&local.body(body,rawBody)||global!=null&&global.body(body,rawBody);
    }
}
