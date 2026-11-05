package app.morphe.extension.chmate;

import java.util.*;

/** Subtract only excluded contributors. Legacy rules without provenance remain usable. */
final class SharedNgReporterPolicy {
    static List<SharedNgRules.Rule> apply(List<SharedNgRules.Rule> source,Set<String> ignored){
        if(ignored.isEmpty())return source;
        List<SharedNgRules.Rule> filtered=new ArrayList<>(source.size());
        for(SharedNgRules.Rule rule:source){
            if(rule.contributors.isEmpty()){filtered.add(rule);continue;}
            List<String> remaining=new ArrayList<>();
            for(String reporter:rule.contributors)if(!ignored.contains(reporter))remaining.add(reporter);
            if(remaining.size()==rule.contributors.size())filtered.add(rule);
            else if(!remaining.isEmpty())filtered.add(new SharedNgRules.Rule(rule.id,rule.board,rule.kind,rule.value,rule.period,
                    remaining.size(),rule.revoked,rule.minLevel,rule.minVotes,rule.regex,remaining));
        }
        return Collections.unmodifiableList(filtered);
    }
}
