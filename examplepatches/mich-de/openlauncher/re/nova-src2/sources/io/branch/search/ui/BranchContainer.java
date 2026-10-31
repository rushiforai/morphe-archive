package io.branch.search.ui;

import android.os.Parcelable;
import io.branch.search.ui.BranchEntity;
import java.util.List;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bf\u0018\u0000*\b\b\u0000\u0010\u0002*\u00020\u00012\u00020\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchContainer;", "Lio/branch/search/ui/BranchEntity;", "T", "Landroid/os/Parcelable;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public interface BranchContainer<T extends BranchEntity> extends Parcelable {
    String getContainerType();

    List getContent();

    CharSequence getHeader();
}
