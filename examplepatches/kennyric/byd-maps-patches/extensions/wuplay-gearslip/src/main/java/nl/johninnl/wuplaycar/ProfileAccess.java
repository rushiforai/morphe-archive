package nl.johninnl.wuplaycar;
import java.util.Objects;
/** Unlock belongs to one native profile/key and one car session. */
public final class ProfileAccess {
    private String profile,key;private boolean unlocked,required;
    public synchronized boolean allowed(String nextProfile,String nextKey,boolean pinRequired) {
        if(nextProfile==null||nextKey==null||nextProfile.isEmpty()||nextKey.isEmpty()){clear();return false;}
        if(!Objects.equals(profile,nextProfile)||!Objects.equals(key,nextKey)||required!=pinRequired) {
            profile=nextProfile;key=nextKey;required=pinRequired;unlocked=false;
        }
        return !pinRequired||unlocked;
    }
    public synchronized boolean unlock(String expectedProfile,String expectedKey) {
        if(expectedProfile==null||expectedKey==null||expectedProfile.isEmpty()||expectedKey.isEmpty()||!Objects.equals(profile,expectedProfile)||!Objects.equals(key,expectedKey))return false;
        unlocked=true;return true;
    }
    public synchronized void clear(){profile=null;key=null;unlocked=false;required=false;}
}
