// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;
import android.content.res.Resources;
/** Morphe renames the resource package; binary-manifest-only builds did not. */
final class MapsResources {
    static int id(Resources r,String name,String type){
        int value=r.getIdentifier(name,type,"com.google.android.apps.maps.automotive");
        return value!=0?value:r.getIdentifier(name,type,"com.google.android.apps.maps");
    }
}
