package ti;

import android.os.Bundle;
import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000Ì\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0011\n\u0002\u0010\t\n\u0002\b\u001a\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\"\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u000e\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u0006\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b=\n\u0002\u0018\u0002\n\u0002\b-\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b)\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u001f\b\u0007\u0018\u00002\u00020\u0001:\u0002ú\u0002R\u0016\u0010\u0005\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R$\u0010\u000b\u001a\u0012\u0012\u0004\u0012\u00020\u00070\u0006j\b\u0012\u0004\u0012\u00020\u0007`\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\nR\u0016\u0010\u000f\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\r\u0010\u000eR\u0018\u0010\u0011\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0010\u0010\u0004R\u0018\u0010\u0014\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0012\u0010\u0013R\u0018\u0010\u0016\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0015\u0010\u0004R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0017\u0010\u0004R\u0018\u0010\u001a\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0019\u0010\u0004R\u0016\u0010\u001e\u001a\u00020\u001b8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u001c\u0010\u001dR\u0016\u0010\"\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b \u0010!R\u0016\u0010$\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b#\u0010!R\u0016\u0010&\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b%\u0010!R\u0016\u0010(\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b'\u0010!R\u0018\u0010*\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b)\u0010\u0004R\u0018\u0010,\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b+\u0010\u0004R\u0018\u0010.\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b-\u0010\u0013R\u0018\u00100\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b/\u0010\u0013R\u0016\u00104\u001a\u0002018\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b2\u00103R*\u00106\u001a\u0016\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0006j\n\u0012\u0004\u0012\u00020\u0002\u0018\u0001`\b8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b5\u0010\nR\u0018\u00109\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b7\u00108R\u0018\u0010;\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b:\u00108R\u0018\u0010=\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b<\u00108R\u0018\u0010?\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b>\u00108R\u0018\u0010A\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b@\u00108R\u0018\u0010C\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bB\u00108R\u0018\u0010E\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bD\u00108R\u0018\u0010G\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bF\u00108R\u0016\u0010I\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bH\u0010!R\u0018\u0010K\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bJ\u00108R\u0018\u0010O\u001a\u0004\u0018\u00010L8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bM\u0010NR\u0016\u0010Q\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bP\u0010\u000eR\u0016\u0010R\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u001d\u0010\u000eR\u0018\u0010T\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bS\u0010\u0004R\u0018\u0010V\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bU\u0010\u0004R\u001e\u0010Y\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010W8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b!\u0010XR$\u0010\\\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0002\u0018\u00010Z8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b3\u0010[R\u0018\u0010^\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b]\u0010\u0004R\u0016\u0010`\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b_\u0010!R\u0018\u0010b\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\ba\u0010\u0004R\u0018\u0010d\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bc\u0010\u0004R\u0016\u0010f\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\be\u0010\u0004R$\u0010h\u001a\u0012\u0012\u0004\u0012\u00020\u00020\u0006j\b\u0012\u0004\u0012\u00020\u0002`\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bg\u0010\nR \u0010l\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020j0i8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bk\u0010[R\u0018\u0010n\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bm\u0010\u0013R$\u0010p\u001a\u0012\u0012\u0004\u0012\u00020\u00020\u0006j\b\u0012\u0004\u0012\u00020\u0002`\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bo\u0010\nR\u0014\u0010t\u001a\u00020q8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\br\u0010sR\u0018\u0010x\u001a\u0004\u0018\u00010u8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\bv\u0010wR\u0016\u0010z\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\by\u0010!R\u0016\u0010|\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b{\u0010\u000eR\u0016\u0010~\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b}\u0010\u000eR\u0017\u0010\u0080\u0001\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u007f\u0010!R\u0019\u0010\u0081\u0001\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u000e\u00108R\u001a\u0010\u0083\u0001\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0082\u0001\u00108R\u001c\u0010\u0087\u0001\u001a\u0005\u0018\u00010\u0084\u00018\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\b\u0085\u0001\u0010\u0086\u0001R\u0018\u0010\u0089\u0001\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0088\u0001\u0010!R\u0018\u0010\u008b\u0001\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u008a\u0001\u0010!R\u0018\u0010\u008d\u0001\u001a\u00020\u001b8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u008c\u0001\u0010\u001dR\u0018\u0010\u008f\u0001\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u008e\u0001\u0010\u000eR\u0018\u0010\u0093\u0001\u001a\u00030\u0090\u00018\u0006X\u0087\u0004¢\u0006\b\n\u0006\b\u0091\u0001\u0010\u0092\u0001R\u0018\u0010\u0095\u0001\u001a\u0002018\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0094\u0001\u00103R\u001a\u0010\u0097\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0096\u0001\u0010\u0004R\u001c\u0010\u009b\u0001\u001a\u0005\u0018\u00010\u0098\u00018\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\b\u0099\u0001\u0010\u009a\u0001R\u001a\u0010\u009d\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u009c\u0001\u0010\u0004R\u001a\u0010\u009f\u0001\u001a\u0004\u0018\u00010L8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u009e\u0001\u0010NR\u001a\u0010£\u0001\u001a\u00030 \u00018\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\b¡\u0001\u0010¢\u0001R\u001a\u0010¥\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¤\u0001\u0010\u0004R\u001a\u0010§\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¦\u0001\u0010\u0004R\u001a\u0010©\u0001\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¨\u0001\u0010\u0013R\u0018\u0010«\u0001\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bª\u0001\u0010!R\u0018\u0010\u00ad\u0001\u001a\u00020\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¬\u0001\u0010!R\u001a\u0010¯\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b®\u0001\u0010\u0004R\u001a\u0010±\u0001\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b°\u0001\u00108R\u001a\u0010³\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b²\u0001\u0010\u0004R\u001a\u0010µ\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b´\u0001\u0010\u0004R\u001a\u0010·\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¶\u0001\u0010\u0004R\u0018\u0010¹\u0001\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¸\u0001\u0010\u0004R\u001a\u0010»\u0001\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bº\u0001\u00108R\u001a\u0010½\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¼\u0001\u0010\u0004R\u001a\u0010¿\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¾\u0001\u0010\u0004R\u001a\u0010Á\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÀ\u0001\u0010\u0004R\u001a\u0010Ã\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÂ\u0001\u0010\u0004R\u001a\u0010Å\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÄ\u0001\u0010\u0004R\u001a\u0010Ç\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÆ\u0001\u0010\u0004R\u001a\u0010É\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÈ\u0001\u0010\u0004R\u001a\u0010Ë\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÊ\u0001\u0010\u0004R\u001a\u0010Í\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÌ\u0001\u0010\u0004R\u001a\u0010Ï\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÎ\u0001\u0010\u0004R\u001a\u0010Ñ\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÐ\u0001\u0010\u0004R\u0018\u0010Ó\u0001\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÒ\u0001\u0010\u0004R\u0016\u0010Õ\u0001\u001a\u00020\f8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bÔ\u0001\u0010\u000eR\u0018\u0010×\u0001\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÖ\u0001\u0010\u000eR\u001a\u0010Ù\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bØ\u0001\u0010\u0004R\u001a\u0010Û\u0001\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÚ\u0001\u00108R\u001a\u0010Ý\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÜ\u0001\u0010\u0004R\u0018\u0010á\u0001\u001a\u00030Þ\u00018\u0006X\u0087\u0004¢\u0006\b\n\u0006\bß\u0001\u0010à\u0001R\u001a\u0010ã\u0001\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bâ\u0001\u0010\u0013R\u001a\u0010å\u0001\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bä\u0001\u0010\u0013R\u001a\u0010ç\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bæ\u0001\u0010\u0004R\u001a\u0010é\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bè\u0001\u0010\u0004R\u001a\u0010ë\u0001\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bê\u0001\u0010\u0013R\u0018\u0010í\u0001\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bì\u0001\u0010\u000eR\u001a\u0010ï\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bî\u0001\u0010\u0004R\u001a\u0010ñ\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bð\u0001\u0010\u0004R&\u0010ó\u0001\u001a\u0012\u0012\u0004\u0012\u00020\u00020\u0006j\b\u0012\u0004\u0012\u00020\u0002`\b8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bò\u0001\u0010\nR\u001a\u0010õ\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bô\u0001\u0010\u0004R\u001a\u0010÷\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bö\u0001\u0010\u0004R\u001a\u0010ù\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bø\u0001\u0010\u0004R\u001a\u0010û\u0001\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bú\u0001\u0010\u0013R\u001a\u0010ý\u0001\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bü\u0001\u00108R\u001a\u0010ÿ\u0001\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bþ\u0001\u0010\u0004R\u001a\u0010\u0081\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0080\u0002\u00108R\u001a\u0010\u0083\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0082\u0002\u00108R\u001a\u0010\u0085\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0084\u0002\u00108R\u001a\u0010\u0087\u0002\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0086\u0002\u0010\u0004R\u001a\u0010\u0089\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0088\u0002\u0010\u0013R\u001a\u0010\u008b\u0002\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u008a\u0002\u0010\u0004R\u001c\u0010\u008f\u0002\u001a\u0005\u0018\u00010\u008c\u00028\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\b\u008d\u0002\u0010\u008e\u0002R\u001c\u0010\u0091\u0002\u001a\u0005\u0018\u00010 \u00018\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\b\u0090\u0002\u0010¢\u0001R\u001a\u0010\u0093\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u0092\u0002\u00108R\"\u0010\u0097\u0002\u001a\u000b\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0094\u00028\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\b\u0095\u0002\u0010\u0096\u0002R\"\u0010\u0099\u0002\u001a\u000b\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0094\u00028\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\b\u0098\u0002\u0010\u0096\u0002R\u001a\u0010\u009b\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u009a\u0002\u0010\u0013R\u001a\u0010\u009d\u0002\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u009c\u0002\u0010\u0004R\u001a\u0010\u009f\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b\u009e\u0002\u0010\u0013R\u001a\u0010¡\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b \u0002\u0010\u0013R\u001a\u0010£\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¢\u0002\u00108R\u001a\u0010¥\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¤\u0002\u0010\u0013R\u001c\u0010©\u0002\u001a\u0005\u0018\u00010¦\u00028\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\b§\u0002\u0010¨\u0002R\u001a\u0010«\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bª\u0002\u0010\u0013R\u001a\u0010\u00ad\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¬\u0002\u00108R\u001a\u0010¯\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b®\u0002\u00108R\u001a\u0010±\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b°\u0002\u0010\u0013R\u001a\u0010³\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b²\u0002\u0010\u0013R\u001a\u0010µ\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b´\u0002\u0010\u0013R\u001a\u0010·\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¶\u0002\u00108R\u001a\u0010¹\u0002\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¸\u0002\u0010\u0004R\u001a\u0010»\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bº\u0002\u0010\u0013R\u001a\u0010½\u0002\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¼\u0002\u0010\u0004R\u001a\u0010¿\u0002\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\b¾\u0002\u0010\u0004R\u001a\u0010Á\u0002\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÀ\u0002\u0010\u0004R\u001a\u0010Ã\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÂ\u0002\u0010\u0013R\u001a\u0010Å\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÄ\u0002\u00108R\u001a\u0010Ç\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÆ\u0002\u00108R&\u0010É\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0002\u0018\u00010Z8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÈ\u0002\u0010[R\u001a\u0010Ë\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÊ\u0002\u0010\u0013R\u001a\u0010Í\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÌ\u0002\u00108R\u001a\u0010Ï\u0002\u001a\u0004\u0018\u00010L8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÎ\u0002\u0010NR\u001c\u0010Ó\u0002\u001a\u0005\u0018\u00010Ð\u00028\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\bÑ\u0002\u0010Ò\u0002R&\u0010Õ\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0002\u0018\u00010Z8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÔ\u0002\u0010[R\u001a\u0010×\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bÖ\u0002\u00108R\u001c\u0010Û\u0002\u001a\u0005\u0018\u00010Ø\u00028\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\bÙ\u0002\u0010Ú\u0002R\u001c\u0010ß\u0002\u001a\u0005\u0018\u00010Ü\u00028\u0006@\u0006X\u0087\u000e¢\u0006\b\n\u0006\bÝ\u0002\u0010Þ\u0002R*\u0010å\u0002\u001a\u0004\u0018\u0001018\u0006@\u0006X\u0087\u000e¢\u0006\u0017\n\u0006\bà\u0002\u0010á\u0002\u001a\u0006\bâ\u0002\u0010ã\u0002\"\u0005\b\u0003\u0010ä\u0002R)\u0010ç\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0016\n\u0005\bæ\u0002\u00108\u001a\u0006\bç\u0002\u0010è\u0002\"\u0005\b\r\u0010é\u0002R)\u0010ë\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0016\n\u0005\bê\u0002\u0010\u0013\u001a\u0006\bë\u0002\u0010ì\u0002\"\u0005\b\t\u0010í\u0002R\u001a\u0010ï\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bî\u0002\u0010\u0013R\u001a\u0010ñ\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bð\u0002\u00108R\u001a\u0010ó\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bò\u0002\u00108R\u001a\u0010õ\u0002\u001a\u0004\u0018\u00010\u001f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bô\u0002\u00108R\u001a\u0010÷\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bö\u0002\u0010\u0013R\u001a\u0010ù\u0002\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0007\n\u0005\bø\u0002\u0010\u0013¨\u0006û\u0002"}, d2 = {"Lti/p;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/String;", "adIdPermission", "Ljava/util/ArrayList;", "Lti/a;", "Lkotlin/collections/ArrayList;", "b", "Ljava/util/ArrayList;", "adSizeArray", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "c", "Z", "isGreaterThanMaxAllowedBannerSize", "d", "responsiveAutoFormat", "e", "Ljava/lang/Boolean;", "adaptiveSlot", InneractiveMediationDefs.GENDER_FEMALE, "format", "g", "fluidType", "h", "multipleAdSizeString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "i", "F", "screenDensity", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "j", "I", "screenWidth", "k", "screenHeight", "l", "screenWidthDip", InneractiveMediationDefs.GENDER_MALE, "screenHeightDip", "n", "orientation", "o", "adUnitId", "p", "isRewarded", "q", "isRewardedInterstitial", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "r", "J", "requestTimeMilliseconds", "s", "keywords", "t", "Ljava/lang/Integer;", "safeAreaMarginLeftDip", "u", "safeAreaMarginTopDip", "v", "safeAreaMarginRightDip", "w", "safeAreaMarginBottomDip", "x", "roundedCornerTopLeftDip", "y", "roundedCornerTopRightDip", "z", "roundedCornerBottomLeftDip", "A", "roundedCornerBottomRightDip", "B", "tagForChildDirectedTreatment", "C", "tagForAgeTreatment", "Lcom/google/gson/r;", "D", "Lcom/google/gson/r;", "csrbEcoData", "E", "isTestRequest", "manualImpressionsEnabled", "G", "publisherProvidedId", "H", "contentUrl", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/util/Set;", "neighboringContentUrls", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/util/Map;", "customTargeting", "K", "requestAgent", "L", "tagForUnderAgeOfConsent", "M", "maxAdContentRating", "N", "adResponseEncryptionKey", "O", "adShieldSignal", "P", "adTypes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lti/c;", "Q", "adapterVersionData", "R", "appSwitched", "S", "grantedPermissions", "Lti/l;", "T", "Lti/l;", "personallyIdentifiableInformation", "Lti/n;", "U", "Lti/n;", "qualitySignals", "V", "audioMode", "W", "isMusicActive", "X", "isSpeakerPhoneOn", "Y", "musicVolume", "minMusicVolume", "a0", "maxMusicVolume", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b0", "Ljava/lang/Double;", "musicVolumePercent", "c0", "ringerMode", "d0", "ringerVolume", "e0", "appVolume", "f0", "isAppMuted", "Lti/h;", "g0", "Lti/h;", "deviceSignals", "h0", "timeSinceCldUpdate", "i0", "adUnitRequestSignals", "Lcom/google/gson/m;", "j0", "Lcom/google/gson/m;", "adUnitRequestSignalsObject", "k0", "commonCldSignals", "l0", "commonCldSignalsObject", "Landroid/os/Bundle;", "m0", "Landroid/os/Bundle;", "sharedPreferenceSignals", "n0", "creativeToken", "o0", "debugSignalsEnabled", "p0", "shouldCollectAdResponseLogs", "q0", "testMode", "r0", "linkedDevice", "s0", "inspectorExtras", "t0", "requestServerData", "u0", "omidVersion", "v0", "clientOmidVersion", "w0", "omidPartnerName", "x0", "packageName", "y0", "versionCode", "z0", "appName", "A0", "versionName", "B0", "displayLabel", "C0", "requestId", "D0", "realTimeBiddingSignals", "F0", "gmpAppId", "G0", "appInstanceId", "H0", "adEventId", "I0", "appIdOrigin", "J0", "appWebPropertyCode", "K0", "applicationCode", "L0", "afmaVersion", "M0", "isNonagon", "N0", "isDecagon", "O0", "additionalCapabilities", "P0", "targetApi", "Q0", "granularVersion", "Lti/o;", "R0", "Lti/o;", "sdkEnvironment", "S0", "canOpenGeo", "T0", "canOpenHttp", "U0", "countryCode", "V0", "deviceCountryCode", "W0", "isEmulator", "X0", "isLatchskyDevice", "Y0", "languageCode", "Z0", "clientLanguageCode", "a1", "languageCodeList", "b1", "deviceLanguageCode", "c1", "marketVersion", "d1", "submodel", "e1", "isBattlestarDevice", "f1", "buildApiLevel", "g1", "carrierCode", "h1", "networkTypeCoarse", "i1", "networkTypeFine", "j1", "phoneType", "k1", "experimentIds", "l1", "transparentBackgroundSupported", "m1", "sessionId", "Lti/b;", "n1", "Lti/b;", "adUnitQualitySignals", "o1", "googleExtrasBundle", "p1", "nativeVersion", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "q1", "Ljava/util/List;", "nativeTemplates", "r1", "nativeCustomTemplates", "s1", "enableNativeMediaOrientation", "t1", "nativeMediaOrientation", "u1", "customMuteThisAdRequested", com.moloco.sdk.internal.services.init.i.f38066a, "customClickGestureEnabled", "w1", "customClickGestureDirection", "x1", "customClickGestureAllowTaps", "Lti/q;", "y1", "Lti/q;", "videoOptionsSignal", "z1", "isImageLoadingDisabled", "A1", "adChoicesPlacement", "B1", "numberOfRegisteredWebViews", "C1", "isBannerRefreshRequest", "D1", "isIconAdRequest", "E1", "isPictureInPictureAdRequest", "F1", "iconAdPlacement", "G1", "correlator", "H1", "usesMediaView", "I1", "installerPackage", "J1", "initiatorPackage", "K1", "signalType", "L1", "isScarRequest", "M1", "publisherPrivacyPersonalizationState", "N1", "isHsdpSupported", "O1", "preProcessedSignals", "P1", "isPrefetchRequest", "Q1", "displayCount", "R1", "localSignals", "Lqi/a;", "S1", "Lqi/a;", "parentAdConfig", "T1", "inMemorySdkCoreData", "U1", "numberOfAdsRequested", "Lti/g;", "V1", "Lti/g;", "clientRequestBuildingData", "Lqi/b;", "W1", "Lqi/b;", "parentCommonConfig", "X1", "Ljava/lang/Long;", "getTimeSinceSdkInitMs", "()Ljava/lang/Long;", "(Ljava/lang/Long;)V", "timeSinceSdkInitMs", "Y1", "isS2SRecursiveRequest", "()Ljava/lang/Integer;", "(Ljava/lang/Integer;)V", "Z1", "isAdapterInitConfigSet", "()Ljava/lang/Boolean;", "(Ljava/lang/Boolean;)V", "a2", "isSwipeableInterstitial", "b2", "maxScreenHoldDurationSeconds", "c2", "maxSlotWidth", "d2", "maxSlotHeight", "e2", "persistentCacheRequest", "f2", "crossProcessRequest", "ads_mobile_sdk/x93", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final class p {

    /* renamed from: A, reason: from kotlin metadata */
    @gn.c("rc_br")
    @JvmField
    @Nullable
    public Integer roundedCornerBottomRightDip;

    /* renamed from: A0, reason: from kotlin metadata */
    @gn.c("vnm")
    @JvmField
    @Nullable
    public String versionName;

    /* renamed from: A1, reason: from kotlin metadata */
    @gn.c("preferred_ad_choices_position")
    @JvmField
    @Nullable
    public Integer adChoicesPlacement;

    /* renamed from: B, reason: from kotlin metadata */
    @gn.c("tag_for_child_directed_treatment")
    @JvmField
    public int tagForChildDirectedTreatment;

    /* renamed from: B0, reason: from kotlin metadata */
    @gn.c("dl")
    @JvmField
    @Nullable
    public String displayLabel;

    /* renamed from: B1, reason: from kotlin metadata */
    @gn.c("nrwv")
    @JvmField
    @Nullable
    public Integer numberOfRegisteredWebViews;

    /* renamed from: C, reason: from kotlin metadata */
    @gn.c("tfat")
    @JvmField
    @Nullable
    public Integer tagForAgeTreatment;

    /* renamed from: C0, reason: from kotlin metadata */
    @gn.c("request_id")
    @JvmField
    @Nullable
    public String requestId;

    /* renamed from: C1, reason: from kotlin metadata */
    @gn.c("ibrr")
    @JvmField
    @Nullable
    public Boolean isBannerRefreshRequest;

    /* renamed from: D, reason: from kotlin metadata */
    @gn.c("eco")
    @JvmField
    @Nullable
    public com.google.gson.r csrbEcoData;

    /* renamed from: D0, reason: from kotlin metadata */
    @gn.c("rtb")
    @JvmField
    @Nullable
    public String realTimeBiddingSignals;

    /* renamed from: D1, reason: from kotlin metadata */
    @gn.c("iconad")
    @JvmField
    @Nullable
    public Boolean isIconAdRequest;

    /* renamed from: E, reason: from kotlin metadata */
    @gn.c("test_request")
    @JvmField
    public boolean isTestRequest;
    public List E0;

    /* renamed from: E1, reason: from kotlin metadata */
    @gn.c("picture_in_picture")
    @JvmField
    @Nullable
    public Boolean isPictureInPictureAdRequest;

    /* renamed from: F, reason: from kotlin metadata */
    @gn.c("d_imp_hdr")
    @JvmField
    public boolean manualImpressionsEnabled;

    /* renamed from: F0, reason: from kotlin metadata */
    @gn.c("gmp_app_id")
    @JvmField
    @Nullable
    public String gmpAppId;

    /* renamed from: F1, reason: from kotlin metadata */
    @gn.c("iconad_placement")
    @JvmField
    @Nullable
    public Integer iconAdPlacement;

    /* renamed from: G, reason: from kotlin metadata */
    @gn.c("ppid")
    @JvmField
    @Nullable
    public String publisherProvidedId;

    /* renamed from: G0, reason: from kotlin metadata */
    @gn.c("fbs_aiid")
    @JvmField
    @Nullable
    public String appInstanceId;

    /* renamed from: G1, reason: from kotlin metadata */
    @gn.c("correlation_id")
    @JvmField
    @Nullable
    public String correlator;

    /* renamed from: H, reason: from kotlin metadata */
    @gn.c(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL)
    @JvmField
    @Nullable
    public String contentUrl;

    /* renamed from: H0, reason: from kotlin metadata */
    @gn.c("fbs_aeid")
    @JvmField
    @Nullable
    public String adEventId;

    /* renamed from: H1, reason: from kotlin metadata */
    @gn.c("uses_media_view")
    @JvmField
    @Nullable
    public Boolean usesMediaView;

    /* renamed from: I, reason: from kotlin metadata */
    @gn.c("neighboring_content_urls")
    @JvmField
    @Nullable
    public Set<String> neighboringContentUrls;

    /* renamed from: I0, reason: from kotlin metadata */
    @gn.c("apm_id_origin")
    @JvmField
    @Nullable
    public String appIdOrigin;

    /* renamed from: I1, reason: from kotlin metadata */
    @gn.c("ins_pn")
    @JvmField
    @Nullable
    public String installerPackage;

    /* renamed from: J, reason: from kotlin metadata */
    @gn.c("custom_targeting")
    @JvmField
    @Nullable
    public Map<String, String> customTargeting;

    /* renamed from: J0, reason: from kotlin metadata */
    @gn.c("app_wp_code")
    @JvmField
    @Nullable
    public String appWebPropertyCode;

    /* renamed from: J1, reason: from kotlin metadata */
    @gn.c("ini_pn")
    @JvmField
    @Nullable
    public String initiatorPackage;

    /* renamed from: K, reason: from kotlin metadata */
    @gn.c("request_agent")
    @JvmField
    @Nullable
    public String requestAgent;

    /* renamed from: K0, reason: from kotlin metadata */
    @gn.c("app_code")
    @JvmField
    @Nullable
    public String applicationCode;

    /* renamed from: K1, reason: from kotlin metadata */
    @gn.c("signal_type")
    @JvmField
    @Nullable
    public String signalType;

    /* renamed from: L, reason: from kotlin metadata */
    @gn.c("tag_for_under_age_of_consent")
    @JvmField
    public int tagForUnderAgeOfConsent;

    /* renamed from: L0, reason: from kotlin metadata */
    @gn.c("js")
    @JvmField
    @NotNull
    public String afmaVersion;

    /* renamed from: L1, reason: from kotlin metadata */
    @gn.c("scar")
    @JvmField
    @Nullable
    public Boolean isScarRequest;

    /* renamed from: M, reason: from kotlin metadata */
    @gn.c("max_ad_content_rating")
    @JvmField
    @Nullable
    public String maxAdContentRating;

    /* renamed from: M0, reason: from kotlin metadata */
    @gn.c("is_nonagon")
    @JvmField
    public final boolean isNonagon;

    /* renamed from: M1, reason: from kotlin metadata */
    @gn.c("ppt_p13n")
    @JvmField
    @Nullable
    public Integer publisherPrivacyPersonalizationState;

    /* renamed from: N, reason: from kotlin metadata */
    @gn.c("arek")
    @JvmField
    @Nullable
    public String adResponseEncryptionKey;

    /* renamed from: N0, reason: from kotlin metadata */
    @gn.c("is_decagon")
    @JvmField
    public boolean isDecagon;

    /* renamed from: N1, reason: from kotlin metadata */
    @gn.c("lft")
    @JvmField
    @Nullable
    public Integer isHsdpSupported;

    /* renamed from: O, reason: from kotlin metadata */
    @gn.c("ms")
    @JvmField
    @NotNull
    public String adShieldSignal;

    /* renamed from: O0, reason: from kotlin metadata */
    @gn.c("extra_caps")
    @JvmField
    @Nullable
    public String additionalCapabilities;

    /* renamed from: O1, reason: from kotlin metadata */
    @gn.c("p_signals")
    @JvmField
    @Nullable
    public Map<String, String> preProcessedSignals;

    /* renamed from: P, reason: from kotlin metadata */
    @gn.c("ad_types")
    @JvmField
    @NotNull
    public final ArrayList<String> adTypes;

    /* renamed from: P0, reason: from kotlin metadata */
    @gn.c("target_api")
    @JvmField
    @Nullable
    public Integer targetApi;

    /* renamed from: P1, reason: from kotlin metadata */
    @gn.c("is_sdk_preload")
    @JvmField
    @Nullable
    public Boolean isPrefetchRequest;

    /* renamed from: Q, reason: from kotlin metadata */
    @gn.c("installed_adapter_data")
    @JvmField
    @NotNull
    public final Map<String, c> adapterVersionData;

    /* renamed from: Q0, reason: from kotlin metadata */
    @gn.c("ev")
    @JvmField
    @Nullable
    public String granularVersion;

    /* renamed from: Q1, reason: from kotlin metadata */
    @gn.c("dspct")
    @JvmField
    @Nullable
    public Integer displayCount;

    /* renamed from: R, reason: from kotlin metadata */
    @gn.c("app_switched")
    @JvmField
    @Nullable
    public Boolean appSwitched;

    /* renamed from: R0, reason: from kotlin metadata */
    @gn.c("sdk_env")
    @JvmField
    @NotNull
    public final o sdkEnvironment;

    /* renamed from: R1, reason: from kotlin metadata */
    @gn.c("l_signals")
    @JvmField
    @Nullable
    public com.google.gson.r localSignals;

    /* renamed from: S, reason: from kotlin metadata */
    @gn.c("android_permissions")
    @JvmField
    @NotNull
    public final ArrayList<String> grantedPermissions;

    /* renamed from: S0, reason: from kotlin metadata */
    @gn.c("cog")
    @JvmField
    @Nullable
    public Boolean canOpenGeo;

    /* renamed from: S1, reason: from kotlin metadata */
    @gn.c("parent_ad_config")
    @JvmField
    @Nullable
    public qi.a parentAdConfig;

    /* renamed from: T, reason: from kotlin metadata */
    @gn.c("pii")
    @JvmField
    @NotNull
    public final l personallyIdentifiableInformation;

    /* renamed from: T0, reason: from kotlin metadata */
    @gn.c("coh")
    @JvmField
    @Nullable
    public Boolean canOpenHttp;

    /* renamed from: T1, reason: from kotlin metadata */
    @gn.c("m_state")
    @JvmField
    @Nullable
    public Map<String, String> inMemorySdkCoreData;

    /* renamed from: U, reason: from kotlin metadata */
    @gn.c("quality_signals")
    @JvmField
    @Nullable
    public n qualitySignals;

    /* renamed from: U0, reason: from kotlin metadata */
    @gn.c("gl")
    @JvmField
    @Nullable
    public String countryCode;

    /* renamed from: U1, reason: from kotlin metadata */
    @gn.c("max_num_ads")
    @JvmField
    @Nullable
    public Integer numberOfAdsRequested;

    /* renamed from: V, reason: from kotlin metadata */
    @gn.c("am")
    @JvmField
    public int audioMode;

    /* renamed from: V0, reason: from kotlin metadata */
    @gn.c("dgl")
    @JvmField
    @Nullable
    public String deviceCountryCode;

    /* renamed from: V1, reason: from kotlin metadata */
    @gn.c("csrb_output")
    @JvmField
    @Nullable
    public g clientRequestBuildingData;

    /* renamed from: W, reason: from kotlin metadata */
    @gn.c("ma")
    @JvmField
    public boolean isMusicActive;

    /* renamed from: W0, reason: from kotlin metadata */
    @gn.c("simulator")
    @JvmField
    @Nullable
    public Boolean isEmulator;

    /* renamed from: W1, reason: from kotlin metadata */
    @gn.c("parent_common_config")
    @JvmField
    @Nullable
    public qi.b parentCommonConfig;

    /* renamed from: X, reason: from kotlin metadata */
    @gn.c("sp")
    @JvmField
    public boolean isSpeakerPhoneOn;

    /* renamed from: X0, reason: from kotlin metadata */
    @gn.c("is_latchsky")
    @JvmField
    public boolean isLatchskyDevice;

    /* renamed from: X1, reason: from kotlin metadata */
    @gn.c("tsi")
    @Nullable
    private Long timeSinceSdkInitMs;

    /* renamed from: Y, reason: from kotlin metadata */
    @gn.c("muv")
    @JvmField
    public int musicVolume;

    /* renamed from: Y0, reason: from kotlin metadata */
    @gn.c("hl")
    @JvmField
    @Nullable
    public String languageCode;

    /* renamed from: Y1, reason: from kotlin metadata */
    @gn.c("s2s_rr")
    @Nullable
    private Integer isS2SRecursiveRequest;

    /* renamed from: Z, reason: from kotlin metadata */
    @gn.c("muv_min")
    @JvmField
    @Nullable
    public Integer minMusicVolume;

    /* renamed from: Z0, reason: from kotlin metadata */
    @gn.c("client_hl")
    @JvmField
    @Nullable
    public String clientLanguageCode;

    /* renamed from: Z1, reason: from kotlin metadata */
    @gn.c("ic")
    @Nullable
    private Boolean isAdapterInitConfigSet;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("adid_p")
    @JvmField
    @NotNull
    public String adIdPermission;

    /* renamed from: a0, reason: collision with root package name and from kotlin metadata */
    @gn.c("muv_max")
    @JvmField
    @Nullable
    public Integer maxMusicVolume;

    /* renamed from: a1, reason: collision with root package name and from kotlin metadata */
    @gn.c("hl_list")
    @JvmField
    @NotNull
    public final ArrayList<String> languageCodeList;

    /* renamed from: a2, reason: collision with root package name and from kotlin metadata */
    @gn.c("isi")
    @JvmField
    @Nullable
    public Boolean isSwipeableInterstitial;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("valid_ad_sizes")
    @JvmField
    @NotNull
    public final ArrayList<a> adSizeArray;

    /* renamed from: b0, reason: collision with root package name and from kotlin metadata */
    @gn.c("muv_percent")
    @JvmField
    @Nullable
    public Double musicVolumePercent;

    /* renamed from: b1, reason: collision with root package name and from kotlin metadata */
    @gn.c("dlc")
    @JvmField
    @Nullable
    public String deviceLanguageCode;

    /* renamed from: b2, reason: collision with root package name and from kotlin metadata */
    @gn.c("max_shd_s")
    @JvmField
    @Nullable
    public Integer maxScreenHoldDurationSeconds;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("is_greater_than_max_allowed_banner_size")
    @JvmField
    public boolean isGreaterThanMaxAllowedBannerSize;

    /* renamed from: c0, reason: collision with root package name and from kotlin metadata */
    @gn.c("rm")
    @JvmField
    public int ringerMode;

    /* renamed from: c1, reason: collision with root package name and from kotlin metadata */
    @gn.c("mv")
    @JvmField
    @Nullable
    public String marketVersion;

    /* renamed from: c2, reason: collision with root package name and from kotlin metadata */
    @gn.c("max_w")
    @JvmField
    @Nullable
    public Integer maxSlotWidth;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("rafmt")
    @JvmField
    @Nullable
    public String responsiveAutoFormat;

    /* renamed from: d0, reason: collision with root package name and from kotlin metadata */
    @gn.c("riv")
    @JvmField
    public int ringerVolume;

    /* renamed from: d1, reason: collision with root package name and from kotlin metadata */
    @gn.c("submodel")
    @JvmField
    @Nullable
    public String submodel;

    /* renamed from: d2, reason: collision with root package name and from kotlin metadata */
    @gn.c("max_h")
    @JvmField
    @Nullable
    public Integer maxSlotHeight;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @gn.c("inline_adaptive_slot")
    @JvmField
    @Nullable
    public Boolean adaptiveSlot;

    /* renamed from: e0, reason: collision with root package name and from kotlin metadata */
    @gn.c("android_app_volume")
    @JvmField
    public float appVolume;

    /* renamed from: e1, reason: collision with root package name and from kotlin metadata */
    @gn.c("is_bstar")
    @JvmField
    @Nullable
    public Boolean isBattlestarDevice;

    /* renamed from: e2, reason: collision with root package name and from kotlin metadata */
    @gn.c("pcr")
    @JvmField
    @Nullable
    public Boolean persistentCacheRequest;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    @gn.c("format")
    @JvmField
    @Nullable
    public String format;

    /* renamed from: f0, reason: collision with root package name and from kotlin metadata */
    @gn.c("android_app_muted")
    @JvmField
    public boolean isAppMuted;

    /* renamed from: f1, reason: collision with root package name and from kotlin metadata */
    @gn.c("build_api_level")
    @JvmField
    @Nullable
    public Integer buildApiLevel;

    /* renamed from: f2, reason: collision with root package name and from kotlin metadata */
    @gn.c("cpr")
    @JvmField
    @Nullable
    public Boolean crossProcessRequest;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @gn.c("fluid")
    @JvmField
    @Nullable
    public String fluidType;

    /* renamed from: g0, reason: collision with root package name and from kotlin metadata */
    @gn.c("device")
    @JvmField
    @NotNull
    public final h deviceSignals;

    /* renamed from: g1, reason: from kotlin metadata */
    @gn.c(TrackingOptions.AMP_TRACKING_OPTION_CARRIER)
    @JvmField
    @Nullable
    public String carrierCode;

    /* renamed from: h, reason: collision with root package name and from kotlin metadata */
    @gn.c("sz")
    @JvmField
    @Nullable
    public String multipleAdSizeString;

    /* renamed from: h0, reason: collision with root package name and from kotlin metadata */
    @gn.c("cldut")
    @JvmField
    public long timeSinceCldUpdate;

    /* renamed from: h1, reason: from kotlin metadata */
    @gn.c("cnt")
    @JvmField
    @Nullable
    public Integer networkTypeCoarse;

    /* renamed from: i, reason: collision with root package name and from kotlin metadata */
    @gn.c("u_sd")
    @JvmField
    public float screenDensity;

    /* renamed from: i0, reason: collision with root package name and from kotlin metadata */
    @gn.c("fwd_cld")
    @JvmField
    @Nullable
    public String adUnitRequestSignals;

    /* renamed from: i1, reason: from kotlin metadata */
    @gn.c("gnt")
    @JvmField
    @Nullable
    public Integer networkTypeFine;

    /* renamed from: j, reason: collision with root package name and from kotlin metadata */
    @gn.c("sw")
    @JvmField
    public int screenWidth;

    /* renamed from: j0, reason: collision with root package name and from kotlin metadata */
    @gn.c("fwd_cld_obj")
    @JvmField
    @Nullable
    public com.google.gson.m adUnitRequestSignalsObject;

    /* renamed from: j1, reason: collision with root package name and from kotlin metadata */
    @gn.c("pt")
    @JvmField
    @Nullable
    public Integer phoneType;

    /* renamed from: k, reason: collision with root package name and from kotlin metadata */
    @gn.c("sh")
    @JvmField
    public int screenHeight;

    /* renamed from: k0, reason: collision with root package name and from kotlin metadata */
    @gn.c("fwd_common_cld")
    @JvmField
    @Nullable
    public String commonCldSignals;

    /* renamed from: k1, reason: collision with root package name and from kotlin metadata */
    @gn.c("eid")
    @JvmField
    @Nullable
    public String experimentIds;

    /* renamed from: l, reason: collision with root package name and from kotlin metadata */
    @gn.c("u_w")
    @JvmField
    public int screenWidthDip;

    /* renamed from: l0, reason: collision with root package name and from kotlin metadata */
    @gn.c("fwd_common_cld_obj")
    @JvmField
    @Nullable
    public com.google.gson.r commonCldSignalsObject;

    /* renamed from: l1, reason: collision with root package name and from kotlin metadata */
    @gn.c("support_transparent_background")
    @JvmField
    @Nullable
    public Boolean transparentBackgroundSupported;

    /* renamed from: m, reason: collision with root package name and from kotlin metadata */
    @gn.c("u_h")
    @JvmField
    public int screenHeightDip;

    /* renamed from: m0, reason: collision with root package name and from kotlin metadata */
    @gn.c("shared_pref")
    @JvmField
    @NotNull
    public Bundle sharedPreferenceSignals;

    /* renamed from: m1, reason: collision with root package name and from kotlin metadata */
    @gn.c(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID)
    @JvmField
    @Nullable
    public String sessionId;

    /* renamed from: n, reason: from kotlin metadata */
    @gn.c("u_so")
    @JvmField
    @Nullable
    public String orientation;

    /* renamed from: n0, reason: collision with root package name and from kotlin metadata */
    @gn.c("gct")
    @JvmField
    @Nullable
    public String creativeToken;

    /* renamed from: n1, reason: collision with root package name and from kotlin metadata */
    @gn.c("ad_unit_quality_signals")
    @JvmField
    @Nullable
    public b adUnitQualitySignals;

    /* renamed from: o, reason: from kotlin metadata */
    @gn.c("slotname")
    @JvmField
    @Nullable
    public String adUnitId;

    /* renamed from: o0, reason: collision with root package name and from kotlin metadata */
    @gn.c("de")
    @JvmField
    @Nullable
    public String debugSignalsEnabled;

    /* renamed from: o1, reason: collision with root package name and from kotlin metadata */
    @gn.c("extras")
    @JvmField
    @Nullable
    public Bundle googleExtrasBundle;

    /* renamed from: p, reason: collision with root package name and from kotlin metadata */
    @gn.c("rbv")
    @JvmField
    @Nullable
    public Boolean isRewarded;

    /* renamed from: p0, reason: collision with root package name and from kotlin metadata */
    @gn.c("collect_response_logs")
    @JvmField
    @Nullable
    public Boolean shouldCollectAdResponseLogs;

    /* renamed from: p1, reason: collision with root package name and from kotlin metadata */
    @gn.c("native_version")
    @JvmField
    @Nullable
    public Integer nativeVersion;

    /* renamed from: q, reason: collision with root package name and from kotlin metadata */
    @gn.c("rbi")
    @JvmField
    @Nullable
    public Boolean isRewardedInterstitial;

    /* renamed from: q0, reason: collision with root package name and from kotlin metadata */
    @gn.c("test_mode")
    @JvmField
    public int testMode;

    /* renamed from: q1, reason: collision with root package name and from kotlin metadata */
    @gn.c("native_templates")
    @JvmField
    @Nullable
    public List<String> nativeTemplates;

    /* renamed from: r, reason: collision with root package name and from kotlin metadata */
    @gn.c("start_signals_timestamp")
    @JvmField
    public long requestTimeMilliseconds;

    /* renamed from: r0, reason: collision with root package name and from kotlin metadata */
    @gn.c("linked_device")
    @JvmField
    public int linkedDevice;

    /* renamed from: r1, reason: collision with root package name and from kotlin metadata */
    @gn.c("native_custom_templates")
    @JvmField
    @Nullable
    public List<String> nativeCustomTemplates;

    /* renamed from: s, reason: collision with root package name and from kotlin metadata */
    @gn.c("kw")
    @JvmField
    @Nullable
    public ArrayList<String> keywords;

    /* renamed from: s0, reason: collision with root package name and from kotlin metadata */
    @gn.c("inspector_extras")
    @JvmField
    @Nullable
    public String inspectorExtras;

    /* renamed from: s1, reason: collision with root package name and from kotlin metadata */
    @gn.c("enable_native_media_orientation")
    @JvmField
    @Nullable
    public Boolean enableNativeMediaOrientation;

    /* renamed from: t, reason: collision with root package name and from kotlin metadata */
    @gn.c("sam_l")
    @JvmField
    @Nullable
    public Integer safeAreaMarginLeftDip;

    /* renamed from: t0, reason: collision with root package name and from kotlin metadata */
    @gn.c("risd")
    @JvmField
    @Nullable
    public Integer requestServerData;

    /* renamed from: t1, reason: collision with root package name and from kotlin metadata */
    @gn.c("native_media_orientation")
    @JvmField
    @Nullable
    public String nativeMediaOrientation;

    /* renamed from: u, reason: collision with root package name and from kotlin metadata */
    @gn.c("sam_t")
    @JvmField
    @Nullable
    public Integer safeAreaMarginTopDip;

    /* renamed from: u0, reason: collision with root package name and from kotlin metadata */
    @gn.c("omid_v")
    @JvmField
    @Nullable
    public String omidVersion;

    /* renamed from: u1, reason: collision with root package name and from kotlin metadata */
    @gn.c("use_custom_mute")
    @JvmField
    @Nullable
    public Boolean customMuteThisAdRequested;

    /* renamed from: v, reason: collision with root package name and from kotlin metadata */
    @gn.c("sam_r")
    @JvmField
    @Nullable
    public Integer safeAreaMarginRightDip;

    /* renamed from: v0, reason: collision with root package name and from kotlin metadata */
    @gn.c("client_omid_v")
    @JvmField
    @Nullable
    public String clientOmidVersion;

    /* renamed from: v1, reason: collision with root package name and from kotlin metadata */
    @gn.c("ccg_on")
    @JvmField
    @Nullable
    public Boolean customClickGestureEnabled;

    /* renamed from: w, reason: collision with root package name and from kotlin metadata */
    @gn.c("sam_b")
    @JvmField
    @Nullable
    public Integer safeAreaMarginBottomDip;

    /* renamed from: w0, reason: collision with root package name and from kotlin metadata */
    @gn.c("client_omid_p")
    @JvmField
    @Nullable
    public String omidPartnerName;

    /* renamed from: w1, reason: collision with root package name and from kotlin metadata */
    @gn.c("sccg_dir")
    @JvmField
    @Nullable
    public Integer customClickGestureDirection;

    /* renamed from: x, reason: collision with root package name and from kotlin metadata */
    @gn.c("rc_tl")
    @JvmField
    @Nullable
    public Integer roundedCornerTopLeftDip;

    /* renamed from: x0, reason: collision with root package name and from kotlin metadata */
    @gn.c("pn")
    @JvmField
    @NotNull
    public String packageName;

    /* renamed from: x1, reason: collision with root package name and from kotlin metadata */
    @gn.c("sccg_tap")
    @JvmField
    @Nullable
    public Boolean customClickGestureAllowTaps;

    /* renamed from: y, reason: collision with root package name and from kotlin metadata */
    @gn.c("rc_tr")
    @JvmField
    @Nullable
    public Integer roundedCornerTopRightDip;

    /* renamed from: y0, reason: collision with root package name and from kotlin metadata */
    @gn.c("vc")
    @JvmField
    @Nullable
    public Integer versionCode;

    /* renamed from: y1, reason: collision with root package name and from kotlin metadata */
    @gn.c("video")
    @JvmField
    @Nullable
    public q videoOptionsSignal;

    /* renamed from: z, reason: collision with root package name and from kotlin metadata */
    @gn.c("rc_bl")
    @JvmField
    @Nullable
    public Integer roundedCornerBottomLeftDip;

    /* renamed from: z0, reason: collision with root package name and from kotlin metadata */
    @gn.c("an")
    @JvmField
    @Nullable
    public String appName;

    /* renamed from: z1, reason: collision with root package name and from kotlin metadata */
    @gn.c("disable_image_loading")
    @JvmField
    @Nullable
    public Boolean isImageLoadingDisabled;

    public p() {
        ArrayList<a> arrayList = new ArrayList<>();
        ArrayList<String> arrayList2 = new ArrayList<>();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ArrayList<String> arrayList3 = new ArrayList<>();
        l lVar = new l(0);
        h hVar = new h(0);
        Bundle bundle = new Bundle();
        o oVar = new o(0);
        ArrayList<String> arrayList4 = new ArrayList<>();
        this.adIdPermission = "0";
        this.adSizeArray = arrayList;
        this.isGreaterThanMaxAllowedBannerSize = false;
        this.responsiveAutoFormat = null;
        this.adaptiveSlot = null;
        this.format = null;
        this.fluidType = null;
        this.multipleAdSizeString = null;
        this.screenDensity = 0.0f;
        this.screenWidth = 0;
        this.screenHeight = 0;
        this.screenWidthDip = 0;
        this.screenHeightDip = 0;
        this.orientation = null;
        this.adUnitId = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.isRewarded = null;
        this.isRewardedInterstitial = null;
        this.requestTimeMilliseconds = 0L;
        this.keywords = null;
        this.safeAreaMarginLeftDip = null;
        this.safeAreaMarginTopDip = null;
        this.safeAreaMarginRightDip = null;
        this.safeAreaMarginBottomDip = null;
        this.roundedCornerTopLeftDip = null;
        this.roundedCornerTopRightDip = null;
        this.roundedCornerBottomLeftDip = null;
        this.roundedCornerBottomRightDip = null;
        this.tagForChildDirectedTreatment = 0;
        this.tagForAgeTreatment = null;
        this.csrbEcoData = null;
        this.isTestRequest = false;
        this.manualImpressionsEnabled = false;
        this.publisherProvidedId = null;
        this.contentUrl = null;
        this.neighboringContentUrls = null;
        this.customTargeting = null;
        this.requestAgent = null;
        this.tagForUnderAgeOfConsent = 0;
        this.maxAdContentRating = null;
        this.adResponseEncryptionKey = null;
        this.adShieldSignal = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.adTypes = arrayList2;
        this.adapterVersionData = linkedHashMap;
        this.appSwitched = null;
        this.grantedPermissions = arrayList3;
        this.personallyIdentifiableInformation = lVar;
        this.qualitySignals = null;
        this.audioMode = 0;
        this.isMusicActive = false;
        this.isSpeakerPhoneOn = false;
        this.musicVolume = 0;
        this.minMusicVolume = null;
        this.maxMusicVolume = null;
        this.musicVolumePercent = null;
        this.ringerMode = 0;
        this.ringerVolume = 0;
        this.appVolume = 0.0f;
        this.isAppMuted = false;
        this.deviceSignals = hVar;
        this.timeSinceCldUpdate = 0L;
        this.adUnitRequestSignals = null;
        this.adUnitRequestSignalsObject = null;
        this.commonCldSignals = null;
        this.commonCldSignalsObject = null;
        this.sharedPreferenceSignals = bundle;
        this.creativeToken = null;
        this.debugSignalsEnabled = null;
        this.shouldCollectAdResponseLogs = null;
        this.testMode = 0;
        this.linkedDevice = 0;
        this.inspectorExtras = null;
        this.requestServerData = null;
        this.omidVersion = null;
        this.clientOmidVersion = null;
        this.omidPartnerName = null;
        this.packageName = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.versionCode = null;
        this.appName = null;
        this.versionName = null;
        this.displayLabel = null;
        this.requestId = null;
        this.realTimeBiddingSignals = null;
        this.E0 = null;
        this.gmpAppId = null;
        this.appInstanceId = null;
        this.adEventId = null;
        this.appIdOrigin = null;
        this.appWebPropertyCode = null;
        this.applicationCode = null;
        this.afmaVersion = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.isNonagon = false;
        this.isDecagon = true;
        this.additionalCapabilities = null;
        this.targetApi = null;
        this.granularVersion = null;
        this.sdkEnvironment = oVar;
        this.canOpenGeo = null;
        this.canOpenHttp = null;
        this.countryCode = null;
        this.deviceCountryCode = null;
        this.isEmulator = null;
        this.isLatchskyDevice = false;
        this.languageCode = null;
        this.clientLanguageCode = null;
        this.languageCodeList = arrayList4;
        this.deviceLanguageCode = null;
        this.marketVersion = null;
        this.submodel = null;
        this.isBattlestarDevice = null;
        this.buildApiLevel = null;
        this.carrierCode = null;
        this.networkTypeCoarse = null;
        this.networkTypeFine = null;
        this.phoneType = null;
        this.experimentIds = null;
        this.transparentBackgroundSupported = null;
        this.sessionId = null;
        this.adUnitQualitySignals = null;
        this.googleExtrasBundle = null;
        this.nativeVersion = null;
        this.nativeTemplates = null;
        this.nativeCustomTemplates = null;
        this.enableNativeMediaOrientation = null;
        this.nativeMediaOrientation = null;
        this.customMuteThisAdRequested = null;
        this.customClickGestureEnabled = null;
        this.customClickGestureDirection = null;
        this.customClickGestureAllowTaps = null;
        this.videoOptionsSignal = null;
        this.isImageLoadingDisabled = null;
        this.adChoicesPlacement = null;
        this.numberOfRegisteredWebViews = null;
        this.isBannerRefreshRequest = null;
        this.isIconAdRequest = null;
        this.isPictureInPictureAdRequest = null;
        this.iconAdPlacement = null;
        this.correlator = null;
        this.usesMediaView = null;
        this.installerPackage = null;
        this.initiatorPackage = null;
        this.signalType = null;
        this.isScarRequest = null;
        this.publisherPrivacyPersonalizationState = null;
        this.isHsdpSupported = null;
        this.preProcessedSignals = null;
        this.isPrefetchRequest = null;
        this.displayCount = null;
        this.localSignals = null;
        this.parentAdConfig = null;
        this.inMemorySdkCoreData = null;
        this.numberOfAdsRequested = null;
        this.clientRequestBuildingData = null;
        this.parentCommonConfig = null;
        this.timeSinceSdkInitMs = null;
        this.isS2SRecursiveRequest = null;
        this.isAdapterInitConfigSet = null;
        this.isSwipeableInterstitial = null;
        this.maxScreenHoldDurationSeconds = null;
        this.maxSlotWidth = null;
        this.maxSlotHeight = null;
        this.persistentCacheRequest = null;
        this.crossProcessRequest = null;
    }

    public final void a(Long l9) {
        this.timeSinceSdkInitMs = l9;
    }

    public final void b() {
        this.isS2SRecursiveRequest = 1;
    }
}
