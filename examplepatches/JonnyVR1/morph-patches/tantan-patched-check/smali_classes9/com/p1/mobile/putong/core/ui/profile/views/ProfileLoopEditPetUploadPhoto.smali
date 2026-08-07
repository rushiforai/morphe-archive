.class public Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VLinear;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VDraweeView;

.field public i:Lv/VImage;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lv/VDraweeView;

.field public l:Lv/VImage;

.field public m:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Ll/gcg0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic R(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->n0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V(Ll/y20;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic W(Ll/bkj0;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 15
    .line 16
    const-string v0, "\u68c0\u6d4b\u5230\u654f\u611f\u4fe1\u606f\uff0c\u4e0a\u4f20\u5931\u8d25"

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/safety/IllegalPictureException;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw p0
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->q0(Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y(Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    new-instance p0, Ll/aoa0;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/aoa0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static synthetic Z(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    rsub-int/lit8 p1, p1, 0x3

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/16 p3, 0x11

    .line 24
    .line 25
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/16 p3, 0x312

    .line 42
    .line 43
    invoke-virtual {p0, p1, p3}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 44
    .line 45
    .line 46
    sget p1, Ll/z7c0;->h:I

    .line 47
    .line 48
    const/4 p3, 0x0

    .line 49
    invoke-virtual {p0, p1, p3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 50
    .line 51
    .line 52
    const-string p0, "asset_status"

    .line 53
    .line 54
    const-string p1, "1"

    .line 55
    .line 56
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    filled-new-array {p0}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "e_edit_pet_upload"

    .line 65
    .line 66
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static synthetic a0(Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/lang/Throwable;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of v0, p2, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/data/Media;Ll/uxj0;)Lrx/c;
    .locals 3

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    const-string v0, "profile"

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "user-profile"

    .line 17
    .line 18
    invoke-static {p1, v0, v2, p0, v1}, Ll/yb5;->L(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic c0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->o0(Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->r0(ILjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Lcom/p1/mobile/putong/data/Media;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->p0(Lcom/p1/mobile/putong/data/Media;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/koa0;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/UserWealth;->new_()Lcom/p1/mobile/putong/data/UserWealth;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    new-instance v1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->u0(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Media;",
            ")",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->k0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/xna0;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/xna0;-><init>(Lcom/p1/mobile/putong/data/Media;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/yna0;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/yna0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final k0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Media;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqb0;->R:Ll/s5m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/s5m;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ll/uqb0;->R:Ll/s5m;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p0, p1}, Ll/s5m;->b(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Ll/zna0;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/zna0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 40
    .line 41
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public final l0(Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;I)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u4e0a\u4f20\u56fe\u7247\u5931\u8d25\uff01"

    .line 8
    .line 9
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-ne p0, p3, :cond_1

    .line 18
    .line 19
    const-string p0, "\u68c0\u6d4b\u5230\u654f\u611f\u4fe1\u606f\uff0c\u4e0a\u4f20\u5931\u8d25"

    .line 20
    .line 21
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-lez p0, :cond_2

    .line 30
    .line 31
    const-string p0, "\u68c0\u6d4b\u5230\u654f\u611f\u4fe1\u606f\uff0c\u5df2\u81ea\u52a8\u79fb\u9664"

    .line 32
    .line 33
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "e_save_pet"

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 31
    .line 32
    iput-object p2, p1, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 35
    .line 36
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 37
    .line 38
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->t0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->t0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->l0(Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/data/Media;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->j0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/wna0;

    .line 6
    .line 7
    invoke-direct {p1, p2, p3}, Ll/wna0;-><init>(Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final synthetic q0(Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/joa0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3, p1, p2}, Ll/joa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Lcom/p1/mobile/putong/data/Media;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ll/una0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/una0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic r0(ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p3, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->u0(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "asset_status"

    .line 18
    .line 19
    const-string p1, "0"

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_edit_pet_upload"

    .line 30
    .line 31
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public s0(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v4, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 14
    .line 15
    invoke-direct {v4}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v5, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    invoke-direct {v5}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 21
    .line 22
    .line 23
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/tna0;

    .line 33
    .line 34
    invoke-direct {v1, p0, v4, v5}, Ll/tna0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->concatMap(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v7, Ll/boa0;

    .line 54
    .line 55
    invoke-direct {v7, p3}, Ll/boa0;-><init>(Ll/y20;)V

    .line 56
    .line 57
    .line 58
    new-instance p3, Ll/coa0;

    .line 59
    .line 60
    invoke-direct {p3, p0, p1}, Ll/coa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Lcom/p1/mobile/android/app/Act;)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Ll/doa0;

    .line 64
    .line 65
    move-object v2, p0

    .line 66
    move-object v3, p1

    .line 67
    move-object v6, p2

    .line 68
    invoke-direct/range {v1 .. v6}, Ll/doa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v7, p3, v1}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public setUser(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    return-void
.end method

.method public final t0(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v0, Ll/vna0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/vna0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0xc8

    .line 9
    .line 10
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public u0(Ljava/lang/String;)V
    .locals 14

    .line 1
    invoke-static {}, Ll/xra;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    new-instance v2, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x1

    .line 29
    if-eqz v3, :cond_4

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_4

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 46
    .line 47
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_4

    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 58
    .line 59
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 60
    .line 61
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_4

    .line 66
    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 74
    .line 75
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 76
    .line 77
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-nez v3, :cond_3

    .line 82
    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 86
    .line 87
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 90
    .line 91
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    check-cast v3, Ljava/lang/CharSequence;

    .line 98
    .line 99
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-nez v3, :cond_3

    .line 104
    .line 105
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 108
    .line 109
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 110
    .line 111
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 112
    .line 113
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Ljava/lang/CharSequence;

    .line 120
    .line 121
    const-string v5, "\u5df2\u6709\u5ba0\u7269"

    .line 122
    .line 123
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-nez v3, :cond_1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 131
    .line 132
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 133
    .line 134
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 135
    .line 136
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 137
    .line 138
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 139
    .line 140
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-nez v3, :cond_2

    .line 145
    .line 146
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 147
    .line 148
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 149
    .line 150
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 151
    .line 152
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 153
    .line 154
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 155
    .line 156
    :cond_2
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_3
    :goto_0
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_4
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->d:Landroid/widget/FrameLayout;

    .line 168
    .line 169
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->g:Landroid/widget/FrameLayout;

    .line 170
    .line 171
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->j:Landroid/widget/FrameLayout;

    .line 172
    .line 173
    const/4 v7, 0x3

    .line 174
    new-array v8, v7, [Landroid/view/View;

    .line 175
    .line 176
    aput-object v3, v8, v1

    .line 177
    .line 178
    aput-object v5, v8, v4

    .line 179
    .line 180
    const/4 v3, 0x2

    .line 181
    aput-object v6, v8, v3

    .line 182
    .line 183
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->e:Lv/VDraweeView;

    .line 184
    .line 185
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->h:Lv/VDraweeView;

    .line 186
    .line 187
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->k:Lv/VDraweeView;

    .line 188
    .line 189
    filled-new-array {v5, v6, v9}, [Lv/VDraweeView;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->f:Lv/VImage;

    .line 194
    .line 195
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->i:Lv/VImage;

    .line 196
    .line 197
    iget-object v10, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->l:Lv/VImage;

    .line 198
    .line 199
    new-array v11, v7, [Landroid/view/View;

    .line 200
    .line 201
    aput-object v6, v11, v1

    .line 202
    .line 203
    aput-object v9, v11, v4

    .line 204
    .line 205
    aput-object v10, v11, v3

    .line 206
    .line 207
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 212
    .line 213
    const/high16 v6, 0x42c00000    # 96.0f

    .line 214
    .line 215
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 216
    .line 217
    .line 218
    move-result v6

    .line 219
    sub-int/2addr v3, v6

    .line 220
    div-int/2addr v3, v7

    .line 221
    move v6, v1

    .line 222
    :goto_2
    if-ge v6, v7, :cond_5

    .line 223
    .line 224
    aget-object v9, v8, v6

    .line 225
    .line 226
    invoke-static {v9, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 227
    .line 228
    .line 229
    aget-object v9, v8, v6

    .line 230
    .line 231
    filled-new-array {v9}, [Landroid/view/View;

    .line 232
    .line 233
    .line 234
    move-result-object v9

    .line 235
    invoke-static {v3, v9}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 236
    .line 237
    .line 238
    aget-object v9, v8, v6

    .line 239
    .line 240
    invoke-static {v9, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 241
    .line 242
    .line 243
    aget-object v9, v11, v6

    .line 244
    .line 245
    invoke-static {v9, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    aget-object v9, v5, v6

    .line 249
    .line 250
    invoke-static {v9, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 251
    .line 252
    .line 253
    aget-object v9, v8, v6

    .line 254
    .line 255
    new-instance v10, Ll/eoa0;

    .line 256
    .line 257
    invoke-direct {v10}, Ll/eoa0;-><init>()V

    .line 258
    .line 259
    .line 260
    invoke-static {v9, v10}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 261
    .line 262
    .line 263
    aget-object v9, v5, v6

    .line 264
    .line 265
    new-instance v10, Ll/foa0;

    .line 266
    .line 267
    invoke-direct {v10}, Ll/foa0;-><init>()V

    .line 268
    .line 269
    .line 270
    invoke-static {v9, v10}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 271
    .line 272
    .line 273
    aget-object v9, v11, v6

    .line 274
    .line 275
    new-instance v10, Ll/goa0;

    .line 276
    .line 277
    invoke-direct {v10}, Ll/goa0;-><init>()V

    .line 278
    .line 279
    .line 280
    invoke-static {v9, v10}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 281
    .line 282
    .line 283
    add-int/lit8 v6, v6, 0x1

    .line 284
    .line 285
    goto :goto_2

    .line 286
    :cond_5
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 287
    .line 288
    .line 289
    move-result v3

    .line 290
    const-string v6, "asset_status"

    .line 291
    .line 292
    const-string v9, "e_edit_pet_upload"

    .line 293
    .line 294
    if-nez v3, :cond_6

    .line 295
    .line 296
    move v3, v1

    .line 297
    :goto_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 298
    .line 299
    .line 300
    move-result v10

    .line 301
    invoke-static {v10, v7}, Ljava/lang/Math;->min(II)I

    .line 302
    .line 303
    .line 304
    move-result v10

    .line 305
    if-ge v3, v10, :cond_6

    .line 306
    .line 307
    aget-object v10, v8, v3

    .line 308
    .line 309
    invoke-static {v10, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 310
    .line 311
    .line 312
    aget-object v10, v11, v3

    .line 313
    .line 314
    invoke-static {v10, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 315
    .line 316
    .line 317
    aget-object v10, v5, v3

    .line 318
    .line 319
    invoke-static {v10, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 320
    .line 321
    .line 322
    sget-object v10, Ll/uqb0;->G:Ll/fsb0;

    .line 323
    .line 324
    aget-object v12, v5, v3

    .line 325
    .line 326
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v13

    .line 330
    check-cast v13, Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {v10, v12, v13}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    const-string v10, "0"

    .line 336
    .line 337
    invoke-static {v6, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 338
    .line 339
    .line 340
    move-result-object v10

    .line 341
    filled-new-array {v10}, [Ll/pf60;

    .line 342
    .line 343
    .line 344
    move-result-object v10

    .line 345
    invoke-static {v9, p1, v10}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 346
    .line 347
    .line 348
    aget-object v10, v11, v3

    .line 349
    .line 350
    new-instance v12, Ll/hoa0;

    .line 351
    .line 352
    invoke-direct {v12, p0, v3, p1}, Ll/hoa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;ILjava/lang/String;)V

    .line 353
    .line 354
    .line 355
    invoke-static {v10, v12}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 356
    .line 357
    .line 358
    add-int/lit8 v3, v3, 0x1

    .line 359
    .line 360
    goto :goto_3

    .line 361
    :cond_6
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 362
    .line 363
    .line 364
    move-result p0

    .line 365
    if-ge p0, v7, :cond_7

    .line 366
    .line 367
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 368
    .line 369
    .line 370
    move-result p0

    .line 371
    aget-object v2, v8, p0

    .line 372
    .line 373
    invoke-static {v2, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 374
    .line 375
    .line 376
    aget-object v2, v11, p0

    .line 377
    .line 378
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 379
    .line 380
    .line 381
    aget-object v2, v5, p0

    .line 382
    .line 383
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 384
    .line 385
    .line 386
    aget-object v1, v8, p0

    .line 387
    .line 388
    sget v2, Ll/kbc0;->B0:I

    .line 389
    .line 390
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 391
    .line 392
    .line 393
    const-string v1, "1"

    .line 394
    .line 395
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    filled-new-array {v1}, [Ll/pf60;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    invoke-static {v9, p1, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 404
    .line 405
    .line 406
    aget-object v1, v8, p0

    .line 407
    .line 408
    new-instance v2, Ll/ioa0;

    .line 409
    .line 410
    invoke-direct {v2, v0, p0, p1}, Ll/ioa0;-><init>(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V

    .line 411
    .line 412
    .line 413
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 414
    .line 415
    .line 416
    :cond_7
    return-void
.end method

.method public v0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/UserWealth;->new_()Lcom/p1/mobile/putong/data/UserWealth;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    new-instance v1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->u0(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
