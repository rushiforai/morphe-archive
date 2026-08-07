.class public Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;
    }
.end annotation


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Lv/VButton_FakeShadow;

.field public d:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;->none:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->d:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;->none:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->d:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;->none:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->d:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;Lcom/p1/mobile/android/app/Frag;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->c(Lcom/p1/mobile/android/app/Frag;ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/byv;->a(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c(Lcom/p1/mobile/android/app/Frag;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/fph0;->e0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    check-cast p3, Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-static {p3}, Ll/xxv;->n(Lcom/p1/mobile/android/app/Act;)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    sget-object p0, Ll/fph0;->h:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p0}, Ll/fph0;->n0(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "android.permission.ACCESS_FINE_LOCATION"

    .line 22
    .line 23
    const-string p3, "android.permission.ACCESS_COARSE_LOCATION"

    .line 24
    .line 25
    filled-new-array {p0, p3}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0, p2}, Landroidx/fragment/app/Fragment;->requestPermissions([Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Landroid/app/Activity;

    .line 38
    .line 39
    invoke-static {p0}, Ll/hve0;->x(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catch_0
    move-exception p0

    .line 44
    new-instance p1, Ljava/lang/Exception;

    .line 45
    .line 46
    new-instance p2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string p3, "LocationAccessAct setLocation "

    .line 49
    .line 50
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-direct {p1, p2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Fj:I

    .line 71
    .line 72
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Frag;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->c:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    new-instance v1, Ll/ayv;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/ayv;-><init>(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;Lcom/p1/mobile/android/app/Frag;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->d:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->a:Lv/VText;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;->requested:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-ne p1, v1, :cond_0

    .line 10
    .line 11
    move v4, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v4, v2

    .line 14
    :goto_0
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->b:Lv/VText;

    .line 18
    .line 19
    if-ne p1, v1, :cond_1

    .line 20
    .line 21
    move v4, v3

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move v4, v2

    .line 24
    :goto_1
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->c:Lv/VButton_FakeShadow;

    .line 28
    .line 29
    if-ne p1, v1, :cond_2

    .line 30
    .line 31
    move v2, v3

    .line 32
    :cond_2
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public getState()Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->d:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
