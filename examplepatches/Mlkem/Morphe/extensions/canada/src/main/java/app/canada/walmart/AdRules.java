package app.canada.walmart;

/** Matches the app's SponsoredSection.isValid contract; never tests product names. */
public final class AdRules {
    public static boolean sponsored(Object section)throws Exception {
        if(section==null)return false;
        Object label=ModelAccess.field(section,"a");
        return Boolean.TRUE.equals(ModelAccess.field(section,"b")) || (label instanceof String && !((String)label).trim().isEmpty());
    }
}
