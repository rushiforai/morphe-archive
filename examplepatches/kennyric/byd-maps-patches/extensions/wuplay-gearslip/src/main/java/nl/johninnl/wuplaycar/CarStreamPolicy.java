package nl.johninnl.wuplaycar;

import java.net.URI;
import java.util.*;
import java.util.regex.*;

/** The car's source budget. Unknown rates never become a permissive fallback. */
public final class CarStreamPolicy {
    public static final long MAX_BITRATE = 10_000_000L;
    public interface Candidate { Long bitrate(); String addon(); boolean direct(); }
    private CarStreamPolicy() {}
    public static boolean eligible(Long bitrate) { return bitrate != null && bitrate > 0 && bitrate <= MAX_BITRATE; }
    public static Long bitrate(Long bytes, Double seconds) {
        if (bytes == null || bytes <= 0 || seconds == null || !Double.isFinite(seconds) || seconds <= 0) return null;
        double result = bytes.doubleValue() * 8d / seconds;
        return Double.isFinite(result) && result > 0 && result < Long.MAX_VALUE ? (long)Math.ceil(result) : null;
    }
    public static Double runtimeSeconds(Object runtime) {
        if (runtime instanceof Number) { double minutes=((Number)runtime).doubleValue();return Double.isFinite(minutes)&&minutes>0?minutes*60d:null; }
        if (!(runtime instanceof String)) return null;
        Matcher m=Pattern.compile("^\\s*(\\d+(?:\\.\\d+)?)\\s*(?:min(?:utes?)?)?\\s*$",Pattern.CASE_INSENSITIVE).matcher((String)runtime);
        if (!m.matches()) return null;
        try { return runtimeSeconds(Double.parseDouble(m.group(1))); } catch (NumberFormatException e) { return null; }
    }
    public static boolean direct(String url) {
        if(url==null)return false;
        try { URI uri=new URI(url);return ("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme()))&&uri.getHost()!=null&&!uri.getHost().isEmpty()&&uri.getUserInfo()==null; }
        catch(Exception e){return false;}
    }
    public static <T extends Candidate> List<T> ranked(List<T> candidates,String preferred) {
        List<T> result=new ArrayList<>();
        for(T candidate:candidates)if(candidate.direct()&&eligible(candidate.bitrate()))result.add(candidate);
        if(preferred!=null&&!preferred.isEmpty())result.sort(Comparator.comparingInt(c->preferred.equals(c.addon())?0:1));
        return result;
    }
}
