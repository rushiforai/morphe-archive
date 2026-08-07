.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;

.field public d:Lv/VImage;

.field public e:Lv/VText;


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

.method public static synthetic P(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;->S(Landroid/view/View;)V

    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_camera_top_start"

    .line 2
    .line 3
    const-string v0, "p_camera_local_album"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    const-string p1, ""

    .line 15
    .line 16
    const/16 v0, 0x2710

    .line 17
    .line 18
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;->T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 10

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "android.permission.CAMERA"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-array v0, v3, [Ljava/lang/String;

    .line 12
    .line 13
    aput-object v1, v0, v2

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x2

    .line 17
    new-array v0, v0, [Ljava/lang/String;

    .line 18
    .line 19
    aput-object v1, v0, v2

    .line 20
    .line 21
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 22
    .line 23
    aput-object v1, v0, v3

    .line 24
    .line 25
    :goto_0
    const/4 v7, 0x0

    .line 26
    const/4 v8, 0x0

    .line 27
    const/4 v5, 0x1

    .line 28
    const/4 v6, 0x0

    .line 29
    move-object v4, p0

    .line 30
    move-object v9, p1

    .line 31
    invoke-static/range {v4 .. v9}, Lcom/p1/mobile/putong/account/ui/camera/act/AccountCompactMediaPickerAct;->c2(Landroid/content/Context;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;ZZLjava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance v0, Ll/ai;

    .line 52
    .line 53
    invoke-direct {v0, v4, p0, p2}, Ll/ai;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public final R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bi;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;->R(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;

    .line 8
    .line 9
    new-instance v1, Ll/zh;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/zh;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraItemView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
