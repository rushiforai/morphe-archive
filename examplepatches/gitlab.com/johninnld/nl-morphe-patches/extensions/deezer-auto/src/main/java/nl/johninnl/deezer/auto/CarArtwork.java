package nl.johninnl.deezer.auto;

import android.content.Context;
import android.net.Uri;
import android.support.v4.media.MediaDescriptionCompat;
import androidx.car.app.model.CarIcon;
import androidx.core.graphics.drawable.IconCompat;
import java.util.List;

final class CarArtwork {
    static CarIcon icon(Context context,MediaDescriptionCompat description){
        try{
            IconCompat image=null;
            if(description.getIconBitmap()!=null)image=IconCompat.createWithBitmap(description.getIconBitmap());
            else if(description.getIconUri()!=null){
                Uri uri=description.getIconUri();
                if("content".equals(uri.getScheme()))image=IconCompat.createWithContentUri(uri);
                else if("android.resource".equals(uri.getScheme())){
                    List<String> parts=uri.getPathSegments();int id=0;
                    if(parts.size()==2)id=context.getResources().getIdentifier(parts.get(1),parts.get(0),context.getPackageName());
                    else if(parts.size()==1)id=Integer.parseInt(parts.get(0));
                    if(id!=0)image=IconCompat.createWithResource(context,id);
                }
            }
            return image==null?null:new CarIcon.Builder(image).build();
        }catch(RuntimeException unavailable){return null;}
    }
    static boolean resource(MediaDescriptionCompat description){return description.getIconUri()!=null&&"android.resource".equals(description.getIconUri().getScheme());}
}
