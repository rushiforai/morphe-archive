package app.johninnl.modelhost.api;
import android.content.*;
import android.net.Uri;
/** Launch only from a visible user action. The host confirms and verifies the import itself. */
public final class ProviderImportIntent {
    private ProviderImportIntent(){}
    public static Intent create(Context context,Uri uri,String modelId,String sha256,long bytes) {
        return create(new ComponentName(ModelHostClient.DEFAULT_PACKAGE,"app.johninnl.modelhost.setup.ModelSetupActivity"),uri,modelId,sha256,bytes);
    }
    public static Intent create(ComponentName setup,Uri uri,String modelId,String sha256,long bytes) {
        if(!"content".equals(uri.getScheme()) || bytes<=0 || !sha256.matches("[0-9a-f]{64}"))throw new IllegalArgumentException("Invalid import");
        Intent intent = new Intent().setComponent(setup).setData(uri).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION).putExtra("modelId",modelId).putExtra("sha256",sha256).putExtra("bytes",bytes);
        intent.setClipData(ClipData.newRawUri("Model import",uri));
        return intent;
    }
}
