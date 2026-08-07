.class public Ll/vfi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vfi$a;
    }
.end annotation


# static fields
.field public static j:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/vfi;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ll/nqy;

.field public b:Ll/vfi$a;

.field public c:Lv/VSwitchButton;

.field public d:Lv/VSwitchButton;

.field public e:Lv/VSwitchButton;

.field public f:Lv/VSwitchButton;

.field public g:Lv/VSwitchButton;

.field public h:Lv/VSwitchButton;

.field public i:Z


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

.method public static synthetic a(Ll/uxj0;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic b(Ll/vfi;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->z(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/vfi;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->E(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/vfi;Lcom/p1/mobile/android/app/Act;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vfi;->G(Lcom/p1/mobile/android/app/Act;ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic e(Ll/vfi;Lcom/p1/mobile/android/app/Act;Ll/vfi$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->v(Lcom/p1/mobile/android/app/Act;Ll/vfi$a;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic g(Ll/vfi;Lcom/p1/mobile/putong/core/data/VipSetting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vfi;->A(Lcom/p1/mobile/putong/core/data/VipSetting;)V

    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/core/data/VipSetting;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic i(Ll/vfi;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->B(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/vfi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vfi;->D(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/vfi;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->w(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic m(Ll/vfi;Ll/kcg0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->C(Ll/kcg0;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic n(Ll/vfi;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->F(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;Lcom/p1/mobile/putong/core/data/VipSetting;)Ll/vfi$a;
    .locals 3

    .line 1
    new-instance v0, Ll/vfi$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vfi$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iput-boolean v2, v0, Ll/vfi$a;->b:Z

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    iput-boolean p0, v0, Ll/vfi$a;->a:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iput-boolean v1, v0, Ll/vfi$a;->b:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Ll/vfi$a;->a:Z

    .line 29
    .line 30
    :goto_0
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/VipSetting;->suggestReal:Z

    .line 33
    .line 34
    iput-boolean p0, v0, Ll/vfi$a;->c:Z

    .line 35
    .line 36
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/VipSetting;->suggestSecure:Z

    .line 37
    .line 38
    iput-boolean p0, v0, Ll/vfi$a;->d:Z

    .line 39
    .line 40
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/VipSetting;->blockAds:Z

    .line 41
    .line 42
    iput-boolean p0, v0, Ll/vfi$a;->e:Z

    .line 43
    .line 44
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/VipSetting;->blockSensitiveWord:Z

    .line 45
    .line 46
    iput-boolean p0, v0, Ll/vfi$a;->f:Z

    .line 47
    .line 48
    return-object v0

    .line 49
    :cond_1
    iput-boolean v1, v0, Ll/vfi$a;->c:Z

    .line 50
    .line 51
    iput-boolean v1, v0, Ll/vfi$a;->d:Z

    .line 52
    .line 53
    iput-boolean v1, v0, Ll/vfi$a;->e:Z

    .line 54
    .line 55
    iput-boolean v1, v0, Ll/vfi$a;->f:Z

    .line 56
    .line 57
    return-object v0
.end method

.method public static synthetic p(Ll/vfi;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->x(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic r(Ll/vfi;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->y(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static u()Ljava/lang/ref/WeakReference;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/WeakReference<",
            "Ll/vfi;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/vfi;->j:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    const-class v0, Ll/vfi;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    new-instance v2, Ll/vfi;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/vfi;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    sput-object v1, Ll/vfi;->j:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    :cond_1
    sget-object v0, Ll/vfi;->j:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    return-object v0

    .line 30
    :catchall_0
    move-exception v1

    .line 31
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw v1
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/core/data/VipSetting;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vfi;->a:Ll/nqy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/nqy;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/vfi;->b:Ll/vfi$a;

    .line 14
    .line 15
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/VipSetting;->suggestReal:Z

    .line 16
    .line 17
    iput-boolean v1, v0, Ll/vfi$a;->c:Z

    .line 18
    .line 19
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/VipSetting;->suggestSecure:Z

    .line 20
    .line 21
    iput-boolean v1, v0, Ll/vfi$a;->d:Z

    .line 22
    .line 23
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/VipSetting;->blockAds:Z

    .line 24
    .line 25
    iput-boolean v1, v0, Ll/vfi$a;->e:Z

    .line 26
    .line 27
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/VipSetting;->blockSensitiveWord:Z

    .line 28
    .line 29
    iput-boolean p1, v0, Ll/vfi$a;->f:Z

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/vfi;->H(Ll/vfi$a;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic B(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vfi;->K(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic C(Ll/kcg0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Ll/vfi;->i:Z

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/joa;->C3()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "is_femalevip"

    .line 17
    .line 18
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "e_femalevip_close"

    .line 27
    .line 28
    const-string p2, "p_femalevip_page"

    .line 29
    .line 30
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic D(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfi;->a:Ll/nqy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v2, p0, Ll/vfi;->c:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    const-string v5, "e_femalevip_activetime"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/vfi;->s(Lcom/p1/mobile/android/app/Act;Lv/VSwitchButton;ZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, v0, Ll/vfi;->c:Lv/VSwitchButton;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const-string p0, "\u5f00\u542f\u540e\uff0c\u4f60\u7684\u6d3b\u8dc3\u65f6\u95f4\u5c06\u51bb\u7ed3\u5728\u6b64\u523b\uff0c\u5f53\u4f60\u53d1\u5e03\u52a8\u6001\u6216\u8bc4\u8bba\u70b9\u8d5e\u540e\uff0c\u6d3b\u8dc3\u65f6\u95f4\u5c06\u88ab\u66f4\u65b0\uff0c\u70b9\u51fb\u53f3\u4e0a\u89d2\u786e\u5b9a\u6309\u94ae\u540e\u751f\u6548"

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v2, p0, Ll/vfi;->d:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    const-string v5, "e_femalevip_location"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/vfi;->s(Lcom/p1/mobile/android/app/Act;Lv/VSwitchButton;ZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, v0, Ll/vfi;->d:Lv/VSwitchButton;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const-string p0, "\u5df2\u5f00\u542f\u9690\u85cf\u8ddd\u79bb\u4f4d\u7f6e\uff0c\u5176\u4ed6\u7528\u6237\u5c06\u770b\u4e0d\u5230\u4f60\u7684\u8ddd\u79bb\u548c\u4f60\u7684\u5730\u7406\u4f4d\u7f6e\uff0c\u70b9\u51fb\u53f3\u4e0a\u89d2\u786e\u5b9a\u6309\u94ae\u540e\u751f\u6548"

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic G(Lcom/p1/mobile/android/app/Act;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_2

    .line 5
    .line 6
    const-string p1, "\u5df2\u4fdd\u5b58"

    .line 7
    .line 8
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->R5()V

    .line 18
    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m8()Lrx/c;

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Ll/vfi;->a:Ll/nqy;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void

    .line 35
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 36
    .line 37
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final H(Ll/vfi$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vfi;->c:Lv/VSwitchButton;

    .line 2
    .line 3
    iget-boolean v1, p1, Ll/vfi$a;->a:Z

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/vfi;->d:Lv/VSwitchButton;

    .line 9
    .line 10
    iget-boolean v1, p1, Ll/vfi$a;->b:Z

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/vfi;->e:Lv/VSwitchButton;

    .line 16
    .line 17
    iget-boolean v1, p1, Ll/vfi$a;->c:Z

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/vfi;->f:Lv/VSwitchButton;

    .line 23
    .line 24
    iget-boolean v1, p1, Ll/vfi$a;->d:Z

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/vfi;->h:Lv/VSwitchButton;

    .line 30
    .line 31
    iget-boolean v1, p1, Ll/vfi$a;->f:Z

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/vfi;->g:Lv/VSwitchButton;

    .line 37
    .line 38
    iget-boolean p1, p1, Ll/vfi$a;->e:Z

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public I(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/ina;->Z3()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/dfi;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/dfi;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/ina;->Y3()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/mfi;

    .line 32
    .line 33
    invoke-direct {v2}, Ll/mfi;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, Ll/nfi;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/nfi;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/ofi;

    .line 54
    .line 55
    invoke-direct {v1, p0, p1}, Ll/ofi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public J(Lcom/p1/mobile/android/app/Act;Ll/vfi$a;)V
    .locals 3

    .line 1
    iput-object p2, p0, Ll/vfi;->b:Ll/vfi$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/joa;->y4()Lrx/c;

    .line 11
    .line 12
    .line 13
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 16
    .line 17
    invoke-virtual {p2}, Ll/ina;->U3()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v0, Ll/pfi;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/pfi;-><init>(Ll/vfi;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    new-instance v0, Ll/nqy$a;

    .line 39
    .line 40
    invoke-direct {v0, p1}, Ll/nqy$a;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    const/high16 v1, 0x441b0000    # 620.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Ll/nqy$a;->R(I)Ll/nqy$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget v1, Ll/kec0;->r3:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/nqy$a;->S(I)Ll/nqy$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "\u5979\u4e13\u4eab\u4f1a\u5458\u8bbe\u7f6e"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/nqy$a;->f0(Ljava/lang/CharSequence;)Ll/nqy$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "\u786e\u5b9a"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ll/nqy$a;->a0(Ljava/lang/CharSequence;)Ll/nqy$a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/high16 v1, 0x41800000    # 16.0f

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/nqy$a;->d0(F)Ll/nqy$a;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-virtual {v0, v1}, Ll/nqy$a;->j0(Z)Ll/nqy$a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const/high16 v1, 0x41a00000    # 20.0f

    .line 83
    .line 84
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-virtual {v0, v1}, Ll/nqy$a;->c0(I)Ll/nqy$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/qfi;

    .line 93
    .line 94
    invoke-direct {v1, p0, p1}, Ll/qfi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ll/nqy$a;->Y(Landroid/view/View$OnClickListener;)Ll/nqy$a;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    sget v2, Ll/c9c0;->I:I

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {v0, v1}, Ll/nqy$a;->b0(I)Ll/nqy$a;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sget v1, Ll/dbc0;->V:I

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ll/nqy$a;->X(I)Ll/nqy$a;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Ll/rfi;

    .line 122
    .line 123
    invoke-direct {v1, p0, p2}, Ll/rfi;-><init>(Ll/vfi;Ll/kcg0;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ll/nqy$a;->g0(Landroid/content/DialogInterface$OnDismissListener;)Ll/nqy$a;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    new-instance v0, Ll/sfi;

    .line 131
    .line 132
    invoke-direct {v0, p0}, Ll/sfi;-><init>(Ll/vfi;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p2, v0}, Ll/nqy$a;->W(Landroid/view/View$OnClickListener;)Ll/nqy$a;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    new-instance v0, Ll/q4f;

    .line 140
    .line 141
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 142
    .line 143
    .line 144
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 145
    .line 146
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 147
    .line 148
    const-string v1, "p_femalevip_page"

    .line 149
    .line 150
    iput-object v1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p2}, Ll/nqy$a;->N()Ll/nqy;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    iput-object p2, p0, Ll/vfi;->a:Ll/nqy;

    .line 160
    .line 161
    sget v0, Ll/adc0;->La:I

    .line 162
    .line 163
    invoke-virtual {p2, v0}, Ll/nqy;->c(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    check-cast p2, Landroid/view/ViewGroup;

    .line 168
    .line 169
    sget v0, Ll/adc0;->je:I

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Landroid/widget/TextView;

    .line 176
    .line 177
    const-string v1, "\u51bb\u7ed3\u6700\u540e\u6d3b\u8dc3\u65f6\u95f4"

    .line 178
    .line 179
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    sget v0, Ll/adc0;->zd:I

    .line 183
    .line 184
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    check-cast p2, Lv/VSwitchButton;

    .line 189
    .line 190
    iput-object p2, p0, Ll/vfi;->c:Lv/VSwitchButton;

    .line 191
    .line 192
    new-instance v0, Ll/tfi;

    .line 193
    .line 194
    invoke-direct {v0, p0, p1}, Ll/tfi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    .line 199
    .line 200
    iget-object p2, p0, Ll/vfi;->a:Ll/nqy;

    .line 201
    .line 202
    sget v0, Ll/adc0;->Ma:I

    .line 203
    .line 204
    invoke-virtual {p2, v0}, Ll/nqy;->c(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    check-cast p2, Landroid/view/ViewGroup;

    .line 209
    .line 210
    sget v0, Ll/adc0;->je:I

    .line 211
    .line 212
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Landroid/widget/TextView;

    .line 217
    .line 218
    const-string v1, "\u9690\u85cf\u6211\u7684\u8ddd\u79bb\u548c\u4f4d\u7f6e"

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    .line 222
    .line 223
    sget v0, Ll/adc0;->zd:I

    .line 224
    .line 225
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object p2

    .line 229
    check-cast p2, Lv/VSwitchButton;

    .line 230
    .line 231
    iput-object p2, p0, Ll/vfi;->d:Lv/VSwitchButton;

    .line 232
    .line 233
    new-instance v0, Ll/ufi;

    .line 234
    .line 235
    invoke-direct {v0, p0, p1}, Ll/ufi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 239
    .line 240
    .line 241
    iget-object p2, p0, Ll/vfi;->a:Ll/nqy;

    .line 242
    .line 243
    sget v0, Ll/adc0;->hd:I

    .line 244
    .line 245
    invoke-virtual {p2, v0}, Ll/nqy;->c(I)Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object p2

    .line 249
    check-cast p2, Landroid/view/ViewGroup;

    .line 250
    .line 251
    sget v0, Ll/adc0;->je:I

    .line 252
    .line 253
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    check-cast v0, Landroid/widget/TextView;

    .line 258
    .line 259
    const-string v1, "\u4f18\u5148\u63a8\u8350\u771f\u4eba\u5934\u50cf\u7528\u6237"

    .line 260
    .line 261
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    .line 263
    .line 264
    sget v0, Ll/adc0;->zd:I

    .line 265
    .line 266
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 267
    .line 268
    .line 269
    move-result-object p2

    .line 270
    check-cast p2, Lv/VSwitchButton;

    .line 271
    .line 272
    iput-object p2, p0, Ll/vfi;->e:Lv/VSwitchButton;

    .line 273
    .line 274
    new-instance v0, Ll/efi;

    .line 275
    .line 276
    invoke-direct {v0, p0, p1}, Ll/efi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;)V

    .line 277
    .line 278
    .line 279
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 280
    .line 281
    .line 282
    iget-object p2, p0, Ll/vfi;->a:Ll/nqy;

    .line 283
    .line 284
    sget v0, Ll/adc0;->md:I

    .line 285
    .line 286
    invoke-virtual {p2, v0}, Ll/nqy;->c(I)Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object p2

    .line 290
    check-cast p2, Landroid/view/ViewGroup;

    .line 291
    .line 292
    sget v0, Ll/adc0;->je:I

    .line 293
    .line 294
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    check-cast v0, Landroid/widget/TextView;

    .line 299
    .line 300
    const-string v1, "\u4f18\u5148\u63a8\u8350\u63a2\u63a2\u4fe1\u7528\u5206\u9ad8\u5206\u7528\u6237"

    .line 301
    .line 302
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 303
    .line 304
    .line 305
    sget v0, Ll/adc0;->zd:I

    .line 306
    .line 307
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object p2

    .line 311
    check-cast p2, Lv/VSwitchButton;

    .line 312
    .line 313
    iput-object p2, p0, Ll/vfi;->f:Lv/VSwitchButton;

    .line 314
    .line 315
    new-instance v0, Ll/ffi;

    .line 316
    .line 317
    invoke-direct {v0, p0, p1}, Ll/ffi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;)V

    .line 318
    .line 319
    .line 320
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 321
    .line 322
    .line 323
    iget-object p2, p0, Ll/vfi;->a:Ll/nqy;

    .line 324
    .line 325
    sget v0, Ll/adc0;->B1:I

    .line 326
    .line 327
    invoke-virtual {p2, v0}, Ll/nqy;->c(I)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object p2

    .line 331
    check-cast p2, Landroid/view/ViewGroup;

    .line 332
    .line 333
    sget v0, Ll/adc0;->je:I

    .line 334
    .line 335
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    check-cast v0, Landroid/widget/TextView;

    .line 340
    .line 341
    const-string v1, "\u5c4f\u853d\u5f00\u5c4f\u5e7f\u544a"

    .line 342
    .line 343
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 344
    .line 345
    .line 346
    sget v0, Ll/adc0;->zd:I

    .line 347
    .line 348
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 349
    .line 350
    .line 351
    move-result-object p2

    .line 352
    check-cast p2, Lv/VSwitchButton;

    .line 353
    .line 354
    iput-object p2, p0, Ll/vfi;->g:Lv/VSwitchButton;

    .line 355
    .line 356
    new-instance v0, Ll/gfi;

    .line 357
    .line 358
    invoke-direct {v0, p0, p1}, Ll/gfi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;)V

    .line 359
    .line 360
    .line 361
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 362
    .line 363
    .line 364
    iget-object p2, p0, Ll/vfi;->a:Ll/nqy;

    .line 365
    .line 366
    sget v0, Ll/adc0;->I:I

    .line 367
    .line 368
    invoke-virtual {p2, v0}, Ll/nqy;->c(I)Landroid/view/View;

    .line 369
    .line 370
    .line 371
    move-result-object p2

    .line 372
    check-cast p2, Landroid/view/ViewGroup;

    .line 373
    .line 374
    sget v0, Ll/adc0;->je:I

    .line 375
    .line 376
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    check-cast v0, Landroid/widget/TextView;

    .line 381
    .line 382
    const-string v1, "\u804a\u5929\u9a9a\u6270\u654f\u611f\u8bcd\u76f4\u63a5\u5c4f\u853d"

    .line 383
    .line 384
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 385
    .line 386
    .line 387
    sget v0, Ll/adc0;->zd:I

    .line 388
    .line 389
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 390
    .line 391
    .line 392
    move-result-object p2

    .line 393
    check-cast p2, Lv/VSwitchButton;

    .line 394
    .line 395
    iput-object p2, p0, Ll/vfi;->h:Lv/VSwitchButton;

    .line 396
    .line 397
    new-instance v0, Ll/hfi;

    .line 398
    .line 399
    invoke-direct {v0, p0, p1}, Ll/hfi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;)V

    .line 400
    .line 401
    .line 402
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 403
    .line 404
    .line 405
    iget-object p2, p0, Ll/vfi;->a:Ll/nqy;

    .line 406
    .line 407
    invoke-virtual {p2}, Ll/nqy;->g()V

    .line 408
    .line 409
    .line 410
    iget-object p2, p0, Ll/vfi;->b:Ll/vfi$a;

    .line 411
    .line 412
    invoke-virtual {p0, p2}, Ll/vfi;->H(Ll/vfi$a;)V

    .line 413
    .line 414
    .line 415
    invoke-static {}, Ll/joa;->C3()Z

    .line 416
    .line 417
    .line 418
    move-result p0

    .line 419
    if-nez p0, :cond_0

    .line 420
    .line 421
    const-string p0, "p_home,femalevip_icon"

    .line 422
    .line 423
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->pick_tantan_credits_users:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 424
    .line 425
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->V(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 426
    .line 427
    .line 428
    :cond_0
    return-void
.end method

.method public final K(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/joa;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "is_femalevip"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_femalevip_confirm"

    .line 20
    .line 21
    const-string v2, "p_femalevip_page"

    .line 22
    .line 23
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Ll/vfi;->i:Z

    .line 28
    .line 29
    invoke-static {}, Ll/joa;->C3()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Ll/vfi;->a:Ll/nqy;

    .line 36
    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void

    .line 43
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/ina;->W3()Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->clone()Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v2, p0, Ll/vfi;->c:Lv/VSwitchButton;

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 66
    .line 67
    iget-object v2, p0, Ll/vfi;->d:Lv/VSwitchButton;

    .line 68
    .line 69
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 78
    .line 79
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 82
    .line 83
    invoke-virtual {v2, v1}, Ll/ina;->R3(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VipSetting;->new_()Lcom/p1/mobile/putong/core/data/VipSetting;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    iget-object v3, p0, Ll/vfi;->e:Lv/VSwitchButton;

    .line 92
    .line 93
    if-eqz v3, :cond_2

    .line 94
    .line 95
    invoke-virtual {v3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    iput-boolean v3, v2, Lcom/p1/mobile/putong/core/data/VipSetting;->suggestReal:Z

    .line 100
    .line 101
    :cond_2
    iget-object v3, p0, Ll/vfi;->f:Lv/VSwitchButton;

    .line 102
    .line 103
    if-eqz v3, :cond_3

    .line 104
    .line 105
    invoke-virtual {v3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    iput-boolean v3, v2, Lcom/p1/mobile/putong/core/data/VipSetting;->suggestSecure:Z

    .line 110
    .line 111
    :cond_3
    iget-object v3, p0, Ll/vfi;->g:Lv/VSwitchButton;

    .line 112
    .line 113
    if-eqz v3, :cond_4

    .line 114
    .line 115
    invoke-virtual {v3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    iput-boolean v3, v2, Lcom/p1/mobile/putong/core/data/VipSetting;->blockAds:Z

    .line 120
    .line 121
    :cond_4
    iget-object v3, p0, Ll/vfi;->h:Lv/VSwitchButton;

    .line 122
    .line 123
    if-eqz v3, :cond_5

    .line 124
    .line 125
    invoke-virtual {v3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    iput-boolean v3, v2, Lcom/p1/mobile/putong/core/data/VipSetting;->blockSensitiveWord:Z

    .line 130
    .line 131
    :cond_5
    iget-object v3, p0, Ll/vfi;->e:Lv/VSwitchButton;

    .line 132
    .line 133
    if-eqz v3, :cond_6

    .line 134
    .line 135
    invoke-virtual {v3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    iget-object v4, p0, Ll/vfi;->b:Ll/vfi$a;

    .line 140
    .line 141
    iget-boolean v4, v4, Ll/vfi$a;->c:Z

    .line 142
    .line 143
    if-ne v3, v4, :cond_a

    .line 144
    .line 145
    :cond_6
    iget-object v3, p0, Ll/vfi;->f:Lv/VSwitchButton;

    .line 146
    .line 147
    if-eqz v3, :cond_7

    .line 148
    .line 149
    invoke-virtual {v3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    iget-object v4, p0, Ll/vfi;->b:Ll/vfi$a;

    .line 154
    .line 155
    iget-boolean v4, v4, Ll/vfi$a;->d:Z

    .line 156
    .line 157
    if-ne v3, v4, :cond_a

    .line 158
    .line 159
    :cond_7
    iget-object v3, p0, Ll/vfi;->g:Lv/VSwitchButton;

    .line 160
    .line 161
    if-eqz v3, :cond_8

    .line 162
    .line 163
    invoke-virtual {v3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    iget-object v4, p0, Ll/vfi;->b:Ll/vfi$a;

    .line 168
    .line 169
    iget-boolean v4, v4, Ll/vfi$a;->e:Z

    .line 170
    .line 171
    if-ne v3, v4, :cond_a

    .line 172
    .line 173
    :cond_8
    iget-object v3, p0, Ll/vfi;->h:Lv/VSwitchButton;

    .line 174
    .line 175
    if-eqz v3, :cond_9

    .line 176
    .line 177
    invoke-virtual {v3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    iget-object v4, p0, Ll/vfi;->b:Ll/vfi$a;

    .line 182
    .line 183
    iget-boolean v4, v4, Ll/vfi$a;->f:Z

    .line 184
    .line 185
    if-eq v3, v4, :cond_9

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_9
    const/4 v0, 0x0

    .line 189
    :cond_a
    :goto_0
    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    .line 190
    .line 191
    invoke-static {v3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    if-eqz v0, :cond_b

    .line 196
    .line 197
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 198
    .line 199
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 200
    .line 201
    invoke-virtual {v3, v2}, Ll/ina;->T3(Lcom/p1/mobile/putong/core/data/VipSetting;)Lrx/c;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    :cond_b
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 206
    .line 207
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 208
    .line 209
    .line 210
    new-instance v2, Ll/ifi;

    .line 211
    .line 212
    invoke-direct {v2}, Ll/ifi;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v3, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    new-instance v3, Ll/jfi;

    .line 220
    .line 221
    invoke-direct {v3}, Ll/jfi;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1, v3}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    new-instance v3, Ll/kfi;

    .line 229
    .line 230
    invoke-direct {v3}, Ll/kfi;-><init>()V

    .line 231
    .line 232
    .line 233
    invoke-static {v2, v1, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    new-instance v2, Ll/lfi;

    .line 242
    .line 243
    invoke-direct {v2, p0, p1, v0}, Ll/lfi;-><init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;Z)V

    .line 244
    .line 245
    .line 246
    new-instance p0, Ll/fjf0;

    .line 247
    .line 248
    invoke-direct {p0}, Ll/fjf0;-><init>()V

    .line 249
    .line 250
    .line 251
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method public final s(Lcom/p1/mobile/android/app/Act;Lv/VSwitchButton;ZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, "is_femalevip"

    .line 6
    .line 7
    const-string v1, "is_selected"

    .line 8
    .line 9
    const-string v2, "p_femalevip_page"

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {}, Ll/joa;->C3()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p5, v2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_0
    xor-int/lit8 p0, p3, 0x1

    .line 43
    .line 44
    invoke-virtual {p2, p0}, Lv/VSwitchButton;->setChecked(Z)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    xor-int/lit8 p2, p3, 0x1

    .line 49
    .line 50
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {}, Ll/joa;->C3()Z

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    filled-new-array {p2, p3}, [Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p5, v2, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 75
    .line 76
    .line 77
    const-string p2, "p_home,femalevip_set"

    .line 78
    .line 79
    invoke-static {p1, p2, p4}, Lcom/p1/mobile/putong/core/ui/purchase/c;->V(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 80
    .line 81
    .line 82
    return p0
.end method

.method public t()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfi;->a:Ll/nqy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p0, Ll/vfi;->j:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/android/app/Act;Ll/vfi$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfi;->J(Lcom/p1/mobile/android/app/Act;Ll/vfi$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v2, p0, Ll/vfi;->e:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->pick_tantan_credits_users:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    const-string v5, "e_femalevip_real"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/vfi;->s(Lcom/p1/mobile/android/app/Act;Lv/VSwitchButton;ZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v2, p0, Ll/vfi;->f:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->pick_tantan_credits_users:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    const-string v5, "e_femalevip_safety"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/vfi;->s(Lcom/p1/mobile/android/app/Act;Lv/VSwitchButton;ZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v2, p0, Ll/vfi;->g:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->ads_not_disturb:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    const-string v5, "e_femalevip_advertise"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/vfi;->s(Lcom/p1/mobile/android/app/Act;Lv/VSwitchButton;ZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v2, p0, Ll/vfi;->h:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->block_harassing_words:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    const-string v5, "e_femalevip_disturb"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/vfi;->s(Lcom/p1/mobile/android/app/Act;Lv/VSwitchButton;ZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
