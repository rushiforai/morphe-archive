package org.ungoogled.ui;

import java.text.Normalizer;
import java.util.*;

/** Query normalization never changes a stored label or the place it identifies. */
final class LabelIndex {
    /** Match strength, best first; -1 is no match. */
    static final int EXACT = 0, PREFIX = 1, WORD = 2, INSIDE = 3, DETAIL = 4;

    static String normalize(String text) {
        if(text==null)return "";
        return Normalizer.normalize(text,Normalizer.Form.NFKD).replaceAll("\\p{M}+","")
            .toLowerCase(Locale.ROOT).trim().replaceAll("\\s+"," ");
    }

    /** Scores a normalized name against a normalized, non-empty query. */
    static int scoreNormalized(String name,String query) {
        if(query.isEmpty()||name.isEmpty())return -1;
        if(name.equals(query))return EXACT;
        if(name.startsWith(query))return PREFIX;
        int at=name.indexOf(query);
        if(at<0)return -1;
        for(;at>=0;at=name.indexOf(query,at+1))
            if(!Character.isLetterOrDigit(name.charAt(at-1)))return WORD;
        return INSIDE;
    }

    static int score(String label,String query) {
        return scoreNormalized(normalize(label),normalize(query));
    }

    /** One row the panel can show: a label (Home, Work or the user's own), a saved place or a recent one. */
    static final class Candidate {
        static final int LABEL=0, SAVED=1, RECENT=2;
        final int kind;
        final String title, subtitle, key;
        final SavedStore.Place place;
        /** Normalized: the title, the place's own name (labels), and note plus category (saved places). */
        final String name, placeName, detail;
        int score;

        Candidate(int kind,String title,String subtitle,String detail,SavedStore.Place place) {
            this.kind=kind;this.title=title;this.subtitle=subtitle;this.place=place;
            key=place.ftid!=null&&!place.ftid.isEmpty()?place.ftid:String.format(Locale.US,"%.6f,%.6f",place.lat,place.lng);
            name=normalize(title);placeName=kind==LABEL?normalize(place.name):"";this.detail=normalize(detail);
        }
    }

    /**
     * Ranks local candidates for a query: best match first, then labels before saved before
     * recent, then by title. A place shows once, as its best row. One letter matches only the
     * start of a word (labels: anywhere in the label), and notes need two letters. An empty
     * query lists the labels in their stored order (Home and Work first).
     */
    static List<Candidate> rankLocal(List<Candidate> all,String query) {
        String q=normalize(query);
        List<Candidate> found=new ArrayList<>();
        if(q.isEmpty()) {
            for(Candidate c:all)if(c.kind==Candidate.LABEL){c.score=EXACT;found.add(c);}
        } else {
            boolean shortQuery=q.length()<2;
            for(Candidate c:all) {
                int s=scoreNormalized(c.name,q);
                if(shortQuery&&c.kind!=Candidate.LABEL&&s>WORD)s=-1;
                if(c.kind==Candidate.LABEL) {
                    int byPlace=scoreNormalized(c.placeName,q);
                    if(shortQuery&&byPlace>WORD)byPlace=-1;
                    if(byPlace>=0&&(s<0||byPlace<s))s=byPlace;
                }
                if(s<0&&!shortQuery&&c.kind==Candidate.SAVED&&c.detail.contains(q))s=DETAIL;
                if(s>=0){c.score=s;found.add(c);}
            }
            found.sort((a,b)->a.score!=b.score?Integer.compare(a.score,b.score)
                :a.kind!=b.kind?Integer.compare(a.kind,b.kind):a.title.compareToIgnoreCase(b.title));
        }
        List<Candidate> out=new ArrayList<>();Set<String> seen=new HashSet<>();
        for(Candidate c:found)if(seen.add(c.key))out.add(c);
        return out;
    }

    static List<Integer> rank(List<String> labels,String query) {
        List<Integer> out=new ArrayList<>();
        for(int i=0;i<labels.size();i++)if(score(labels.get(i),query)>=0)out.add(i);
        out.sort((a,b)->{int order=Integer.compare(score(labels.get(a),query),score(labels.get(b),query));
            return order!=0?order:labels.get(a).compareToIgnoreCase(labels.get(b));});
        return out;
    }
}
