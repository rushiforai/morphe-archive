package patches.maps.gearslip;

import android.content.Context;
import android.content.res.Resources;

/** The native SDK's finite policy resources, scoped to the app-owned car facade. */
public final class LocalCarUiResources {
    private LocalCarUiResources(){}
    public static boolean flag(String name){
        switch(name){
            case "gearhead_sdk_supports_window_insets":
            case "multi_display_car_ui_entry":
            case "multi_region_car_ui_entry":return true;
            default:throw new Resources.NotFoundException("Unknown Maps car SDK flag: "+name);
        }
    }
    public static int dimension(Context context,String name){
        int dp;
        switch(name){
            case "gearhead_sdk_drawer_header_height":dp=96;break;
            case "gearhead_sdk_toast_padding":dp=8;break;
            case "toast_y_offset":dp=60;break;
            default:throw new Resources.NotFoundException("Unknown Maps car SDK dimension: "+name);
        }
        // Matches Resources.getDimensionPixelOffset's truncation, rather than
        // getDimensionPixelSize's rounding, at the native SDK lookup boundary.
        return (int)(dp*context.getResources().getDisplayMetrics().density);
    }
}
