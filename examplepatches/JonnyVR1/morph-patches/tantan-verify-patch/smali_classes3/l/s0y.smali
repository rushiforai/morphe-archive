.class public interface abstract Ll/s0y;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z
.end method

.method public b(Landroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p5, p4, p3}, Ll/cmc0;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/data/Media;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p2, 0x1

    .line 10
    invoke-virtual {p1, p0, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 11
    .line 12
    .line 13
    return p2
.end method

.method public d(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/s0y;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e(ILjava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Landroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method
