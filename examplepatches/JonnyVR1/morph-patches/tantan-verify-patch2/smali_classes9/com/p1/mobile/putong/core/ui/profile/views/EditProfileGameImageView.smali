.class public Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VFrame;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/sec0;->v0:I

    .line 9
    .line 10
    const/4 p3, 0x1

    .line 11
    invoke-virtual {p1, p2, p0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->F(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->K(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->N(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->e:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method private synthetic K(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->f:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-interface {p2, p1, p0, v0}, Ll/r97;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->a:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->b:Lv/VFrame;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->c:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->g:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->g:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->f:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;->b(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private synthetic M(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->g:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->g:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic N(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->e:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    instance-of p0, p1, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const-string p0, "\u4e0a\u4f20\u5931\u8d25"

    .line 43
    .line 44
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/16 v0, 0xf

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

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
    const/16 v0, 0x312

    .line 42
    .line 43
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 44
    .line 45
    .line 46
    sget p1, Ll/z7c0;->h:I

    .line 47
    .line 48
    invoke-virtual {p0, p1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->M(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u(Ljava/util/List;)Lrx/c;
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
    new-instance p0, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 34
    .line 35
    const-string v0, "\u4e0a\u4f20\u56fe\u7247\u5931\u8d25"

    .line 36
    .line 37
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/safety/IllegalPictureException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0
.end method

.method public static synthetic v(Ll/bkj0;)Ll/uxj0;
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

.method public static synthetic w(Ljava/util/List;Ll/uxj0;)Lrx/c;
    .locals 3

    .line 1
    const/4 p1, 0x0

    .line 2
    const-string v0, "profile"

    .line 3
    .line 4
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "user-profile"

    .line 9
    .line 10
    invoke-static {p0, v0, v2, p1, v1}, Ll/yb5;->L(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->L(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wme;->a(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public G(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->g:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->a:Lv/VLinear;

    .line 6
    .line 7
    new-instance v0, Ll/tme;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/tme;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->c:Lv/VDraweeView;

    .line 16
    .line 17
    new-instance v0, Ll/ume;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1}, Ll/ume;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->d:Lv/VImage;

    .line 26
    .line 27
    new-instance p2, Ll/vme;

    .line 28
    .line 29
    invoke-direct {p2, p0}, Ll/vme;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/data/Picture;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->e:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->e:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    sget-object v2, Ll/uqb0;->R:Ll/s5m;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {v2, p1}, Ll/s5m;->b(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v2, Ll/ome;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/ome;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v2, Ll/pme;

    .line 44
    .line 45
    invoke-direct {v2, v0}, Ll/pme;-><init>(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/qme;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/qme;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance v0, Ll/rme;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/rme;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V

    .line 76
    .line 77
    .line 78
    new-instance v1, Ll/sme;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/sme;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public P(Ljava/lang/String;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 v0, p1, 0x1

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->c:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->f:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v4, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$a;

    .line 18
    .line 19
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v2, v3, v4}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->a:Lv/VLinear;

    .line 26
    .line 27
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->b:Lv/VFrame;

    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public Q()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->a:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getImageUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
