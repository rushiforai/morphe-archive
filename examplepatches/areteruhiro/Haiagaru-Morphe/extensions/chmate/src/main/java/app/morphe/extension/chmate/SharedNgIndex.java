package app.morphe.extension.chmate;

import java.util.*;

/** Immutable, settings-filtered index. Only keyword candidates require body normalization. */
final class SharedNgIndex {
    static final String[] KINDS = {"id", "wacchoi", "prefix", "suffix", "keyword", "name", "trip", "reporter"};
    private final Map<String, Bucket> boards = new HashMap<>();
    private final NgResponseDecisionCache responseDecisions=new NgResponseDecisionCache();
    private static final class Bucket {
        final Set<String> ids=new HashSet<>(), slips=new HashSet<>(), prefixes=new HashSet<>(), suffixes=new HashSet<>(), reporters=new HashSet<>();
        final List<String> names=new ArrayList<>(), words=new ArrayList<>();
        final List<SharedNgRules.Rule> expressions=new ArrayList<>();
        NgLiteralMatcher wordMatcher,nameMatcher;
        void finish(){
            wordMatcher=new NgLiteralMatcher(words);nameMatcher=new NgLiteralMatcher(names);
        }
        void add(SharedNgRules.Rule r) {
            if(r.regex){expressions.add(r);return;}
            switch(r.kind) {
                case "id":ids.add(r.value);break;
                case "reporter":reporters.add(r.value);break;
                case "wacchoi":slips.add(r.value);break;
                case "prefix":prefixes.add(r.value);break;
                case "suffix":suffixes.add(r.value);break;
                case "name":case "trip":if(r.locallyEdited||NgRegexSafety.identityContent(r.value))names.add(r.value);break;
                case "keyword":words.add(r.value);break;
            }
        }
        boolean literalIdentity(String id,String name) {
            if(ids.contains(id))return true;
            if(nameMatcher.matches(name))return true;
            String slip=null;
            if(!slips.isEmpty()||!prefixes.isEmpty()||!suffixes.isEmpty()){
                slip=SharedNgRules.wacchoi(name);
                if(slips.contains(slip)||(slip.length()==9&&(prefixes.contains(slip.substring(0,4))||suffixes.contains(slip.substring(5)))))return true;
            }
            return false;
        }
        boolean expressionIdentity(String id,String name) {
            String slip=null;
            for(SharedNgRules.Rule r:expressions)if(!r.kind.equals("keyword")){
                String input;
                if(r.kind.equals("id"))input=id;
                else if(r.kind.equals("name")||r.kind.equals("trip"))input=name;
                else {if(slip==null)slip=SharedNgRules.wacchoi(name);input=slip;}
                if(r.kind.equals("prefix")&&input.length()==9)input=input.substring(0,4);
                if(r.kind.equals("suffix")&&input.length()==9)input=input.substring(5);
                if(r.expressionMatches(input))return true;
            }
            return false;
        }
        boolean expressionBody(String raw) {for(SharedNgRules.Rule r:expressions)if(r.kind.equals("keyword")&&r.expressionMatches(raw))return true;return false;}
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
        for(Bucket bucket:boards.values())bucket.finish();
    }
    boolean matchesTitle(String board,String reporter) {
        Bucket local=boards.get(board);return local!=null&&"edge/all".equals(board)&&local.reporters.contains(reporter);
    }
    boolean matchesHtml(String board,String id,String nameHtml,String bodyHtml,NgResponseDecisionCache.Decoder decoder){
        return responseDecisions.match(board,id,nameHtml,bodyHtml,SharedNgRules::regexEvaluationCertain,
                ()->{
                    SharedNgRules.beginRegexEvaluation();
                    Bucket local=boards.get(board),global=boards.get("*");
                    if(local==null&&global==null)return false;
                    if(local!=null&&local.ids.contains(id)||global!=null&&global.ids.contains(id))return true;
                    String name=decoder.plain(nameHtml);
                    if(local!=null&&local.literalIdentity(id,name)||global!=null&&global.literalIdentity(id,name))return true;
                    return matchesAfterIdentity(local,global,id,name,decoder.plain(bodyHtml));
                });
    }
    static List<SharedNgRules.Rule> matchingRules(List<SharedNgRules.Rule> source, int votes,
            Set<String> ignored, Set<String> excluded, int kinds, String board, String id, String name, String body) {
        List<SharedNgRules.Rule> matched = new ArrayList<>();
        for (SharedNgRules.Rule rule : source) {
            SharedNgIndex candidate = new SharedNgIndex(Collections.singletonList(rule), votes, ignored, excluded, kinds);
            if (candidate.matches(board, id, name, body)) matched.add(rule);
        }
        return matched;
    }
    boolean matches(String board,String id,String name,String rawBody) {
        Bucket local=boards.get(board),global=boards.get("*");
        if(local!=null&&local.literalIdentity(id,name)||global!=null&&global.literalIdentity(id,name))return true;
        return matchesAfterIdentity(local,global,id,name,rawBody);
    }
    private boolean matchesAfterIdentity(Bucket local,Bucket global,String id,String name,String rawBody) {
        // Regex rules use raw text, so a regex-only bucket needs no normalization.
        boolean literalBody=local!=null&&!local.words.isEmpty()||global!=null&&!global.words.isEmpty();
        if(literalBody){
            String body=SharedNgRules.text(rawBody);
            if(local!=null&&local.wordMatcher.matches(body)||global!=null&&global.wordMatcher.matches(body))return true;
        }
        if(local!=null&&local.expressionIdentity(id,name)||global!=null&&global.expressionIdentity(id,name))return true;
        return local!=null&&local.expressionBody(rawBody)||global!=null&&global.expressionBody(rawBody);
    }
}
