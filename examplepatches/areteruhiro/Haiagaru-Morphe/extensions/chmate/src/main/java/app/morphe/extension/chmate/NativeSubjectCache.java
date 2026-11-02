package app.morphe.extension.chmate;
/** A cache-only HTTP miss is not a valid empty subject list. Native code closes the response first. */
public final class NativeSubjectCache {
    public static Object result(Object original,int status){return status>=200&&status<300?original:null;}
    private NativeSubjectCache(){}
}
