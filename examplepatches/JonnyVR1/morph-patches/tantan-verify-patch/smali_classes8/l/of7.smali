.class public Ll/of7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile e:Ll/of7;


# instance fields
.field public a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/jl80;

.field public d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/of7;->a:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/of7;->b:Lrx/subjects/a;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/of7;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/of7;->y(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    return-void
.end method

.method public static synthetic c(Ll/x20;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    const-string p2, "live"

    .line 8
    .line 9
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const-string p1, "e_function_guide_live_accept"

    .line 16
    .line 17
    const-string p2, "p_function_guide_live"

    .line 18
    .line 19
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p2, "chat"

    .line 24
    .line 25
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    const-string p1, "e_function_guide_quickchat_accept"

    .line 32
    .line 33
    const-string p2, "p_function_guide_quickchat"

    .line 34
    .line 35
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const-string p2, "feed"

    .line 40
    .line 41
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    const-string p1, "e_function_guide_moment_accept"

    .line 48
    .line 49
    const-string p2, "p_function_guide_moment"

    .line 50
    .line 51
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_0
    invoke-interface {p0}, Ll/x20;->call()V

    .line 55
    .line 56
    .line 57
    :cond_3
    return-void
.end method

.method public static synthetic d(Ll/of7;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/of7;->x(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/of7;ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/of7;->w(ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/bm5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bm5;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic h(Ll/of7;ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/of7;->v(ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lrx/Notification;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "e_lowmatch_quickchat_accept"

    .line 8
    .line 9
    const-string v0, "p_lowmatch_quickchat"

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static bridge synthetic l(Ll/of7;)Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    return-object p0
.end method

.method public static o()Ll/of7;
    .locals 2

    .line 1
    sget-object v0, Ll/of7;->e:Ll/of7;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/of7;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/of7;->e:Ll/of7;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/of7;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/of7;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/of7;->e:Ll/of7;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/of7;->e:Ll/of7;

    .line 27
    .line 28
    return-object v0
.end method

.method public static r()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    const-string v2, "invalid"

    .line 28
    .line 29
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 38
    .line 39
    const-string v1, "rejected"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    :cond_0
    const/4 v0, 0x1

    .line 48
    return v0

    .line 49
    :cond_1
    const/4 v0, 0x0

    .line 50
    return v0
.end method

.method public static s()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    const-string v1, "pending"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    return v0

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 38
    return v0
.end method

.method public static t()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    const-string v2, "pending"

    .line 28
    .line 29
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 38
    .line 39
    const-string v1, "verified"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    :cond_0
    const/4 v0, 0x0

    .line 48
    return v0

    .line 49
    :cond_1
    const/4 v0, 0x1

    .line 50
    return v0
.end method

.method public static u()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    const-string v1, "verified"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    return v0

    .line 37
    :cond_0
    const/4 v0, 0x1

    .line 38
    return v0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget v0, Ll/kec0;->I3:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v0, Ll/adc0;->je:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VText;

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "%s \u52a0\u901f\u66dd\u5149\u751f\u6548\u6210\u529f"

    .line 32
    .line 33
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    filled-new-array {p2}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    const-string v3, "#FE7E1D"

    .line 50
    .line 51
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v2, p2, v3, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    new-instance p2, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 67
    .line 68
    invoke-direct {p2, p1, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    const/4 p0, 0x1

    .line 72
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/16 p1, 0xbb8

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->GROWTH_NEW_EXPOSURE_USER_GUIDE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public B(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget v0, Ll/kec0;->J3:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v0, Ll/adc0;->je:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VText;

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "\u4f18\u5148\u63a8\u8350"

    .line 32
    .line 33
    filled-new-array {v2}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "#FE7E1D"

    .line 42
    .line 43
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v4, "\u4f60\u6b63\u88ab\u4f18\u5148\u63a8\u8350\uff0c\u5feb\u53f3\u6ed1\u4f60\u559c\u6b22\u7684\u4eba"

    .line 52
    .line 53
    invoke-static {v4, v2, v3, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    const-string v0, "e_new_user_bonus"

    .line 61
    .line 62
    const-string v1, "p_suggest_users_home_view"

    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 68
    .line 69
    invoke-direct {v0, p1, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const/16 p1, 0xbb8

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->GROWTH_NEW_USER_GUIDE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget v0, Ll/kec0;->K3:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v0, Ll/adc0;->k3:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VDraweeView;

    .line 22
    .line 23
    sget v1, Ll/adc0;->Ge:I

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lv/VText;

    .line 30
    .line 31
    sget v2, Ll/adc0;->Fe:I

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lv/VText;

    .line 38
    .line 39
    sget v3, Ll/adc0;->C0:I

    .line 40
    .line 41
    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lv/VButton;

    .line 46
    .line 47
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    const/4 p2, 0x3

    .line 51
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 56
    .line 57
    .line 58
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 59
    .line 60
    const/4 v1, 0x4

    .line 61
    const/16 v4, 0x1e

    .line 62
    .line 63
    invoke-virtual {p2, v0, p3, v1, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 64
    .line 65
    .line 66
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 69
    .line 70
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-eqz p2, :cond_1

    .line 79
    .line 80
    const-string p2, "\u4ed6\u6b63\u5728\u7b49\u4f60\u804a\u5929\u54e6..."

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const-string p2, "\u5979\u6b63\u5728\u7b49\u4f60\u804a\u5929\u54e6..."

    .line 84
    .line 85
    :goto_0
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    new-instance p2, Ll/lf7;

    .line 89
    .line 90
    invoke-direct {p2, p4}, Ll/lf7;-><init>(Ll/x20;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v3, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    const-string p2, "e_lowmatch_quickchat_accept"

    .line 97
    .line 98
    const-string p3, "p_lowmatch_quickchat"

    .line 99
    .line 100
    invoke-static {p2, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    new-instance p2, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 104
    .line 105
    invoke-direct {p2, p1, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    const/4 p0, 0x2

    .line 109
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const/16 p1, 0x1770

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 120
    .line 121
    const/high16 p2, 0x42900000    # 72.0f

    .line 122
    .line 123
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    const/4 p3, -0x1

    .line 128
    invoke-direct {p1, p3, p2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->y(Landroid/view/ViewGroup$LayoutParams;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->GROWTH_PLAN_A:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public D(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget v0, Ll/kec0;->L3:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v0, Ll/adc0;->k3:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VDraweeView;

    .line 22
    .line 23
    sget v1, Ll/adc0;->j3:I

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lv/VDraweeView;

    .line 30
    .line 31
    sget v2, Ll/adc0;->Ge:I

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lv/VText;

    .line 38
    .line 39
    sget v3, Ll/adc0;->C0:I

    .line 40
    .line 41
    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lv/VButton;

    .line 46
    .line 47
    const/4 v4, 0x3

    .line 48
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 53
    .line 54
    .line 55
    const-string v4, "live"

    .line 56
    .line 57
    invoke-static {v4, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_1

    .line 62
    .line 63
    new-instance p3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 64
    .line 65
    sget v4, Ll/qa00;->w:I

    .line 66
    .line 67
    invoke-direct {p3, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 68
    .line 69
    .line 70
    const/high16 v4, 0x41980000    # 19.0f

    .line 71
    .line 72
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    iput v4, p3, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 77
    .line 78
    sget v4, Ll/qa00;->g:I

    .line 79
    .line 80
    iput v4, p3, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 81
    .line 82
    sget v4, Ll/qa00;->m:I

    .line 83
    .line 84
    iput v4, p3, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 85
    .line 86
    invoke-virtual {v0, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    .line 88
    .line 89
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 90
    .line 91
    invoke-virtual {p3, v0, p4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const/4 p3, 0x1

    .line 95
    invoke-static {v1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    const-string p3, "\u5979\u76f4\u64ad\u65f6pick\u4e86\u4f60\uff0c\u5728\u7ebf\u7b49\u4f60\u8fc7\u53bb\u804a\u5929~"

    .line 99
    .line 100
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    const-string p3, "e_function_guide_live_accept"

    .line 104
    .line 105
    const-string p4, "p_function_guide_live"

    .line 106
    .line 107
    invoke-static {p3, p4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    const-string v1, "chat"

    .line 112
    .line 113
    invoke-static {v1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    sget p3, Ll/dbc0;->Y7:I

    .line 120
    .line 121
    invoke-virtual {p1, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    invoke-virtual {v0, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 126
    .line 127
    .line 128
    const-string p3, "\u6709\u4eba\u559c\u6b22\u4f60\uff0c\u60f3\u8ddf\u4f60\u804a\u5929\uff0c\u5feb\u8fc7\u53bb\u770b\u770b"

    .line 129
    .line 130
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    const-string p3, "e_function_guide_quickchat_accept"

    .line 134
    .line 135
    const-string p4, "p_function_guide_quickchat"

    .line 136
    .line 137
    invoke-static {p3, p4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_2
    const-string v1, "feed"

    .line 142
    .line 143
    invoke-static {v1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_3

    .line 148
    .line 149
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 153
    .line 154
    invoke-virtual {p3, v0, p4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const-string p3, "e_function_guide_moment_accept"

    .line 158
    .line 159
    const-string p4, "p_function_guide_moment"

    .line 160
    .line 161
    invoke-static {p3, p4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_3
    :goto_0
    new-instance p3, Ll/ef7;

    .line 165
    .line 166
    invoke-direct {p3, p5, p2}, Ll/ef7;-><init>(Ll/x20;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-static {v3, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 170
    .line 171
    .line 172
    new-instance p2, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 173
    .line 174
    invoke-direct {p2, p1, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 175
    .line 176
    .line 177
    const/4 p0, 0x2

    .line 178
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    const/16 p1, 0x1770

    .line 183
    .line 184
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 189
    .line 190
    const/high16 p2, 0x42900000    # 72.0f

    .line 191
    .line 192
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    const/4 p3, -0x1

    .line 197
    invoke-direct {p1, p3, p2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->y(Landroid/view/ViewGroup$LayoutParams;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->GROWTH_PLAN_B:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 205
    .line 206
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 219
    .line 220
    .line 221
    return-void
.end method

.method public E(Lcom/p1/mobile/android/app/Act;ZZ)V
    .locals 8

    .line 1
    if-eqz p1, :cond_7

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v0, v0, Ll/dkb;->I3:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 44
    .line 45
    .line 46
    :cond_1
    if-eqz p2, :cond_2

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 51
    .line 52
    iget-object v0, v0, Ll/dkb;->I3:Ll/jxd0;

    .line 53
    .line 54
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    const-string v0, "p_face_verified_jump"

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    const-string v0, ""

    .line 63
    .line 64
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    if-eqz p3, :cond_3

    .line 71
    .line 72
    const-string v0, "p_face_verified_nojump_failed"

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    const-string v0, "p_face_verified_nojump"

    .line 76
    .line 77
    :cond_4
    :goto_1
    move-object v4, v0

    .line 78
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Ll/kec0;->P3:I

    .line 83
    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/jl80$a;

    .line 90
    .line 91
    invoke-direct {v1, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0, p2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 107
    .line 108
    const/4 v1, 0x0

    .line 109
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 113
    .line 114
    invoke-virtual {v0}, Ll/jl80;->L()Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    sget v2, Ll/adc0;->Ob:I

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 125
    .line 126
    iput-object v0, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 127
    .line 128
    if-eqz v0, :cond_7

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->T()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_5

    .line 135
    .line 136
    goto/16 :goto_2

    .line 137
    .line 138
    :cond_5
    iget-object v0, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 139
    .line 140
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->V(Z)V

    .line 141
    .line 142
    .line 143
    const/4 v0, 0x1

    .line 144
    if-nez p2, :cond_6

    .line 145
    .line 146
    if-eqz p3, :cond_6

    .line 147
    .line 148
    move v1, v0

    .line 149
    :cond_6
    iget-object v2, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 150
    .line 151
    invoke-virtual {v2, p1, v1}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->W(Lcom/p1/mobile/android/app/Act;Z)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 155
    .line 156
    iget-object v7, v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->l:Lv/VButton;

    .line 157
    .line 158
    new-instance v1, Ll/df7;

    .line 159
    .line 160
    move-object v2, p0

    .line 161
    move-object v6, p1

    .line 162
    move v3, p2

    .line 163
    move v5, p3

    .line 164
    invoke-direct/range {v1 .. v6}, Ll/df7;-><init>(Ll/of7;ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v7, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 168
    .line 169
    .line 170
    iget-object p0, v2, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->n:Lv/VText;

    .line 173
    .line 174
    new-instance v1, Ll/ff7;

    .line 175
    .line 176
    invoke-direct/range {v1 .. v6}, Ll/ff7;-><init>(Ll/of7;ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;)V

    .line 177
    .line 178
    .line 179
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 180
    .line 181
    .line 182
    iget-object p0, v2, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 183
    .line 184
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->m:Lv/VButton;

    .line 185
    .line 186
    new-instance p1, Ll/gf7;

    .line 187
    .line 188
    invoke-direct {p1, v2, v4, v6}, Ll/gf7;-><init>(Ll/of7;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 189
    .line 190
    .line 191
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 192
    .line 193
    .line 194
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 195
    .line 196
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 197
    .line 198
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {v6, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    new-instance p1, Ll/hf7;

    .line 211
    .line 212
    invoke-direct {p1}, Ll/hf7;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    new-instance p1, Ll/if7;

    .line 220
    .line 221
    invoke-direct {p1}, Ll/if7;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    new-instance p1, Ll/jf7;

    .line 229
    .line 230
    invoke-direct {p1, v2}, Ll/jf7;-><init>(Ll/of7;)V

    .line 231
    .line 232
    .line 233
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    new-instance p1, Ll/bm5;

    .line 242
    .line 243
    invoke-direct {p1, v6, v0}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 244
    .line 245
    .line 246
    new-instance p2, Ll/of7$b;

    .line 247
    .line 248
    invoke-direct {p2, v2, p1}, Ll/of7$b;-><init>(Ll/of7;Ll/bm5;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {p1, p2}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 252
    .line 253
    .line 254
    iget-object p2, v2, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 255
    .line 256
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->k:Landroid/widget/TextView;

    .line 257
    .line 258
    const-string p3, "#FE7E1D"

    .line 259
    .line 260
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 261
    .line 262
    .line 263
    move-result p3

    .line 264
    new-instance v0, Ll/kf7;

    .line 265
    .line 266
    invoke-direct {v0, p1}, Ll/kf7;-><init>(Ll/bm5;)V

    .line 267
    .line 268
    .line 269
    const-string p1, "\u300a\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 270
    .line 271
    invoke-static {p2, p1, p3, v0}, Ll/fsj0;->a(Landroid/widget/TextView;Ljava/lang/String;ILl/x20;)V

    .line 272
    .line 273
    .line 274
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 275
    .line 276
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-static {v4, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 285
    .line 286
    .line 287
    iget-object p2, v2, Ll/of7;->c:Ll/jl80;

    .line 288
    .line 289
    new-instance p3, Ll/of7$c;

    .line 290
    .line 291
    invoke-direct {p3, v2, p1, p0}, Ll/of7$c;-><init>(Ll/of7;Ll/l4g0;Ll/kcg0;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {p2, p3}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 295
    .line 296
    .line 297
    iget-object p0, v2, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 298
    .line 299
    invoke-virtual {p0, v3, v5, v4}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->X(ZZLjava/lang/String;)V

    .line 300
    .line 301
    .line 302
    iget-object p0, v2, Ll/of7;->c:Ll/jl80;

    .line 303
    .line 304
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 305
    .line 306
    .line 307
    :cond_7
    :goto_2
    return-void
.end method

.method public m(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->T()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const-string v0, "\u5df2\u63d0\u4ea4\u8ba4\u8bc1\u5ba1\u6838"

    .line 31
    .line 32
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/d09;->m()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ll/of7;->r()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->W(Lcom/p1/mobile/android/app/Act;Z)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    iget-object p0, p0, Ll/of7;->c:Ll/jl80;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 57
    .line 58
    .line 59
    :cond_3
    :goto_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/of7;->c:Ll/jl80;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iput-object v1, p0, Ll/of7;->c:Ll/jl80;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/of7;->a:Lrx/subjects/a;

    .line 26
    .line 27
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/of7;->b:Lrx/subjects/a;

    .line 31
    .line 32
    invoke-virtual {p0}, Lrx/subjects/a;->onCompleted()V

    .line 33
    .line 34
    .line 35
    sput-object v1, Ll/of7;->e:Ll/of7;

    .line 36
    .line 37
    return-void
.end method

.method public p()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/of7;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/of7;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic v(ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p5, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 2
    .line 3
    iget-object p5, p5, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->j:Lv/VCheckBox;

    .line 4
    .line 5
    invoke-virtual {p5}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 6
    .line 7
    .line 8
    move-result p5

    .line 9
    const-string v0, "e_face_verified_nojump_confirm"

    .line 10
    .line 11
    const-string v1, "e_face_verified_jump_confirm"

    .line 12
    .line 13
    const-string v2, "start_verification_ornot"

    .line 14
    .line 15
    if-nez p5, :cond_1

    .line 16
    .line 17
    iget-object p5, p0, Ll/of7;->d:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 18
    .line 19
    iget-object p5, p5, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->i:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {p5}, Landroid/view/View;->getVisibility()I

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    if-nez p5, :cond_1

    .line 26
    .line 27
    const-string p0, "\u8bf7\u786e\u8ba4\u5e76\u52fe\u9009\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae"

    .line 28
    .line 29
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    move-object v0, v1

    .line 35
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {p0}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {v0, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    if-eqz p1, :cond_2

    .line 50
    .line 51
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-static {v2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    filled-new-array {p3}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-static {v1, p2, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    if-eqz p3, :cond_3

    .line 66
    .line 67
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-static {v2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    filled-new-array {p3}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    const-string p5, "e_face_verified_nojump_failed_reverified"

    .line 78
    .line 79
    invoke-static {p5, p2, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 84
    .line 85
    invoke-static {v2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    filled-new-array {p3}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-static {v0, p2, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 94
    .line 95
    .line 96
    :goto_0
    const-string p2, "fromSpamDlg"

    .line 97
    .line 98
    invoke-static {p4, p2}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    if-eqz p1, :cond_4

    .line 102
    .line 103
    iget-object p0, p0, Ll/of7;->c:Ll/jl80;

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 106
    .line 107
    .line 108
    :cond_4
    return-void
.end method

.method public final synthetic w(ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "e_face_verified_jump_cancel"

    .line 4
    .line 5
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/of7;->c:Ll/jl80;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    if-eqz p3, :cond_1

    .line 15
    .line 16
    const-string p1, "e_face_verified_nojump_failed_signout"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const-string p1, "e_face_verified_nojump_signout"

    .line 20
    .line 21
    :goto_0
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/of7;->c:Ll/jl80;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-static {p0, p1}, Ll/uqb0;->Z0(ZZ)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance p1, Ll/mf7;

    .line 44
    .line 45
    invoke-direct {p1}, Ll/mf7;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance p2, Ll/nf7;

    .line 49
    .line 50
    invoke-direct {p2, p4}, Ll/nf7;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic x(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p3, "e_face_verified_nojump_failed_changeavatar"

    .line 2
    .line 3
    invoke-static {p3, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/of7;->c:Ll/jl80;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 p3, 0x0

    .line 20
    const/4 v0, 0x1

    .line 21
    const-string v1, "from_profile_frag_tips_up_pic"

    .line 22
    .line 23
    invoke-static {p2, p1, v1, p3, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p3, Ll/of7$a;

    .line 28
    .line 29
    invoke-direct {p3, p0}, Ll/of7$a;-><init>(Ll/of7;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 1

    .line 1
    const-string v0, "pending"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "verified"

    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Ll/of7;->c:Ll/jl80;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Ll/of7;->c:Ll/jl80;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/of7;->c:Ll/jl80;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/of7;->b:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
