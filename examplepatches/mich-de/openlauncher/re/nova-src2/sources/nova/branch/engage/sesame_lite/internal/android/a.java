package nova.branch.engage.sesame_lite.internal.android;

import java.util.Comparator;
import nova.branch.engage.sesame_lite.internal.android.ContactsProviderHelper;

/* loaded from: classes5.dex */
public final /* synthetic */ class a implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return ContactsProviderHelper.ContactValue.comparator$lambda$0((ContactsProviderHelper.ContactValue) obj, (ContactsProviderHelper.ContactValue) obj2);
    }
}
