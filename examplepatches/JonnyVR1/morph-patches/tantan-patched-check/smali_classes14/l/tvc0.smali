.class public Ll/tvc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s0y;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->isImageSelected()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p3, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getFirstMedia()Lcom/p1/mobile/putong/data/Media;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getFirstMedia()Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-interface {p2, p1, p0, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->openLoginUiOptCropAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p3, p3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 42
    .line 43
    .line 44
    return v0

    .line 45
    :cond_0
    return p3
.end method
