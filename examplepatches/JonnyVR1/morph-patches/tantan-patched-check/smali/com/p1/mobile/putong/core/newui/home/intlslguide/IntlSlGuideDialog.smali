.class public Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Dialog;

.field public b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

.field public c:Ll/l4g0;

.field public d:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->m(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/x20;Landroid/content/DialogInterface;)V
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
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->l(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;Ll/x20;Ll/x20;)Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p2, v0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->d:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 34
    .line 35
    invoke-virtual {v0, p0, p1, p3, p4}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_2
    :goto_0
    return-object v1
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->a:Lcom/p1/mobile/android/app/Dialog;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$a;->a:[I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->d:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    aget p0, v0, p0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    if-eq p0, v0, :cond_2

    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x4

    .line 18
    if-eq p0, v0, :cond_0

    .line 19
    .line 20
    const-string p0, "A"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const-string p0, "D"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    const-string p0, "C"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    const-string p0, "B"

    .line 30
    .line 31
    return-object p0
.end method

.method public final g(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->h(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    sget-object p1, Ll/lhn;->INSTANCE:Ll/lhn;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/lhn;->a(Ljava/lang/String;)Ll/lhn$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/lhn$a;->d()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final h(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    if-eqz p0, :cond_2

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_2

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 47
    .line 48
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    if-nez p0, :cond_1

    .line 56
    .line 57
    iget-object p0, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/String;

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_1
    iget-object p0, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    .line 75
    .line 76
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_2

    .line 81
    .line 82
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Ljava/lang/String;

    .line 95
    .line 96
    return-object p0

    .line 97
    :cond_2
    :goto_0
    return-object v0
.end method

.method public final i(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/core/R$string;->O9:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Z2:I

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;ZLjava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    aget p3, v0, p3

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p3, v0, :cond_6

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p3, v0, :cond_4

    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    if-eq p3, p0, :cond_2

    .line 17
    .line 18
    const/4 p0, 0x4

    .line 19
    if-eq p3, p0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Uc:I

    .line 22
    .line 23
    filled-new-array {p5}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p1, p0, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    if-eqz p4, :cond_1

    .line 33
    .line 34
    sget p0, Lcom/p1/mobile/putong/core/R$string;->bd:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ad:I

    .line 38
    .line 39
    :goto_0
    filled-new-array {p5}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p1, p0, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_2
    if-eqz p4, :cond_3

    .line 49
    .line 50
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Zc:I

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Yc:I

    .line 54
    .line 55
    :goto_1
    filled-new-array {p5}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p1, p0, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->g(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    if-eqz p4, :cond_5

    .line 69
    .line 70
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Xc:I

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_5
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Wc:I

    .line 74
    .line 75
    :goto_2
    filled-new-array {p0, p5}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, p2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_6
    if-eqz p4, :cond_7

    .line 85
    .line 86
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Vc:I

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_7
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Uc:I

    .line 90
    .line 91
    :goto_3
    filled-new-array {p5}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-virtual {p1, p0, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0
.end method

.method public final k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;Z)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    aget p0, p0, p2

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    if-eq p0, p2, :cond_3

    .line 11
    .line 12
    const/4 p2, 0x2

    .line 13
    if-eq p0, p2, :cond_2

    .line 14
    .line 15
    const/4 p2, 0x3

    .line 16
    if-eq p0, p2, :cond_1

    .line 17
    .line 18
    const/4 p2, 0x4

    .line 19
    if-eq p0, p2, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/R$string;->cd:I

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->gd:I

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->fd:I

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ed:I

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_3
    if-eqz p3, :cond_4

    .line 50
    .line 51
    sget p0, Lcom/p1/mobile/putong/core/R$string;->dd:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->cd:I

    .line 55
    .line 56
    :goto_0
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public final synthetic l(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->d()V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic m(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->d()V

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

.method public final n()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "sl_scene_type"

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->f()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNonBinary()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const-string v0, "all"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    const-string v0, "female"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string v0, "male"

    .line 38
    .line 39
    :goto_0
    const-string v1, "gender"

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "e_sl_guide_impression_click"

    .line 50
    .line 51
    const-string v1, "p_sl_guide_impression_pop"

    .line 52
    .line 53
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/x20;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->N5:I

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
    move-object v1, v0

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->e(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->setAvatar(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 39
    .line 40
    :goto_0
    move-object v7, v1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const-string v1, ""

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->d:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 52
    .line 53
    invoke-virtual {p0, p1, v2, v6}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;Z)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->setTitle(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 61
    .line 62
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->d:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 63
    .line 64
    move-object v2, p0

    .line 65
    move-object v3, p1

    .line 66
    move-object v4, p2

    .line 67
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;ZLjava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->setSubtitle(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 75
    .line 76
    invoke-virtual {v2, v3, v6}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->i(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->setSendButtonText(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 84
    .line 85
    sget p1, Lcom/p1/mobile/putong/core/R$string;->s9:I

    .line 86
    .line 87
    invoke-virtual {v3, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->setSkipButtonText(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 95
    .line 96
    new-instance p1, Ll/odp;

    .line 97
    .line 98
    invoke-direct {p1, v2, p3}, Ll/odp;-><init>(Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;Ll/x20;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->setOnSendClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->b:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;

    .line 105
    .line 106
    new-instance p1, Ll/pdp;

    .line 107
    .line 108
    invoke-direct {p1, v2, p4}, Ll/pdp;-><init>(Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;Ll/x20;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->setOnSkipClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    sget p1, Ll/agc0;->o:I

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const/high16 p1, 0x42000000    # 32.0f

    .line 129
    .line 130
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    const/4 p3, 0x0

    .line 139
    invoke-virtual {p0, p2, p3, p1, p3}, Lcom/p1/mobile/android/app/Dialog$e;->C(IIII)Lcom/p1/mobile/android/app/Dialog$e;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const/4 p1, 0x1

    .line 144
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    iput-object p0, v2, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 153
    .line 154
    new-instance p1, Ll/qdp;

    .line 155
    .line 156
    invoke-direct {p1, p4}, Ll/qdp;-><init>(Ll/x20;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 160
    .line 161
    .line 162
    new-instance p0, Ll/l4g0;

    .line 163
    .line 164
    const-class p1, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;

    .line 165
    .line 166
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    const-string p2, "p_sl_guide_impression_pop"

    .line 171
    .line 172
    invoke-direct {p0, p2, p1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    iput-object p0, v2, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->c:Ll/l4g0;

    .line 176
    .line 177
    const-string p1, "sl_scene_type"

    .line 178
    .line 179
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->f()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    filled-new-array {p1}, [Ll/pf60;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 192
    .line 193
    .line 194
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 197
    .line 198
    .line 199
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->c:Ll/l4g0;

    .line 200
    .line 201
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 202
    .line 203
    .line 204
    return-void
.end method
