.class public Ll/k3h;
.super Ll/w1e;
.source "SourceFile"


# static fields
.field public static a:Ll/w30;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field

.field public static b:Ll/th0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w1e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->C0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/mxg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mxg;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->y3:I

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/mxg;->j(I)Ll/mxg;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->w3:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/mxg;->d(I)Ll/mxg;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->v3:I

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/mxg;->g(I)Ll/mxg;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->x3:I

    .line 27
    .line 28
    new-instance v0, Ll/e1h;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Ll/e1h;-><init>(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2, v0}, Ll/mxg;->i(ILjava/lang/Runnable;)Ll/mxg;

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/mxg;->show()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic B(Ljava/lang/Long;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static B0(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    :try_start_0
    new-array v1, v1, [Ljava/lang/String;

    .line 5
    .line 6
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v3, 0x1d

    .line 9
    .line 10
    if-gt v2, v3, :cond_0

    .line 11
    .line 12
    const-string v2, "android.permission.READ_PHONE_STATE"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v2, "android.permission.READ_PHONE_NUMBERS"

    .line 16
    .line 17
    :goto_0
    const/4 v3, 0x0

    .line 18
    aput-object v2, v1, v3

    .line 19
    .line 20
    invoke-static {v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    const-string v1, "phone"

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    :cond_1
    move-object p0, v0

    .line 40
    :goto_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    const-string v1, "+86"

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    const/4 v0, 0x3

    .line 55
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :cond_2
    return-object v0
.end method

.method public static synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->D0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static C0()V
    .locals 1

    .line 1
    sget-object v0, Ll/k3h;->b:Ll/th0;

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
    sget-object v0, Ll/k3h;->b:Ll/th0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/th0;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/k3h;->b:Ll/th0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/th0;->c()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    sput-object v0, Ll/k3h;->b:Ll/th0;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic D(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->C0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static D0()V
    .locals 1

    .line 1
    sget-object v0, Ll/k3h;->a:Ll/w30;

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
    sget-object v0, Ll/k3h;->a:Ll/w30;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w30;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/k3h;->a:Ll/w30;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    sput-object v0, Ll/k3h;->a:Ll/w30;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic E(ZLl/x20;Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    const/4 p4, 0x1

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return p4

    .line 8
    :cond_0
    new-instance p0, Ll/mxg;

    .line 9
    .line 10
    invoke-direct {p0, p2}, Ll/mxg;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->W3:I

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/mxg;->j(I)Ll/mxg;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->X3:I

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Ll/mxg;->d(I)Ll/mxg;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->l:I

    .line 26
    .line 27
    new-instance v0, Ll/i1h;

    .line 28
    .line 29
    invoke-direct {v0, p3, p1}, Ll/i1h;-><init>(Ll/y20;Ll/x20;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2, v0}, Ll/mxg;->i(ILjava/lang/Runnable;)Ll/mxg;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/mxg;->g(I)Ll/mxg;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/mxg;->show()V

    .line 43
    .line 44
    .line 45
    invoke-static {p4}, Ll/wf70;->l0(Z)V

    .line 46
    .line 47
    .line 48
    return p4
.end method

.method public static E0(Lcom/p1/mobile/android/app/Act;I)V
    .locals 3

    .line 1
    new-instance v0, Ll/mxg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mxg;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->q4:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/mxg;->j(I)Ll/mxg;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Ll/mxg;->c(Z)Ll/mxg;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->p4:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/mxg;->d(I)Ll/mxg;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->q3:I

    .line 24
    .line 25
    new-instance v2, Ll/h1h;

    .line 26
    .line 27
    invoke-direct {v2, p0, p1}, Ll/h1h;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ll/mxg;->i(ILjava/lang/Runnable;)Ll/mxg;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/mxg;->g(I)Ll/mxg;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/mxg;->show()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static F0(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/pcj;Ll/pcj;Ll/x20;Ll/x20;Ll/y20;Ll/y20;Ll/y20;ZZZZ)Landroid/view/Menu;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/view/Menu;",
            "Ljava/lang/String;",
            "Ll/pcj<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ll/pcj<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/FollowshipStatus;",
            ">;ZZZZ)",
            "Landroid/view/Menu;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p3, :cond_0

    move-object p3, v0

    goto :goto_0

    .line 1
    :cond_0
    invoke-interface {p3}, Ll/pcj;->call()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    :goto_0
    invoke-static {}, Ll/vqb0;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-virtual {p3}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object p2

    const-string p7, "normal"

    invoke-static {p2, p7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 4
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->R3:I

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    new-instance p7, Ll/g1h;

    invoke-direct {p7, p0, p5, p3, p6}, Ll/g1h;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Ll/x20;)V

    .line 5
    invoke-interface {p2, p7}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_4

    .line 6
    :cond_1
    invoke-static {p2}, Ll/mrb0;->X(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object p5

    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    move-result p5

    if-nez p5, :cond_9

    .line 7
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_4

    iget-boolean p5, p3, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    if-eqz p5, :cond_4

    invoke-static {}, Ll/j4h;->c()Z

    move-result p5

    if-eqz p5, :cond_4

    .line 8
    sget-object p5, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    invoke-virtual {p5, p2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object p5

    .line 9
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p6

    if-eqz p6, :cond_4

    iget-object p6, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 10
    invoke-static {p6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p6

    if-eqz p6, :cond_4

    iget-object p6, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    iget-object p6, p6, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 11
    const-string v1, "matched"

    invoke-static {p6, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p6

    if-nez p6, :cond_4

    .line 12
    sget p6, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    invoke-virtual {p0, p6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p6

    .line 13
    iget-object v2, p5, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 14
    iget-object v0, p5, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 15
    const-string v2, "following"

    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 16
    sget p5, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    invoke-virtual {p0, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p6

    goto :goto_1

    .line 17
    :cond_2
    iget-object p5, p5, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    iget-object p5, p5, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    invoke-static {p5, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p5

    if-eqz p5, :cond_3

    .line 18
    sget p5, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    invoke-virtual {p0, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p6

    .line 19
    :cond_3
    :goto_1
    invoke-interface {p1, p6}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p5

    new-instance p6, Ll/r1h;

    invoke-direct {p6, p9, v0}, Ll/r1h;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/FollowshipStatus;)V

    .line 20
    invoke-interface {p5, p6}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 21
    :cond_4
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_5

    .line 22
    sget p5, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    invoke-virtual {p0, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p5

    invoke-interface {p1, p5}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p5

    new-instance p6, Ll/c2h;

    invoke-direct {p6, p0, p2, p3}, Ll/c2h;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 23
    invoke-interface {p5, p6}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_5
    if-eqz p12, :cond_8

    .line 24
    sget-object p5, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    iget-object p5, p5, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    invoke-virtual {p5}, Ll/mof0;->n()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/util/List;

    if-eqz p5, :cond_6

    .line 25
    invoke-interface {p5, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_6

    const/4 p5, 0x1

    goto :goto_2

    :cond_6
    const/4 p5, 0x0

    .line 26
    :goto_2
    new-instance p6, Ll/n2h;

    invoke-direct {p6, p0, p2, p5, p7}, Ll/n2h;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/y20;)V

    if-nez p5, :cond_7

    .line 27
    sget p7, Lcom/p1/mobile/putong/feed/R$string;->v4:I

    goto :goto_3

    :cond_7
    sget p7, Lcom/p1/mobile/putong/feed/R$string;->y4:I

    .line 28
    :goto_3
    invoke-virtual {p0, p7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p7

    .line 29
    invoke-interface {p1, p7}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p7

    new-instance v0, Ll/y2h;

    invoke-direct {v0, p5, p6, p0, p8}, Ll/y2h;-><init>(ZLl/x20;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 30
    invoke-interface {p7, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_8
    if-eqz p10, :cond_9

    .line 31
    sget p5, Lcom/p1/mobile/putong/feed/R$string;->z4:I

    invoke-virtual {p0, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p5

    invoke-interface {p1, p5}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p5

    new-instance p6, Ll/g3h;

    invoke-direct {p6, p0, p2}, Ll/g3h;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 32
    invoke-interface {p5, p6}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_9
    :goto_4
    if-eqz p11, :cond_a

    .line 33
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_a

    iget-object p2, p3, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_a

    .line 34
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->e:I

    invoke-interface {p1, p2}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object p2

    new-instance p5, Ll/h3h;

    invoke-direct {p5, p3}, Ll/h3h;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 35
    invoke-interface {p2, p5}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 36
    :cond_a
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_b

    if-eqz p13, :cond_b

    .line 37
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->o:I

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    new-instance p3, Ll/i3h;

    invoke-direct {p3, p0, p4}, Ll/i3h;-><init>(Lcom/p1/mobile/android/app/Act;Ll/pcj;)V

    .line 38
    invoke-interface {p2, p3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_b
    return-object p1
.end method

.method public static synthetic G(Lcom/p1/mobile/android/app/Act;Ll/pcj;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/snh;->k()Ll/snh;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    invoke-virtual {p2, p0, p1}, Ll/snh;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static G0(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/pcj;Ll/pcj;Ll/x20;Ll/y20;Ll/y20;Ll/y20;ZZZ)Landroid/view/Menu;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/view/Menu;",
            "Ljava/lang/String;",
            "Ll/pcj<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ll/pcj<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/FollowshipStatus;",
            ">;ZZZ)",
            "Landroid/view/Menu;"
        }
    .end annotation

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v13, 0x1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    move-object/from16 v6, p5

    .line 12
    .line 13
    move-object/from16 v7, p6

    .line 14
    .line 15
    move-object/from16 v8, p7

    .line 16
    .line 17
    move-object/from16 v9, p8

    .line 18
    .line 19
    move/from16 v10, p9

    .line 20
    .line 21
    move/from16 v11, p10

    .line 22
    .line 23
    move/from16 v12, p11

    .line 24
    .line 25
    invoke-static/range {v0 .. v13}, Ll/k3h;->F0(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/pcj;Ll/pcj;Ll/x20;Ll/x20;Ll/y20;Ll/y20;Ll/y20;ZZZZ)Landroid/view/Menu;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic H(Landroid/widget/TextView;Lv/VMaterialEdit;Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p5, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {p5}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "bind_mobile"

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 19
    .line 20
    const/4 v0, 0x6

    .line 21
    iput v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    iput p0, p5, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 28
    .line 29
    invoke-static {p1}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p0, p5, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    invoke-static {p2, p0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-virtual {p2, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 41
    .line 42
    .line 43
    const-string v0, "..."

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0, p5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->send(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p5

    .line 56
    new-instance v0, Ll/a2h;

    .line 57
    .line 58
    invoke-direct {v0, p3, p2, p4, p1}, Ll/a2h;-><init>(Lv/VMaterialEdit;Lv/VButton_FakeShadowSmall;Lcom/p1/mobile/android/app/Act;Lv/VMaterialEdit;)V

    .line 59
    .line 60
    .line 61
    new-instance p3, Ll/b2h;

    .line 62
    .line 63
    invoke-direct {p3, p2, p1}, Ll/b2h;-><init>(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, p3, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p5, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static H0(Lcom/p1/mobile/android/app/Act;Ll/l4g0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/tec0;->n0:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/fgc0;->h:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/j3h;

    .line 32
    .line 33
    invoke-direct {v2, p1}, Ll/j3h;-><init>(Ll/l4g0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B0(Landroid/content/DialogInterface$OnShowListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, Ll/w0h;

    .line 41
    .line 42
    invoke-direct {v2, p1}, Ll/w0h;-><init>(Ll/l4g0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget v1, Ll/hdc0;->s0:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Ll/x0h;

    .line 60
    .line 61
    invoke-direct {v2, p1}, Ll/x0h;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    sget v1, Ll/hdc0;->b2:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    new-instance v2, Ll/y0h;

    .line 74
    .line 75
    invoke-direct {v2, p1}, Ll/y0h;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    sget v1, Ll/hdc0;->c2:I

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    new-instance v2, Ll/z0h;

    .line 88
    .line 89
    invoke-direct {v2, v0, p0, p1}, Ll/z0h;-><init>(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    new-instance v0, Ll/a1h;

    .line 103
    .line 104
    invoke-direct {v0}, Ll/a1h;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance v0, Ll/b1h;

    .line 112
    .line 113
    invoke-direct {v0, p1}, Ll/b1h;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/android/app/Act;ZLl/y20;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->supportInvalidateOptionsMenu()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 10
    .line 11
    .line 12
    :cond_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->U3:I

    .line 15
    .line 16
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->T3:I

    .line 22
    .line 23
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    :goto_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v0, Ll/lbc0;->Z1:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p3, p0}, Ll/o1j0;->q(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    xor-int/lit8 p0, p1, 0x1

    .line 47
    .line 48
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public static I0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_passive_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "userpassive_showfrom"

    .line 22
    .line 23
    const-string v3, "moment"

    .line 24
    .line 25
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "userpassive_word"

    .line 30
    .line 31
    invoke-static {v3, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {v2, p1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v2, "p_user_passive_show_nearby"

    .line 40
    .line 41
    invoke-virtual {v1, v2, p1}, Ll/rj50;->V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0, v0}, Ll/k3h;->H0(Lcom/p1/mobile/android/app/Act;Ll/l4g0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic J(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "p_user_passive_show_nearby"

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, v0, v1, v1}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static J0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_passive_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "userpassive_showfrom"

    .line 22
    .line 23
    const-string v3, "moment_evaluate"

    .line 24
    .line 25
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "userpassive_word"

    .line 30
    .line 31
    invoke-static {v3, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {v2, p1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v2, "p_user_passive_show_nearby"

    .line 40
    .line 41
    invoke-virtual {v1, v2, p1}, Ll/rj50;->V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0, v0}, Ll/k3h;->H0(Lcom/p1/mobile/android/app/Act;Ll/l4g0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic K(ZLandroid/widget/TextView;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "\\+"

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    invoke-virtual {p2, p0, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static K0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/v1h;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/v1h;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/w1h;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/w1h;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/th0$a;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget p1, Lcom/p1/mobile/putong/common/R$string;->I0:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ll/x1h;

    .line 39
    .line 40
    invoke-direct {p1, p2}, Ll/x1h;-><init>(Ll/x20;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/y1h;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/y1h;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    sput-object p0, Ll/k3h;->b:Ll/th0;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    const/4 p3, 0x0

    .line 2
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {p0, p1, v0, p3, p2}, Ll/orb0;->a(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public static L0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->r0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Ll/iyh;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/r2h;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1, p2}, Ll/r2h;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/k3h;->M0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic M(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

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
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Ll/l3h;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static M0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    new-instance v0, Ll/u2h;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/u2h;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/v2h;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/v2h;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->O4:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->I4:I

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->H4:I

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->L4:I

    .line 43
    .line 44
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->J4:I

    .line 49
    .line 50
    invoke-virtual {p0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    sget v5, Lcom/p1/mobile/putong/feed/R$string;->P4:I

    .line 55
    .line 56
    invoke-virtual {p0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    sget v6, Lcom/p1/mobile/putong/feed/R$string;->M4:I

    .line 61
    .line 62
    invoke-virtual {p0, v6}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    sget v7, Lcom/p1/mobile/putong/feed/R$string;->N4:I

    .line 67
    .line 68
    invoke-virtual {p0, v7}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    sget v8, Lcom/p1/mobile/putong/feed/R$string;->K4:I

    .line 73
    .line 74
    invoke-virtual {p0, v8}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    const/16 v9, 0x9

    .line 79
    .line 80
    new-array v9, v9, [Ljava/lang/CharSequence;

    .line 81
    .line 82
    const/4 v10, 0x0

    .line 83
    aput-object v0, v9, v10

    .line 84
    .line 85
    const/4 v0, 0x1

    .line 86
    aput-object v1, v9, v0

    .line 87
    .line 88
    const/4 v1, 0x2

    .line 89
    aput-object v2, v9, v1

    .line 90
    .line 91
    const/4 v1, 0x3

    .line 92
    aput-object v3, v9, v1

    .line 93
    .line 94
    const/4 v1, 0x4

    .line 95
    aput-object v4, v9, v1

    .line 96
    .line 97
    const/4 v1, 0x5

    .line 98
    aput-object v5, v9, v1

    .line 99
    .line 100
    const/4 v1, 0x6

    .line 101
    aput-object v6, v9, v1

    .line 102
    .line 103
    const/4 v1, 0x7

    .line 104
    aput-object v7, v9, v1

    .line 105
    .line 106
    const/16 v1, 0x8

    .line 107
    .line 108
    aput-object v8, v9, v1

    .line 109
    .line 110
    invoke-static {v9}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    new-instance v2, Ll/w30$b;

    .line 115
    .line 116
    invoke-direct {v2, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 117
    .line 118
    .line 119
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    new-instance v4, Ll/w2h;

    .line 126
    .line 127
    invoke-direct {v4}, Ll/w2h;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v3, v4}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-virtual {v3, v1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    new-instance v4, Ll/x2h;

    .line 139
    .line 140
    invoke-direct {v4}, Ll/x2h;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3, v4}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    new-instance v4, Ll/z2h;

    .line 148
    .line 149
    invoke-direct {v4, v1, p0, p1}, Ll/z2h;-><init>(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v3, v4}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2}, Ll/w30$b;->F()Ll/w30;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    sput-object p0, Ll/k3h;->a:Ll/w30;

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 162
    .line 163
    .line 164
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 165
    .line 166
    .line 167
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic N(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 7
    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->c5:I

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-static {p0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    invoke-static {p2}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static N0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k3h;->O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p2, Ll/g2h;

    .line 10
    .line 11
    invoke-direct {p2}, Ll/g2h;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p2, Ll/h2h;

    .line 23
    .line 24
    invoke-direct {p2, p1}, Ll/h2h;-><init>(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic O(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Ll/y20;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->D0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 p3, 0x1

    .line 9
    sub-int/2addr p0, p3

    .line 10
    if-ne p5, p0, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p3}, Ll/w1e$b;->p(Z)Ll/w1e$b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/16 p4, 0xa

    .line 21
    .line 22
    invoke-virtual {p0, p4}, Ll/w1e$b;->E(I)Ll/w1e$b;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/16 p4, 0x64

    .line 27
    .line 28
    invoke-virtual {p0, p4}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, p2}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p2, Ll/c3h;

    .line 41
    .line 42
    invoke-direct {p2, p1}, Ll/c3h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p2}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 49
    .line 50
    .line 51
    invoke-static {p3}, Ll/wf70;->l0(Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    iget-object p0, p4, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 56
    .line 57
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/Media;",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->o:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ll/k2h;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Ll/k2h;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isMe()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1}, Ll/mrb0;->X(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ll/l2h;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/l2h;-><init>()V

    .line 47
    .line 48
    .line 49
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-static {v1, v2, v3}, Ll/jyb;->X(Ljava/lang/Object;Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_1

    .line 62
    .line 63
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 64
    .line 65
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 66
    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->x4:I

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->w4:I

    .line 73
    .line 74
    :goto_0
    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance v1, Ll/m2h;

    .line 79
    .line 80
    invoke-direct {v1, p0, p2}, Ll/m2h;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_1
    return-object v0
.end method

.method public static synthetic P(Lcom/p1/mobile/android/app/Act;I)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.settings.LOCATION_SOURCE_SETTINGS"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    new-instance p1, Ljava/lang/Exception;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "Dlg location exception:"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static P0(Lcom/p1/mobile/android/app/Act;Ll/x20;ZLl/x20;Ljava/lang/String;)V
    .locals 10
    .param p1    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/x20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/tec0;->q0:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/hdc0;->v:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    move-object v3, v1

    .line 19
    check-cast v3, Landroid/widget/TextView;

    .line 20
    .line 21
    sget v1, Ll/hdc0;->i2:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    move-object v4, v1

    .line 28
    check-cast v4, Lv/VMaterialEdit;

    .line 29
    .line 30
    sget v1, Ll/hdc0;->x:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    move-object v6, v1

    .line 37
    check-cast v6, Lv/VMaterialEdit;

    .line 38
    .line 39
    sget v1, Ll/hdc0;->S:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lv/VButton_FakeShadowSmall;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    sget v5, Lcom/p1/mobile/putong/feed/R$string;->m0:I

    .line 52
    .line 53
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v5}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    sget v7, Lcom/p1/mobile/putong/feed/R$string;->y1:I

    .line 66
    .line 67
    invoke-virtual {v5, v7}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v5, v2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const/4 v9, 0x0

    .line 76
    invoke-virtual {v2, v0, v9}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->Z4:I

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->s0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->W4:I

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0, v9}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0, v9}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v2, Ll/j1h;

    .line 101
    .line 102
    invoke-direct {v2, p1}, Ll/j1h;-><init>(Ll/x20;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    new-instance v2, Ll/k1h;

    .line 114
    .line 115
    move-object v5, v6

    .line 116
    move-object v6, v3

    .line 117
    move-object v3, v4

    .line 118
    move-object v4, v5

    .line 119
    move-object v5, p0

    .line 120
    move-object v8, p3

    .line 121
    invoke-direct/range {v2 .. v8}, Ll/k1h;-><init>(Lv/VMaterialEdit;Lv/VMaterialEdit;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V

    .line 122
    .line 123
    .line 124
    move-object p0, v4

    .line 125
    move-object v4, v3

    .line 126
    move-object v3, v6

    .line 127
    move-object v6, p0

    .line 128
    move-object p0, v7

    .line 129
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog;->o0(Ljava/lang/Runnable;)V

    .line 130
    .line 131
    .line 132
    new-instance p1, Ll/l1h;

    .line 133
    .line 134
    invoke-direct {p1, p0}, Ll/l1h;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->m0(Ljava/lang/Runnable;)V

    .line 138
    .line 139
    .line 140
    new-instance p1, Ll/m1h;

    .line 141
    .line 142
    invoke-direct {p1, v5, v9, v3}, Ll/m1h;-><init>(Lcom/p1/mobile/android/app/Act;ZLandroid/widget/TextView;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    .line 147
    .line 148
    new-instance v2, Ll/n1h;

    .line 149
    .line 150
    move-object v7, v5

    .line 151
    move-object v5, v1

    .line 152
    invoke-direct/range {v2 .. v7}, Ll/n1h;-><init>(Landroid/widget/TextView;Lv/VMaterialEdit;Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;Lcom/p1/mobile/android/app/Act;)V

    .line 153
    .line 154
    .line 155
    move-object v5, v7

    .line 156
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    .line 158
    .line 159
    new-instance p1, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    const-string p3, "+"

    .line 162
    .line 163
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    sget-object p3, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 167
    .line 168
    invoke-virtual {p3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p3

    .line 172
    check-cast p3, Ll/nsb;

    .line 173
    .line 174
    iget p3, p3, Ll/nsb;->b:I

    .line 175
    .line 176
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v5}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-static {p1}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    const/4 p3, 0x1

    .line 195
    if-nez p1, :cond_1

    .line 196
    .line 197
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-lez p1, :cond_0

    .line 206
    .line 207
    goto :goto_0

    .line 208
    :cond_0
    move p3, v9

    .line 209
    :goto_0
    invoke-static {v1, p3}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_1
    invoke-virtual {v1, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v1, v9}, Landroid/view/View;->setClickable(Z)V

    .line 217
    .line 218
    .line 219
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->d5:I

    .line 220
    .line 221
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v5}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    const/16 p3, 0x3c

    .line 229
    .line 230
    invoke-static {p1, p3}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-virtual {v5, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    new-instance p3, Ll/o1h;

    .line 239
    .line 240
    invoke-direct {p3}, Ll/o1h;-><init>()V

    .line 241
    .line 242
    .line 243
    new-instance v0, Ll/p1h;

    .line 244
    .line 245
    invoke-direct {v0}, Ll/p1h;-><init>()V

    .line 246
    .line 247
    .line 248
    new-instance v2, Ll/q1h;

    .line 249
    .line 250
    invoke-direct {v2, v1, v4}, Ll/q1h;-><init>(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;)V

    .line 251
    .line 252
    .line 253
    invoke-static {p3, v0, v2}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 254
    .line 255
    .line 256
    move-result-object p3

    .line 257
    invoke-virtual {p1, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 258
    .line 259
    .line 260
    :goto_1
    invoke-virtual {v4}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    new-instance p3, Ll/s1h;

    .line 265
    .line 266
    invoke-direct {p3, v1, v4}, Ll/s1h;-><init>(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;)V

    .line 267
    .line 268
    .line 269
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 270
    .line 271
    .line 272
    move-result-object p3

    .line 273
    invoke-virtual {p1, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 274
    .line 275
    .line 276
    invoke-static {v5}, Ll/k3h;->B0(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 281
    .line 282
    .line 283
    move-result p3

    .line 284
    if-nez p3, :cond_2

    .line 285
    .line 286
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 287
    .line 288
    .line 289
    :cond_2
    if-eqz p2, :cond_3

    .line 290
    .line 291
    const-string p1, "on"

    .line 292
    .line 293
    goto :goto_2

    .line 294
    :cond_3
    const-string p1, "off"

    .line 295
    .line 296
    :goto_2
    filled-new-array {p1}, [Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 301
    .line 302
    .line 303
    move-result-object p2

    .line 304
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p2

    .line 308
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 309
    .line 310
    .line 311
    move-result p2

    .line 312
    if-eqz p2, :cond_4

    .line 313
    .line 314
    const-string p2, "no_number"

    .line 315
    .line 316
    goto :goto_3

    .line 317
    :cond_4
    const-string p2, "secret_number"

    .line 318
    .line 319
    :goto_3
    filled-new-array {p2}, [Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p2

    .line 323
    aget-object p1, p1, v9

    .line 324
    .line 325
    aget-object p2, p2, v9

    .line 326
    .line 327
    invoke-static {p1, p2, p4}, Ll/l3h;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 331
    .line 332
    .line 333
    return-void
.end method

.method public static synthetic Q(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const/4 p1, 0x1

    .line 27
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    new-array p0, p0, [Ll/tfj0$a;

    .line 6
    .line 7
    const-string p1, "e_user_passive_popup_ok"

    .line 8
    .line 9
    const-string v0, "p_user_passive_popup"

    .line 10
    .line 11
    invoke-static {p1, v0, p0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic T(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 3
    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->c5:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/4 p1, 0x1

    .line 35
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public static synthetic U(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->C0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/snh;->k()Ll/snh;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Ll/snh;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic W(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p0}, Ll/wf70;->l0(Z)V

    .line 6
    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Q4:I

    .line 9
    .line 10
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->G4:I

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/lu6;->b(II)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/Report;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Report;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/data/Report;->CATEGORY_DEFAULT:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->category:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p3, v0, Lcom/p1/mobile/putong/data/Report;->value:Ljava/lang/String;

    .line 17
    .line 18
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 19
    .line 20
    invoke-virtual {p3, p1, p2, v0}, Lcom/p1/mobile/putong/feed/api/b;->t4(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/a3h;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Ll/a3h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    new-instance p3, Ll/b3h;

    .line 30
    .line 31
    invoke-direct {p3, p0}, Ll/b3h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/android/app/Act;ZLandroid/widget/TextView;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    new-instance v0, Ll/z1h;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2}, Ll/z1h;-><init>(ZLandroid/widget/TextView;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p3, p0, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->dialogCCode(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic c0(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/k3h;->y0(Lcom/p1/mobile/android/app/Dialog;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic d0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/ob20;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/ob20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v0, 0x64

    .line 14
    .line 15
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic f0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->C0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public static synthetic h(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 3
    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->c5:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/4 p1, 0x1

    .line 35
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/y20;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 14
    .line 15
    xor-int/lit8 v1, p2, 0x1

    .line 16
    .line 17
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/feed/api/b$a;->M(Ljava/lang/String;Z)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/c1h;

    .line 22
    .line 23
    invoke-direct {v0, p0, p2, p3}, Ll/c1h;-><init>(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/d1h;

    .line 27
    .line 28
    invoke-direct {p2, p0}, Ll/d1h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic i(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->C0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic i0(Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/pf60;

    .line 6
    .line 7
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Q4:I

    .line 5
    .line 6
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->G4:I

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/lu6;->b(II)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic k0(Lv/VMaterialEdit;Lv/VMaterialEdit;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 25
    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 37
    .line 38
    const-string p1, "bind_mobile"

    .line 39
    .line 40
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 45
    .line 46
    const/4 v1, 0x6

    .line 47
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 48
    .line 49
    invoke-static {p3}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 54
    .line 55
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 66
    .line 67
    invoke-static {p3}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iput p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->verify(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance p1, Ll/i2h;

    .line 88
    .line 89
    invoke-direct {p1, p2, p4, p5}, Ll/i2h;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V

    .line 90
    .line 91
    .line 92
    new-instance p3, Ll/j2h;

    .line 93
    .line 94
    invoke-direct {p3, p2}, Ll/j2h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 95
    .line 96
    .line 97
    const/4 p2, 0x0

    .line 98
    invoke-static {p1, p3, p2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-static {p3}, Ll/mrb0;->M(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-static {p3}, Ll/l51;->K(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->m5:I

    .line 23
    .line 24
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Ll/k3h;->y0(Lcom/p1/mobile/android/app/Dialog;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-interface {p2}, Ll/x20;->call()V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    invoke-virtual {p1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic m(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m0(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic o(Ll/y20;Ll/x20;)V
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
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic o0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->C0()V

    return-void
.end method

.method public static synthetic p(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p3, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "android.intent.action.DIAL"

    .line 4
    .line 5
    invoke-direct {p3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v0, Ll/hdc0;->c2:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "tel:"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p3, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    new-array p0, p0, [Ll/tfj0$a;

    .line 53
    .line 54
    const-string p1, "e_user_passive_popup_number"

    .line 55
    .line 56
    const-string p2, "p_user_passive_popup"

    .line 57
    .line 58
    invoke-static {p1, p2, p0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic p0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Ll/pf60;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic q0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->C0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    new-array p0, p0, [Ll/tfj0$a;

    .line 6
    .line 7
    const-string p1, "e_user_passive_popup_cancel"

    .line 8
    .line 9
    const-string v0, "p_user_passive_popup"

    .line 10
    .line 11
    invoke-static {p1, v0, p0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic s()V
    .locals 0

    .line 1
    invoke-static {}, Ll/k3h;->D0()V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Ll/x20;)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->g3(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/t1h;

    .line 25
    .line 26
    invoke-direct {p2, p0, p3}, Ll/t1h;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 27
    .line 28
    .line 29
    new-instance p3, Ll/u1h;

    .line 30
    .line 31
    invoke-direct {p3, p0}, Ll/u1h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic u(Lv/VMaterialEdit;Lv/VButton_FakeShadowSmall;Lcom/p1/mobile/android/app/Act;Lv/VMaterialEdit;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    invoke-virtual {p1, p0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->d5:I

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/16 p4, 0x3c

    .line 22
    .line 23
    invoke-static {p0, p4}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p2, Ll/o2h;

    .line 32
    .line 33
    invoke-direct {p2, p1}, Ll/o2h;-><init>(Lv/VButton_FakeShadowSmall;)V

    .line 34
    .line 35
    .line 36
    new-instance p4, Ll/p2h;

    .line 37
    .line 38
    invoke-direct {p4}, Ll/p2h;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/q2h;

    .line 42
    .line 43
    invoke-direct {v0, p1, p3}, Ll/q2h;-><init>(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, p4, v0}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Ll/x20;Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    new-instance p4, Ll/mxg;

    .line 2
    .line 3
    invoke-direct {p4, p0}, Ll/mxg;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->K3:I

    .line 7
    .line 8
    invoke-virtual {p4, v0}, Ll/mxg;->d(I)Ll/mxg;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->r:I

    .line 13
    .line 14
    new-instance v1, Ll/f1h;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1, p2, p3}, Ll/f1h;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p4, v0, v1}, Ll/mxg;->i(ILjava/lang/Runnable;)Ll/mxg;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/mxg;->g(I)Ll/mxg;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/mxg;->show()V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public static synthetic v(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Report;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Report;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Report;->CATEGORY_DEFAULT:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->category:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->value:Ljava/lang/String;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, p1, v0}, Ll/mrb0;->O(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/s2h;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/s2h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/t2h;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/t2h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/d2h;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/d2h;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/w1h;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/w1h;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/th0$a;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget p1, Lcom/p1/mobile/putong/common/R$string;->h:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ll/e2h;

    .line 39
    .line 40
    invoke-direct {p1, p2}, Ll/e2h;-><init>(Ll/x20;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/f2h;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/f2h;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    sput-object p0, Ll/k3h;->b:Ll/th0;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/d3h;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/d3h;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/w1h;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/w1h;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/th0$a;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance p1, Ll/e3h;

    .line 53
    .line 54
    invoke-direct {p1, p2}, Ll/e3h;-><init>(Ll/x20;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    new-instance p1, Ll/f3h;

    .line 68
    .line 69
    invoke-direct {p1}, Ll/f3h;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    sput-object p0, Ll/k3h;->b:Ll/th0;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 82
    .line 83
    .line 84
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/MenuItem;)Z
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const-string v5, "moment_page"

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    invoke-static/range {v0 .. v5}, Ll/orb0;->D(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public static x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Ll/y20;Ll/y20;ZZZ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/FollowshipStatus;",
            ">;ZZZ)V"
        }
    .end annotation

    .line 1
    new-instance v1, Landroidx/appcompat/view/menu/MenuBuilder;

    .line 2
    .line 3
    invoke-direct {v1, p0}, Landroidx/appcompat/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance v3, Ll/v0h;

    .line 7
    .line 8
    invoke-direct {v3, p2}, Ll/v0h;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 9
    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x0

    .line 13
    move-object v0, p0

    .line 14
    move-object v2, p1

    .line 15
    move-object v6, p3

    .line 16
    move-object/from16 v7, p4

    .line 17
    .line 18
    move-object/from16 v8, p5

    .line 19
    .line 20
    move/from16 v9, p6

    .line 21
    .line 22
    move/from16 v10, p7

    .line 23
    .line 24
    move/from16 v11, p8

    .line 25
    .line 26
    invoke-static/range {v0 .. v11}, Ll/k3h;->G0(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/pcj;Ll/pcj;Ll/x20;Ll/y20;Ll/y20;Ll/y20;ZZZ)Landroid/view/Menu;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-lez p2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->j0(Landroid/view/Menu;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public static synthetic y(Lv/VButton_FakeShadowSmall;Ljava/lang/Long;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x3c

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p1, v0, v2

    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "%ds"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public static y0(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 3
    .param p0    # Lcom/p1/mobile/android/app/Dialog;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "input_method"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void

    .line 68
    :catch_0
    move-exception p0

    .line 69
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic z(Ll/y20;Lcom/p1/mobile/putong/data/FollowshipStatus;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public static z0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0}, Ll/k3h;->A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
