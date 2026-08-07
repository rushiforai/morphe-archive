.class public Lcom/p1/mobile/putong/core/newui/main/NewMainAct;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;
.source "SourceFile"

# interfaces
.implements Ll/w1j0;
.implements Ll/hmq0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct<",
        "Lcom/p1/mobile/putong/core/newui/main/a;",
        ">;",
        "Ll/w1j0;",
        "Ll/hmq0;"
    }
.end annotation


# static fields
.field public static final r:Ll/jxd0;

.field public static s:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public m:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

.field public final n:J

.field public o:Landroid/widget/PopupWindow;

.field public p:Z

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "s_r_s_b_l"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->r:Ll/jxd0;

    .line 11
    .line 12
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->s:Lrx/subjects/b;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->n:J

    .line 9
    .line 10
    const-string v0, "Activity Init"

    .line 11
    .line 12
    invoke-static {v0}, Ll/t4j;->g(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->q:Ljava/util/List;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic A4(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic A5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d4()V

    return-void
.end method

.method public static synthetic B4()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->r:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic B5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->K3()V

    return-void
.end method

.method private synthetic B6()V
    .locals 1

    .line 1
    new-instance v0, Ll/f530;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic C4()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->p6(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic C5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->N3()V

    return-void
.end method

.method public static synthetic D4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->r6(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->U6()V

    return-void
.end method

.method public static synthetic E4(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    const-string p0, "debug_open"

    .line 2
    .line 3
    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/k;->C3(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "debug_close"

    .line 15
    .line 16
    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/k;->C3(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const-string p0, "staging1"

    .line 28
    .line 29
    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    const-string p0, "http://m.staging1.p1staff.com/monetization/codapay/?from="

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/k;->D3(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    const-string p0, "staging2"

    .line 42
    .line 43
    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    const-string p0, "http://m.staging2.p1staff.com/monetization/codapay/?from="

    .line 50
    .line 51
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/k;->D3(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    return-void
.end method

.method public static synthetic E5()V
    .locals 1

    .line 1
    invoke-static {}, Ll/rlg;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "\u590d\u5236token\u6210\u529f"

    .line 9
    .line 10
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic E6()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 6
    .line 7
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x1

    .line 14
    const-string v3, "edit_data_button"

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v0, v1, v3, v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "preview_type"

    .line 22
    .line 23
    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    const-string v1, "REFACTOR_TAG"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic F4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F5(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sget-wide v2, Lcom/p1/mobile/putong/app/TantanApp;->f:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    const-wide/32 v2, 0x927c0

    .line 11
    .line 12
    .line 13
    cmp-long p0, v0, v2

    .line 14
    .line 15
    if-gtz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "recover NewMainAct"

    .line 23
    .line 24
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Um(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    invoke-static {}, Ll/g9r;->b()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic F6()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 6
    .line 7
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "edit_data_button"

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-static {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "preview_type"

    .line 22
    .line 23
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    const-string v1, "REFACTOR_TAG"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic G4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->V6()V

    return-void
.end method

.method public static synthetic G5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Y3()V

    return-void
.end method

.method private synthetic G6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "test"

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/o2c;->i(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic H4(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic H5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->w6()V

    return-void
.end method

.method private synthetic H6()V
    .locals 1

    .line 1
    const-string v0, "tantanapp://jumpToMarket?iosLink=xxx&original=test&apkName=com.p1.mobile.putong&&fallback=https%3A%2F%2Ftantanapp.com%2F&appType=tantan"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic I4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->x6()V

    return-void
.end method

.method public static synthetic I5(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    const-string p0, "\u5237\u65b0\u63a5\u53e3"

    .line 2
    .line 3
    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/o7a;->k3()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "\u672c\u5730\u6dfb\u52a0\u4e00\u4e2abanner"

    .line 18
    .line 19
    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/o7a;->m3()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const-string p0, "\u672c\u5730\u6dfb\u52a0\u4e00\u7bc7\u6587\u7ae0"

    .line 34
    .line 35
    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/o7a;->l3()V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public static synthetic J4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->R6()V

    return-void
.end method

.method public static synthetic J5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->F6()V

    return-void
.end method

.method public static synthetic K4(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private K5()V
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/widget/PopupWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/kec0;->Ae:I

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 34
    .line 35
    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 39
    .line 40
    invoke-virtual {p0, v4}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic L4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static L5(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic L6()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 4
    .line 5
    const-string v1, "swipe"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/mk8;->p3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/y430;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/y430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/z430;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/z430;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic M4()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bze;->h()Ll/bze;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/bze;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->N5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->H6()V

    return-void
.end method

.method public static N5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->O5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method private synthetic N6()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 4
    .line 5
    const-string v1, "message"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/mk8;->p3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/c530;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/c530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/d530;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/d530;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic O4(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->s:Lrx/subjects/b;

    .line 2
    .line 3
    new-instance v1, Ll/pf60;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static O5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;)Landroid/content/Intent;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/data/NavigationIntent;",
            "Lcom/p1/mobile/putong/data/NavigationCardIntent;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const-wide/16 v4, -0x1

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->P5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;J)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic P4()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "is_fake_avatar_query_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static P5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;J)Landroid/content/Intent;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/data/NavigationIntent;",
            "Lcom/p1/mobile/putong/data/NavigationCardIntent;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-string p0, "extra_navigation_to_tenum"

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const-string p0, "extra_navigation_card_to"

    .line 26
    .line 27
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    :cond_1
    const-wide/16 v1, 0x0

    .line 31
    .line 32
    cmp-long p0, p4, v1

    .line 33
    .line 34
    if-lez p0, :cond_2

    .line 35
    .line 36
    const-string p0, "extra_heartbeat_expire_time"

    .line 37
    .line 38
    invoke-virtual {v0, p0, p4, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    :cond_2
    const-string p0, "moment"

    .line 42
    .line 43
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0

    .line 51
    :cond_3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    invoke-interface {p3}, Ljava/util/Map;->size()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-lez p0, :cond_4

    .line 62
    .line 63
    new-instance p0, Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-direct {p0, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 66
    .line 67
    .line 68
    const-string p1, "extra_param_2"

    .line 69
    .line 70
    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    :cond_4
    return-object v0
.end method

.method private synthetic P6()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/vd0;->H(Lcom/p1/mobile/android/app/Act;)Ll/vd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vd0;->O()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->q6(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static Q5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-string p0, "extra_navigation_to_tenum"

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string p0, "extra_scroll_to_setting_bottom"

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object v0
.end method

.method private synthetic Q6()V
    .locals 3

    .line 1
    new-instance v0, Ll/tk5$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/tk5$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->a6(Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "\u5b8c\u5584\u8d44\u6599\uff0c\u8ba4\u8bc6\u66f4\u591a\u7406\u60f3%s"

    .line 18
    .line 19
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/tk5$a;->k(Ljava/lang/CharSequence;)Ll/tk5$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "\u4e30\u5bcc\u7684\u8d44\u6599\u66f4\u53d7\u6b22\u8fce\uff0c\u540c\u65f6\u53ef\u5411\u4f60\u63a8\u8350\u66f4\u591a\u7b26\u5408\u4f60\u7684\u7406\u60f3\u578b\u7684\u4eba"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/tk5$a;->j(Ljava/lang/CharSequence;)Ll/tk5$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "https://auto.tancdn.com/v1/raw/e2aa538c-be50-4e82-94af-5ed7d02c0a8b14.webp"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/tk5$a;->f(Ljava/lang/String;)Ll/tk5$a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/s430;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/s430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/tk5$a;->c(Landroid/view/View$OnClickListener;)Ll/tk5$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/tk5$a;->a()Ll/tk5;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/tk5;->show()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->J6()V

    return-void
.end method

.method private synthetic R6()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, "tantan://profile/edit?mode=dating&from=from_ideal_type_mine_tab_guide"

    .line 4
    .line 5
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->G3()V

    return-void
.end method

.method public static S5(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const/high16 p0, 0x4000000

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "extra_to_caption"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private synthetic S6()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, "tantan://moment/detail?uid=-1&mid=3434451013413637115&web=1"

    .line 4
    .line 5
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->E6()V

    return-void
.end method

.method public static T5(Landroid/content/Context;ZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const p0, 0x10008000

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    const-string p0, "EXTRA_SHOW_TUTORIAL"

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string p0, "extra_show_secret_crush_introduction"

    .line 20
    .line 21
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method private synthetic T6()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;->a2(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->X6(I)V

    return-void
.end method

.method private synthetic U6()V
    .locals 2

    .line 1
    sget-object v0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/lhl;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/lhl;->t(Z)V

    .line 10
    .line 11
    .line 12
    const-class v0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/l51;->L(Landroid/content/Context;Ljava/lang/Class;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Landroidx/fragment/app/Fragment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->C6(Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method private V5(Landroid/view/MotionEvent;Z)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->q6()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/app/PutongFrag;->D4(Landroid/view/MotionEvent;Z)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->D4(Landroid/view/MotionEvent;Z)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method private synthetic V6()V
    .locals 2

    .line 1
    sget-object v0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/lhl;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/lhl;->u(Z)V

    .line 10
    .line 11
    .line 12
    const-class v0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/l51;->L(Landroid/content/Context;Ljava/lang/Class;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->u6()V

    return-void
.end method

.method private synthetic W6()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/l9c;->j()V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance v0, Landroid/os/Handler;

    .line 15
    .line 16
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct$a;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 v2, 0x1f4

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->y6()V

    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o6()V

    return-void
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->t6(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static Z6(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static synthetic a5()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/SliderData;->new_()Lcom/p1/mobile/putong/data/SliderData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "asldfjsiofui283sdhf9s08923jkdsjfi"

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->supplier:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->retryClose:I

    .line 13
    .line 14
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->delayClose:I

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->allowClose:I

    .line 18
    .line 19
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Ll/esf0;->v(Lcom/p1/mobile/putong/data/SliderData;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static a7(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p4}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->b7(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "extra_message_push_type"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->m6()V

    return-void
.end method

.method public static b7(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "extra_message_user_id"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "from"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "extra_to_message"

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string p0, "media_keyboard"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->n6()V

    return-void
.end method

.method public static c7(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-string p0, "extra_navigation_to_tenum"

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public static synthetic d5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->z6()V

    return-void
.end method

.method private synthetic e4()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/w430;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/w430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic e5()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->p2:Ll/wyd0;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    iget-object v0, v0, Ll/dkb;->o2:Ll/vxd0;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic f5()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/SliderData;->new_()Lcom/p1/mobile/putong/data/SliderData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "asldfjsiofui283sdhf9s08923jkdsjfi"

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->supplier:I

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    iput v2, v0, Lcom/p1/mobile/putong/data/SliderData;->retryClose:I

    .line 14
    .line 15
    const/4 v2, 0x5

    .line 16
    iput v2, v0, Lcom/p1/mobile/putong/data/SliderData;->delayClose:I

    .line 17
    .line 18
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->allowClose:I

    .line 19
    .line 20
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, v0}, Ll/esf0;->v(Lcom/p1/mobile/putong/data/SliderData;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic g5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->N6()V

    return-void
.end method

.method private synthetic h4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->U5()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic h5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->s6(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->S6()V

    return-void
.end method

.method public static synthetic j5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->P6()V

    return-void
.end method

.method public static synthetic k5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/wgx;->A()Ll/wgx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/wgx;->N(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->W6()V

    return-void
.end method

.method public static l6(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "live"

    .line 9
    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v1, "extra_navigation_to_tenum"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string p0, "main_jump_live_tag"

    .line 20
    .line 21
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string p0, "main_jump_live_has_params"

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public static synthetic m4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M3()V

    return-void
.end method

.method public static synthetic m5()V
    .locals 4

    .line 1
    invoke-static {}, Ll/vnb;->q1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/vnb;->p1()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "\u3010"

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, ","

    .line 20
    .line 21
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, "\u3011"

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private synthetic m6()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "staging1"

    .line 6
    .line 7
    const-string v1, "staging2"

    .line 8
    .line 9
    const-string v2, "debug_open"

    .line 10
    .line 11
    const-string v3, "debug_close"

    .line 12
    .line 13
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ll/a530;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/a530;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic n4()V
    .locals 0

    .line 1
    invoke-static {}, Ll/rlg;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->I6(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method private synthetic n6()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "close"

    .line 6
    .line 7
    const-string v2, "\u4e0a\u4f20\u6570\u636e"

    .line 8
    .line 9
    const-string v3, "open"

    .line 10
    .line 11
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct$b;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct$b;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic o4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->L3()V

    return-void
.end method

.method public static synthetic o5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->B6()V

    return-void
.end method

.method private synthetic o6()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u672c\u5730\u6dfb\u52a0\u4e00\u4e2abanner"

    .line 6
    .line 7
    const-string v1, "\u672c\u5730\u6dfb\u52a0\u4e00\u7bc7\u6587\u7ae0"

    .line 8
    .line 9
    const-string v2, "\u5237\u65b0\u63a5\u53e3"

    .line 10
    .line 11
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/e530;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/e530;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic p4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p5()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->i()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic p6()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, "netPictureDlg"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/a0g;->S(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->e4()V

    return-void
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Q6()V

    return-void
.end method

.method public static q7(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const/high16 p0, 0x4000000

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "extra_to_conversation"

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public static synthetic r4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->K6(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic r5()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mk8;->m3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static r7(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const/high16 p0, 0x4000000

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "navigation_to_picks"

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public static synthetic s4()V
    .locals 1

    .line 1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/esf0;->i()Lcom/p1/mobile/putong/data/SliderData;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic s5()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/esf0;->v(Lcom/p1/mobile/putong/data/SliderData;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic t5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->p6()V

    return-void
.end method

.method public static synthetic u4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M6(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic u5()V
    .locals 2

    .line 1
    sget-object v0, Ll/u1z;->j:Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/u1z;->k:Ll/jxd0;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic v4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->I3()V

    return-void
.end method

.method public static synthetic v5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Landroidx/fragment/app/Fragment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->A6(Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method public static synthetic w4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->T6()V

    return-void
.end method

.method public static synthetic w5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->G6()V

    return-void
.end method

.method public static synthetic x4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->D6(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic x5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->O6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->h4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic y5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->v6()V

    return-void
.end method

.method public static synthetic z4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->X3()V

    return-void
.end method

.method public static synthetic z5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->L6()V

    return-void
.end method

.method private synthetic z6()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->toJson()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    const/16 v2, 0x2710

    .line 15
    .line 16
    if-ge v1, v2, :cond_0

    .line 17
    .line 18
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->q:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "debugUserList.size="

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->q:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method


# virtual methods
.method public final synthetic A6(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    const/16 v0, 0x312

    .line 6
    .line 7
    invoke-static {p0, p1, v0}, Ll/f5g;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic C6(Landroidx/fragment/app/Fragment;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AppealInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 8
    .line 9
    const-string v1, "before"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Ll/wxf;->e()Ll/wxf;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/x430;

    .line 18
    .line 19
    invoke-direct {v2, p0, p1}, Ll/x430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Landroidx/fragment/app/Fragment;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p0, v2, v0}, Ll/wxf;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Lcom/p1/mobile/putong/core/data/AppealInfo;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic D6(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "curMD5:"

    .line 9
    .line 10
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/uqb0;->Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->h:Ll/wyd0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, "\nData:"

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public G()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->I7(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method public final synthetic G3()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "\u63a2\u63a2\u5e01\u67e5\u8be2"

    .line 6
    .line 7
    const-string v2, "boost"

    .line 8
    .line 9
    const-string v3, "start"

    .line 10
    .line 11
    const-string v4, "vip\u5546\u54c1\u67e5\u8be2"

    .line 12
    .line 13
    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/r430;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/r430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic I3()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 17
    .line 18
    new-instance v1, Ll/t430;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/t430;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/qtk;->Q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic I6(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 5

    .line 1
    const-string p1, "\u53f3\u6ed1\u65e0\u914d\u5bf9\u5f15\u5bfc"

    .line 2
    .line 3
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string p2, "e_add_lifestyle"

    .line 8
    .line 9
    const-string p3, "tantan://profile/edit?mode=guidePicAndTag&from=right_swipe_add_lifestyle"

    .line 10
    .line 11
    const-string v0, "p_add_lifestyle_guidance"

    .line 12
    .line 13
    const-string v1, "\u7acb\u5373\u6dfb\u52a0"

    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/data/DatingGuideData;->new_()Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->titles:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 30
    .line 31
    iget v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 32
    .line 33
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_0

    .line 50
    .line 51
    const-string v4, "\u7537\u751f"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const-string v4, "\u5973\u751f"

    .line 55
    .line 56
    :goto_0
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    const-string v4, "\u521a\u521a\u770b\u8fc7\u7684%d\u4e2a%s\u66f4\u60f3\u4e86\u89e3\u4f60\u7684\u5174\u8da3\u7231\u597d"

    .line 61
    .line 62
    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->subTitles:Ljava/util/List;

    .line 70
    .line 71
    const-string v2, "\u6dfb\u52a0\u751f\u6d3b\u7167\u5c55\u793a\u4f60\u7684\u5174\u8da3\u7231\u597d\uff0c\u66f4\u5bb9\u6613\u914d\u5bf9"

    .line 72
    .line 73
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->button:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pageId:Ljava/lang/String;

    .line 79
    .line 80
    iput-object p3, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->deeplink:Ljava/lang/String;

    .line 81
    .line 82
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 83
    .line 84
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 87
    .line 88
    invoke-virtual {p4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 89
    .line 90
    .line 91
    move-result-object p4

    .line 92
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 93
    .line 94
    .line 95
    move-result p4

    .line 96
    if-eqz p4, :cond_1

    .line 97
    .line 98
    const-string p4, "https://auto.tancdn.com/v1/raw/8da6f26f-c9b6-440e-9bbc-57f1a124a66f14.webp"

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_1
    const-string p4, "https://auto.tancdn.com/v1/raw/484a6490-eca3-4af1-bf18-0b43971e70c114.webp"

    .line 102
    .line 103
    :goto_1
    invoke-interface {p3, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->buttonId:Ljava/lang/String;

    .line 107
    .line 108
    new-instance p2, Ll/b9c$b;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    invoke-direct {p2, p0}, Ll/b9c$b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2, p1}, Ll/b9c$b;->c(Lcom/p1/mobile/putong/core/data/DatingGuideData;)Ll/b9c$b;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const-string p1, "right_swipe_no_match"

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Ll/b9c$b;->b(Ljava/lang/String;)Ll/b9c$b;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0}, Ll/b9c$b;->a()Ll/b9c;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Ll/b9c;->show()V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_2
    const-string p1, "\u8fde\u7eed\u5de6\u6ed1\u5f15\u5bfc"

    .line 134
    .line 135
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_4

    .line 140
    .line 141
    invoke-static {}, Lcom/p1/mobile/putong/core/data/DatingGuideData;->new_()Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->titles:Ljava/util/List;

    .line 146
    .line 147
    const-string p3, "\u4e30\u5bcc\u4e2a\u4eba\u8d44\u6599\n\u4e3a\u4f60\u63a8\u8350\u66f4\u591a\u5408\u9002\u7684\u4eba"

    .line 148
    .line 149
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->subTitles:Ljava/util/List;

    .line 153
    .line 154
    const-string p3, "\u4e2a\u4eba\u8d44\u6599\u8d8a\u5b8c\u5584\uff0c\u5339\u914d\u8d8a\u7cbe\u51c6"

    .line 155
    .line 156
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    const-string p2, "\u7acb\u5373\u5b8c\u5584"

    .line 160
    .line 161
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->button:Ljava/lang/String;

    .line 162
    .line 163
    const-string p2, "tantan://profile/edit?mode=dating&from=left_swipe_complete_profile"

    .line 164
    .line 165
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->deeplink:Ljava/lang/String;

    .line 166
    .line 167
    const-string p2, "p_left_swipe_complete_profile"

    .line 168
    .line 169
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pageId:Ljava/lang/String;

    .line 170
    .line 171
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 172
    .line 173
    const-string p3, "https://auto.tancdn.com/v1/raw/4bb88ee6-8f5e-47fe-9ff3-2d2affccb71914.webp"

    .line 174
    .line 175
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    invoke-static {}, Ll/gra;->z()Z

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    if-eqz p2, :cond_3

    .line 183
    .line 184
    const-string p2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxNM042TTU3VTUyNkY2MlpaTEY3TUw1UVNGVklOVjE0IiwidyI6NDIwLCJoIjozMzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1ODUzMjgzMTUyNjkxMzN9.png"

    .line 185
    .line 186
    invoke-static {p2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 191
    .line 192
    :cond_3
    const-string p2, "e_complete_profile"

    .line 193
    .line 194
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->buttonId:Ljava/lang/String;

    .line 195
    .line 196
    new-instance p2, Ll/b9c$b;

    .line 197
    .line 198
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-direct {p2, p0}, Ll/b9c$b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p2, p1}, Ll/b9c$b;->c(Lcom/p1/mobile/putong/core/data/DatingGuideData;)Ll/b9c$b;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-virtual {p0}, Ll/b9c$b;->a()Ll/b9c;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {p0}, Ll/b9c;->show()V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :cond_4
    const-string p1, "\u8001\u7528\u6237\u5f15\u5bfc\u7ed9\u7167\u7247\u52a0\u6807\u7b7e"

    .line 218
    .line 219
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    if-eqz p1, :cond_5

    .line 224
    .line 225
    invoke-static {}, Lcom/p1/mobile/putong/core/data/DatingGuideData;->new_()Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->titles:Ljava/util/List;

    .line 230
    .line 231
    const-string p3, "\u4e3a\u7167\u7247\u6dfb\u52a0\u6807\u7b7e\uff0c\u5c55\u793a\u4f60\u7684\u7cbe\u5f69\u751f\u6d3b\uff0c\u83b7\u5f97\u66f4\u591a\u559c\u6b22"

    .line 232
    .line 233
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->button:Ljava/lang/String;

    .line 237
    .line 238
    const-string p2, "tantan://profile/edit?mode=picMatchTag"

    .line 239
    .line 240
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->deeplink:Ljava/lang/String;

    .line 241
    .line 242
    const-string p2, "p_add_tag_to_photo"

    .line 243
    .line 244
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pageId:Ljava/lang/String;

    .line 245
    .line 246
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 247
    .line 248
    const-string p3, "https://auto.tancdn.com/v1/raw/3a12313d-44a8-44b4-8f6d-402fbe4559a714.webp"

    .line 249
    .line 250
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    const-string p2, "e_add_tag_to_photo"

    .line 254
    .line 255
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->buttonId:Ljava/lang/String;

    .line 256
    .line 257
    new-instance p2, Ll/b9c$b;

    .line 258
    .line 259
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-direct {p2, p0}, Ll/b9c$b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p2, p1}, Ll/b9c$b;->c(Lcom/p1/mobile/putong/core/data/DatingGuideData;)Ll/b9c$b;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    invoke-virtual {p0}, Ll/b9c$b;->a()Ll/b9c;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-virtual {p0}, Ll/b9c;->show()V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_5
    const-string p1, "\u8001\u7528\u6237\u5f15\u5bfc\u7ed9\u65e7\u6807\u7b7e\u914d\u56fe"

    .line 279
    .line 280
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    if-eqz p1, :cond_6

    .line 285
    .line 286
    invoke-static {}, Lcom/p1/mobile/putong/core/data/DatingGuideData;->new_()Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->titles:Ljava/util/List;

    .line 291
    .line 292
    const-string p3, "\u4e3a\u4f60\u7684\u6807\u7b7e\u6dfb\u52a0\u751f\u6d3b\u7167"

    .line 293
    .line 294
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->subTitles:Ljava/util/List;

    .line 298
    .line 299
    const-string p3, "\u5c55\u793a\u4f60\u7684\u72ec\u7279\u4eae\u70b9\uff0c\u9047\u89c1\u5174\u8da3\u76f8\u6295\u7684\u4eba\uff0c\u83b7\u5f97\u66f4\u591a\u914d\u5bf9"

    .line 300
    .line 301
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->button:Ljava/lang/String;

    .line 305
    .line 306
    const-string p2, "tantan://profile/edit?mode=tagMatchPic"

    .line 307
    .line 308
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->deeplink:Ljava/lang/String;

    .line 309
    .line 310
    const-string p2, "p_add_photo_to_tag"

    .line 311
    .line 312
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pageId:Ljava/lang/String;

    .line 313
    .line 314
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 315
    .line 316
    const-string p3, "https://auto.tancdn.com/v1/raw/30f447dd-3551-470b-b120-7117032e364714.webp"

    .line 317
    .line 318
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    const-string p2, "e_add_photo_to_tag"

    .line 322
    .line 323
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->buttonId:Ljava/lang/String;

    .line 324
    .line 325
    new-instance p2, Ll/b9c$b;

    .line 326
    .line 327
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-direct {p2, p0}, Ll/b9c$b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p2, p1}, Ll/b9c$b;->c(Lcom/p1/mobile/putong/core/data/DatingGuideData;)Ll/b9c$b;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    invoke-virtual {p0}, Ll/b9c$b;->a()Ll/b9c;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    invoke-virtual {p0}, Ll/b9c;->show()V

    .line 343
    .line 344
    .line 345
    return-void

    .line 346
    :cond_6
    const-string p1, "\u6536\u5230\u559c\u6b22\u5f88\u5c11\u5f15\u5bfc\u4e0a\u4f20\u751f\u6d3b\u7167"

    .line 347
    .line 348
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result p1

    .line 352
    if-eqz p1, :cond_7

    .line 353
    .line 354
    invoke-static {}, Lcom/p1/mobile/putong/core/data/DatingGuideData;->new_()Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->titles:Ljava/util/List;

    .line 359
    .line 360
    const-string v2, "19\u4f4d\u5973\u751f\u770b\u8fc7\u4f60\u7684\u8d44\u6599"

    .line 361
    .line 362
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->subTitles:Ljava/util/List;

    .line 366
    .line 367
    const-string v2, "\u5979\u4eec\u60f3\u6df1\u5165\u4e86\u89e3\u4f60\u7684\u5174\u8da3\u7231\u597d\uff0c\u6dfb\u52a0\u751f\u6d3b\u7167\uff0c\u5c55\u793a\u4f60\u7684\u5174\u8da3\uff0c\u6536\u83b7\u66f4\u591a\u559c\u6b22"

    .line 368
    .line 369
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->button:Ljava/lang/String;

    .line 373
    .line 374
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->buttonId:Ljava/lang/String;

    .line 375
    .line 376
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pageId:Ljava/lang/String;

    .line 377
    .line 378
    iput-object p3, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->deeplink:Ljava/lang/String;

    .line 379
    .line 380
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 381
    .line 382
    const-string p3, "https://auto.tancdn.com/v1/raw/c9488f16-cae9-48fa-9558-4e8e5f0552dd14.webp"

    .line 383
    .line 384
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    new-instance p2, Ll/b9c$b;

    .line 388
    .line 389
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 390
    .line 391
    .line 392
    move-result-object p0

    .line 393
    invoke-direct {p2, p0}, Ll/b9c$b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 394
    .line 395
    .line 396
    invoke-virtual {p2, p1}, Ll/b9c$b;->c(Lcom/p1/mobile/putong/core/data/DatingGuideData;)Ll/b9c$b;

    .line 397
    .line 398
    .line 399
    move-result-object p0

    .line 400
    invoke-virtual {p0}, Ll/b9c$b;->a()Ll/b9c;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    invoke-virtual {p0}, Ll/b9c;->show()V

    .line 405
    .line 406
    .line 407
    :cond_7
    return-void
.end method

.method public final synthetic J6()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "\u8001\u7528\u6237\u5f15\u5bfc\u7ed9\u65e7\u6807\u7b7e\u914d\u56fe"

    .line 6
    .line 7
    const-string v2, "\u6536\u5230\u559c\u6b22\u5f88\u5c11\u5f15\u5bfc\u4e0a\u4f20\u751f\u6d3b\u7167"

    .line 8
    .line 9
    const-string v3, "\u53f3\u6ed1\u65e0\u914d\u5bf9\u5f15\u5bfc"

    .line 10
    .line 11
    const-string v4, "\u8fde\u7eed\u5de6\u6ed1\u5f15\u5bfc"

    .line 12
    .line 13
    const-string v5, "\u8001\u7528\u6237\u5f15\u5bfc\u7ed9\u7167\u7247\u52a0\u6807\u7b7e"

    .line 14
    .line 15
    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/b530;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/b530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic K3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/high16 v0, 0x40a00000    # 5.0f

    .line 6
    .line 7
    const-string v1, "test"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {p0, v2, v0, v1}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic K6(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/bem;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v0, p0}, Ll/bem;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "swipe"

    .line 27
    .line 28
    invoke-virtual {v0, p1, p0}, Ll/bem;->U(Ljava/util/List;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ll/bem;->show()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic L3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "\u6d3b\u8dc3\u5929\u6570: "

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v1, v1, Ll/tx0;->d:Ll/vxd0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\n\u5f53\u5929\u6253\u5f00\u6b21\u6570: "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v1, v1, Ll/tx0;->c:Ll/vxd0;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, "\n\u5f53\u5929\u6253\u5f00\u65f6\u95f4\uff08\u79d2\uff09: "

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v1, v1, Ll/tx0;->b:Ll/byd0;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v1, "\n\u5f53\u5929\u63a5\u53d7\u6d88\u606f: "

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\n\u5f53\u5929\u53d1\u9001\u6d88\u606f: "

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 93
    .line 94
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v1, "\n\u5f53\u524d\u8bed\u8a00\u662f\u5426\u6ee1\u8db3\u5165\u7ec4\u6761\u4ef6\uff1afalse"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public final synthetic M3()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.CAMERA"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/u430;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/u430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic M6(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/bem;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v0, p0}, Ll/bem;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "conversation"

    .line 27
    .line 28
    invoke-virtual {v0, p1, p0}, Ll/bem;->U(Ljava/util/List;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ll/bem;->show()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic N3()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/remote_config/b;->a(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O6(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ou90;->l(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->v3(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public U5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public W5()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->E:Lrx/subjects/a;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic X3()V
    .locals 1

    .line 1
    new-instance v0, Ll/bm5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bm5;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/bm5;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public X5()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/view/ViewGroup;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    move v2, v1

    .line 20
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-ge v2, v3, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const/4 v4, -0x1

    .line 35
    if-eq v3, v4, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v4, "navigationBarBackground"

    .line 54
    .line 55
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    invoke-static {v0}, Ll/gbl;->c(Landroid/content/Context;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    return v1

    .line 70
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string v0, "dimen"

    .line 79
    .line 80
    const-string v2, "android"

    .line 81
    .line 82
    const-string v3, "navigation_bar_height"

    .line 83
    .line 84
    invoke-virtual {p0, v3, v0, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-lez v0, :cond_1

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    return p0

    .line 95
    :cond_1
    return v1

    .line 96
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    return v1
.end method

.method public final synthetic X6(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->X5()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y3()V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "effectCache"

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-static {v0}, Ll/oki;->l(Ljava/io/File;)V

    .line 23
    .line 24
    .line 25
    const-string p0, "\u76f4\u64ad\u7279\u6548\u5220\u9664\u6210\u529f"

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    :catch_0
    :cond_0
    return-void
.end method

.method public Y5()Lcom/p1/mobile/putong/core/newui/main/a$v;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k930;->d1()Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final Y6()Lcom/p1/mobile/android/app/Frag;
    .locals 1

    .line 1
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->t6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public Z5()Lcom/p1/mobile/putong/core/newui/main/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    return-object p0
.end method

.method public final a6(Z)Ljava/lang/String;
    .locals 5

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string v1, "female"

    .line 22
    .line 23
    :goto_0
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const-string v1, "male"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :goto_1
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v1, "\u7537\u751f"

    .line 36
    .line 37
    const-string v2, "\u5973\u751f"

    .line 38
    .line 39
    const-string v3, "\u4ed6\u4eec"

    .line 40
    .line 41
    const-string v4, "\u5979\u4eec"

    .line 42
    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    return-object v4

    .line 54
    :cond_1
    return-object v3

    .line 55
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    return-object v2

    .line 62
    :cond_3
    return-object v1

    .line 63
    :cond_4
    if-eqz p1, :cond_6

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_5

    .line 70
    .line 71
    return-object v3

    .line 72
    :cond_5
    return-object v4

    .line 73
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_7

    .line 78
    .line 79
    return-object v1

    .line 80
    :cond_7
    return-object v2
.end method

.method public b6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->v6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public c6()Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->q6()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->isLiveSquareHome(Landroidx/fragment/app/Fragment;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, ""

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getTopShowingPageId(Landroidx/fragment/app/Fragment;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isPhotoAlbumFrag(Landroidx/fragment/app/Fragment;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->getTopShowingPageId(Landroidx/fragment/app/Fragment;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_1
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G5()Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_2
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    const-string p0, "p_navigation_view"

    .line 73
    .line 74
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0

    .line 94
    :cond_4
    invoke-static {v1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method

.method public final synthetic d4()V
    .locals 1

    .line 1
    new-instance v0, Ll/dyf;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dyf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/dyf;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->m:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public d7()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->debugItems()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/s230;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/s230;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 8
    .line 9
    .line 10
    const-string v2, "try add 10000 user in memory"

    .line 11
    .line 12
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/u230;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/u230;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "try jump to market"

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/g330;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/g330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 36
    .line 37
    .line 38
    const-string v2, "showAiAlbumDlg"

    .line 39
    .line 40
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/s330;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/s330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 50
    .line 51
    .line 52
    const-string v2, "Delete core database and kill self"

    .line 53
    .line 54
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    new-instance v1, Ll/e430;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/e430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 64
    .line 65
    .line 66
    const-string v2, "coda debug \u6d4b\u8bd5"

    .line 67
    .line 68
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    new-instance v1, Ll/h430;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/h430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 78
    .line 79
    .line 80
    const-string v2, "shadow string"

    .line 81
    .line 82
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    new-instance v1, Ll/i430;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/i430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 92
    .line 93
    .line 94
    const-string v2, "\u6d3b\u52a8\u4e2d\u5fc3"

    .line 95
    .line 96
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    new-instance v1, Ll/j430;

    .line 104
    .line 105
    invoke-direct {v1}, Ll/j430;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v2, "\u4e0b\u8f7d\u52a8\u6001\u8868\u60c5"

    .line 109
    .line 110
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    new-instance v1, Ll/l430;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/l430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 120
    .line 121
    .line 122
    const-string v2, "\u5c55\u793a\u5934\u50cf\u5ba1\u6838\u5f39\u7a97"

    .line 123
    .line 124
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    new-instance v1, Ll/m430;

    .line 132
    .line 133
    invoke-direct {v1}, Ll/m430;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v2, "\u5934\u50cf\u5ba1\u6838\u5f39\u7a97\u5546\u4e1a\u7b56\u7565\u8bf7\u6c42\u7f13\u5b58\u6e05\u9664"

    .line 137
    .line 138
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    new-instance v1, Ll/d330;

    .line 146
    .line 147
    invoke-direct {v1, p0}, Ll/d330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 148
    .line 149
    .line 150
    const-string v2, "sku\u6d41\u7a0b\u4f18\u5316"

    .line 151
    .line 152
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    new-instance v1, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    const-string v2, "\u662f\u5426\u662f\u5f53\u65e5\u767b\u5f55\u7528\u6237\uff1a"

    .line 162
    .line 163
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Jr()Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    new-instance v2, Ll/o330;

    .line 182
    .line 183
    invoke-direct {v2}, Ll/o330;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    new-instance v1, Ll/z330;

    .line 194
    .line 195
    invoke-direct {v1, p0}, Ll/z330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 196
    .line 197
    .line 198
    const-string v2, "change title !!!!!"

    .line 199
    .line 200
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 212
    .line 213
    check-cast v2, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 214
    .line 215
    invoke-virtual {v2}, Ll/k930;->b1()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    instance-of v2, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 228
    .line 229
    if-eqz v2, :cond_0

    .line 230
    .line 231
    move-object v2, v1

    .line 232
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 233
    .line 234
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C4()Ljava/util/Collection;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 239
    .line 240
    .line 241
    goto :goto_0

    .line 242
    :cond_0
    instance-of v2, v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    .line 243
    .line 244
    if-eqz v2, :cond_1

    .line 245
    .line 246
    move-object v2, v1

    .line 247
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    .line 248
    .line 249
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->C4()Ljava/util/Collection;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 254
    .line 255
    .line 256
    goto :goto_0

    .line 257
    :cond_1
    instance-of v2, v1, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 258
    .line 259
    if-eqz v2, :cond_2

    .line 260
    .line 261
    move-object v2, v1

    .line 262
    check-cast v2, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 263
    .line 264
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongFrag;->C4()Ljava/util/Collection;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    if-nez v3, :cond_2

    .line 273
    .line 274
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 275
    .line 276
    .line 277
    :cond_2
    :goto_0
    invoke-static {v0, p0}, Ll/r130;->A(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;)V

    .line 278
    .line 279
    .line 280
    new-instance v2, Ll/k430;

    .line 281
    .line 282
    invoke-direct {v2, p0}, Ll/k430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 283
    .line 284
    .line 285
    const-string v3, "good2fake dialog"

    .line 286
    .line 287
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    new-instance v2, Ll/v430;

    .line 295
    .line 296
    invoke-direct {v2}, Ll/v430;-><init>()V

    .line 297
    .line 298
    .line 299
    const-string v3, "show screen size "

    .line 300
    .line 301
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    new-instance v2, Ll/g530;

    .line 309
    .line 310
    invoke-direct {v2, p0}, Ll/g530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 311
    .line 312
    .line 313
    const-string v3, "tantan star rank"

    .line 314
    .line 315
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    new-instance v2, Ll/o530;

    .line 323
    .line 324
    invoke-direct {v2, p0}, Ll/o530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 325
    .line 326
    .line 327
    const-string v3, "tantan appstore rank guide"

    .line 328
    .line 329
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    new-instance v2, Ll/p530;

    .line 337
    .line 338
    invoke-direct {v2, p0}, Ll/p530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 339
    .line 340
    .line 341
    const-string v3, "show app store guide status"

    .line 342
    .line 343
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    new-instance v2, Ll/q530;

    .line 351
    .line 352
    invoke-direct {v2, p0}, Ll/q530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 353
    .line 354
    .line 355
    const-string v3, "qr_scan"

    .line 356
    .line 357
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    new-instance v2, Ll/pf60;

    .line 365
    .line 366
    new-instance v3, Ll/t230;

    .line 367
    .line 368
    invoke-direct {v3, p0}, Ll/t230;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 369
    .line 370
    .line 371
    const-string v4, "\u8fdb\u5165\u7167\u76f8\u9875\u9762"

    .line 372
    .line 373
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    new-instance v2, Ll/pf60;

    .line 380
    .line 381
    new-instance v3, Ll/v230;

    .line 382
    .line 383
    invoke-direct {v3, p0}, Ll/v230;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 384
    .line 385
    .line 386
    const-string v4, "\u8fdb\u5165RemoteConfig\u4fe1\u606f\u9875"

    .line 387
    .line 388
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    new-instance v2, Ll/pf60;

    .line 395
    .line 396
    new-instance v3, Ll/w230;

    .line 397
    .line 398
    invoke-direct {v3, p0}, Ll/w230;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 399
    .line 400
    .line 401
    const-string v4, "\u89e6\u53d1\u5347\u7ea7\u4e0b\u8f7d\u5f39\u6846"

    .line 402
    .line 403
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    new-instance v2, Ll/pf60;

    .line 410
    .line 411
    new-instance v3, Ljava/lang/StringBuilder;

    .line 412
    .line 413
    const-string v4, "\u5b9e\u62cd\u6c14\u6ce1\u5f15\u5bfc"

    .line 414
    .line 415
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    sget-object v4, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->r:Ll/jxd0;

    .line 419
    .line 420
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    new-instance v4, Ll/x230;

    .line 432
    .line 433
    invoke-direct {v4}, Ll/x230;-><init>()V

    .line 434
    .line 435
    .line 436
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 440
    .line 441
    .line 442
    new-instance v2, Ll/pf60;

    .line 443
    .line 444
    new-instance v3, Ll/y230;

    .line 445
    .line 446
    invoke-direct {v3}, Ll/y230;-><init>()V

    .line 447
    .line 448
    .line 449
    const-string v4, "\u6d4b\u8bd5\u8bfb\u53d6\u672c\u5730token"

    .line 450
    .line 451
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 452
    .line 453
    .line 454
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    .line 456
    .line 457
    new-instance v2, Ll/pf60;

    .line 458
    .line 459
    new-instance v3, Ll/z230;

    .line 460
    .line 461
    invoke-direct {v3}, Ll/z230;-><init>()V

    .line 462
    .line 463
    .line 464
    const-string v4, "\u6d4b\u8bd5\u5199\u5165\u672c\u5730token\uff1a\u975e\u7a7a"

    .line 465
    .line 466
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 467
    .line 468
    .line 469
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 470
    .line 471
    .line 472
    new-instance v2, Ll/pf60;

    .line 473
    .line 474
    new-instance v3, Ll/a330;

    .line 475
    .line 476
    invoke-direct {v3}, Ll/a330;-><init>()V

    .line 477
    .line 478
    .line 479
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 483
    .line 484
    .line 485
    new-instance v2, Ll/pf60;

    .line 486
    .line 487
    new-instance v3, Ll/b330;

    .line 488
    .line 489
    invoke-direct {v3}, Ll/b330;-><init>()V

    .line 490
    .line 491
    .line 492
    const-string v4, "\u6d4b\u8bd5\u5199\u5165\u672c\u5730token\uff1a\u7a7a"

    .line 493
    .line 494
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 495
    .line 496
    .line 497
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 498
    .line 499
    .line 500
    new-instance v2, Ll/pf60;

    .line 501
    .line 502
    new-instance v3, Ljava/lang/StringBuilder;

    .line 503
    .line 504
    const-string v4, "\u5b9e\u62cdTips\u5f15\u5bfc"

    .line 505
    .line 506
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 507
    .line 508
    .line 509
    sget-object v4, Ll/u1z;->j:Ll/jxd0;

    .line 510
    .line 511
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 512
    .line 513
    .line 514
    move-result-object v4

    .line 515
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object v3

    .line 522
    new-instance v4, Ll/c330;

    .line 523
    .line 524
    invoke-direct {v4}, Ll/c330;-><init>()V

    .line 525
    .line 526
    .line 527
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 528
    .line 529
    .line 530
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 531
    .line 532
    .line 533
    new-instance v2, Ll/pf60;

    .line 534
    .line 535
    new-instance v3, Ll/e330;

    .line 536
    .line 537
    invoke-direct {v3, p0}, Ll/e330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 538
    .line 539
    .line 540
    const-string v4, "\u9690\u79c1\u534f\u8bae"

    .line 541
    .line 542
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 543
    .line 544
    .line 545
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 546
    .line 547
    .line 548
    new-instance v2, Ll/pf60;

    .line 549
    .line 550
    new-instance v3, Ll/f330;

    .line 551
    .line 552
    invoke-direct {v3, p0}, Ll/f330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 553
    .line 554
    .line 555
    const-string v4, "\u6e05\u9664\u76f4\u64ad\u95f4\u7279\u6548\u6587\u4ef6"

    .line 556
    .line 557
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 558
    .line 559
    .line 560
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 561
    .line 562
    .line 563
    new-instance v2, Ll/pf60;

    .line 564
    .line 565
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 566
    .line 567
    invoke-static {v3}, Ll/cu3;->a(Landroid/content/Context;)Z

    .line 568
    .line 569
    .line 570
    move-result v3

    .line 571
    if-eqz v3, :cond_3

    .line 572
    .line 573
    const-string v3, "64Bit"

    .line 574
    .line 575
    goto :goto_1

    .line 576
    :cond_3
    const-string v3, "32Bit"

    .line 577
    .line 578
    :goto_1
    const-string v4, "\u5f53\u524d\u8fd0\u884c\u73af\u5883\uff1a"

    .line 579
    .line 580
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 581
    .line 582
    .line 583
    move-result-object v3

    .line 584
    new-instance v4, Ll/h330;

    .line 585
    .line 586
    invoke-direct {v4}, Ll/h330;-><init>()V

    .line 587
    .line 588
    .line 589
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 590
    .line 591
    .line 592
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 593
    .line 594
    .line 595
    new-instance v2, Ll/pf60;

    .line 596
    .line 597
    new-instance v3, Ll/i330;

    .line 598
    .line 599
    invoke-direct {v3}, Ll/i330;-><init>()V

    .line 600
    .line 601
    .line 602
    const-string v4, "firebasetoken"

    .line 603
    .line 604
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 605
    .line 606
    .line 607
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 608
    .line 609
    .line 610
    new-instance v2, Ll/pf60;

    .line 611
    .line 612
    new-instance v3, Ll/j330;

    .line 613
    .line 614
    invoke-direct {v3}, Ll/j330;-><init>()V

    .line 615
    .line 616
    .line 617
    const-string v4, "firebase\u5b89\u88c5ID"

    .line 618
    .line 619
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 620
    .line 621
    .line 622
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 623
    .line 624
    .line 625
    new-instance v2, Ll/pf60;

    .line 626
    .line 627
    new-instance v3, Ll/k330;

    .line 628
    .line 629
    invoke-direct {v3, p0, v1}, Ll/k330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Landroidx/fragment/app/Fragment;)V

    .line 630
    .line 631
    .line 632
    const-string v1, "\u7f51\u56feFake\u5f39\u7a97"

    .line 633
    .line 634
    invoke-direct {v2, v1, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 635
    .line 636
    .line 637
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 638
    .line 639
    .line 640
    new-instance v1, Ll/pf60;

    .line 641
    .line 642
    new-instance v2, Ll/l330;

    .line 643
    .line 644
    invoke-direct {v2, p0}, Ll/l330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 645
    .line 646
    .line 647
    const-string v3, "\u7f51\u56feFake\u534f\u8bae\u5f39\u7a97"

    .line 648
    .line 649
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 650
    .line 651
    .line 652
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 653
    .line 654
    .line 655
    new-instance v1, Ll/pf60;

    .line 656
    .line 657
    new-instance v2, Ll/m330;

    .line 658
    .line 659
    invoke-direct {v2}, Ll/m330;-><init>()V

    .line 660
    .line 661
    .line 662
    const-string v3, "\u8ba4\u8bc1\u5f39\u6846\u6e05\u7406"

    .line 663
    .line 664
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 665
    .line 666
    .line 667
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 668
    .line 669
    .line 670
    new-instance v1, Ll/pf60;

    .line 671
    .line 672
    new-instance v2, Ll/n330;

    .line 673
    .line 674
    invoke-direct {v2, p0}, Ll/n330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 675
    .line 676
    .line 677
    const-string v3, "asset\u6570\u636e"

    .line 678
    .line 679
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 680
    .line 681
    .line 682
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 683
    .line 684
    .line 685
    new-instance v1, Ll/p330;

    .line 686
    .line 687
    invoke-direct {v1}, Ll/p330;-><init>()V

    .line 688
    .line 689
    .line 690
    const-string v2, "\u5f39\u51fa\u5148\u53d1like\u5f39\u7a97"

    .line 691
    .line 692
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 693
    .line 694
    .line 695
    move-result-object v1

    .line 696
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 697
    .line 698
    .line 699
    new-instance v1, Ll/q330;

    .line 700
    .line 701
    invoke-direct {v1, p0}, Ll/q330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 702
    .line 703
    .line 704
    const-string v2, "Profile Edit Online"

    .line 705
    .line 706
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 707
    .line 708
    .line 709
    move-result-object v1

    .line 710
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 711
    .line 712
    .line 713
    new-instance v1, Ll/r330;

    .line 714
    .line 715
    invoke-direct {v1, p0}, Ll/r330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 716
    .line 717
    .line 718
    const-string v2, "Profile Edit Refactor"

    .line 719
    .line 720
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 721
    .line 722
    .line 723
    move-result-object v1

    .line 724
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 725
    .line 726
    .line 727
    new-instance v1, Ll/t330;

    .line 728
    .line 729
    invoke-direct {v1, p0}, Ll/t330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 730
    .line 731
    .line 732
    const-string v2, "Profile Picks"

    .line 733
    .line 734
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 735
    .line 736
    .line 737
    move-result-object v1

    .line 738
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 739
    .line 740
    .line 741
    new-instance v1, Ll/u330;

    .line 742
    .line 743
    invoke-direct {v1}, Ll/u330;-><init>()V

    .line 744
    .line 745
    .line 746
    const-string v2, "Profile Picks Entry Notify"

    .line 747
    .line 748
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 749
    .line 750
    .line 751
    move-result-object v1

    .line 752
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 753
    .line 754
    .line 755
    new-instance v1, Ll/v330;

    .line 756
    .line 757
    invoke-direct {v1}, Ll/v330;-><init>()V

    .line 758
    .line 759
    .line 760
    const-string v2, "Dating MyTab Guide"

    .line 761
    .line 762
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 763
    .line 764
    .line 765
    move-result-object v1

    .line 766
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 767
    .line 768
    .line 769
    new-instance v1, Ll/w330;

    .line 770
    .line 771
    invoke-direct {v1, p0}, Ll/w330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 772
    .line 773
    .line 774
    const-string v2, "Profile Guide"

    .line 775
    .line 776
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 777
    .line 778
    .line 779
    move-result-object v1

    .line 780
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 781
    .line 782
    .line 783
    new-instance v1, Ll/x330;

    .line 784
    .line 785
    invoke-direct {v1, p0}, Ll/x330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 786
    .line 787
    .line 788
    const-string v2, "ideal guide dialog in SWIPE"

    .line 789
    .line 790
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 791
    .line 792
    .line 793
    move-result-object v1

    .line 794
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 795
    .line 796
    .line 797
    new-instance v1, Ll/y330;

    .line 798
    .line 799
    invoke-direct {v1, p0}, Ll/y330;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 800
    .line 801
    .line 802
    const-string v2, "ideal guide dialog in Conversation"

    .line 803
    .line 804
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 805
    .line 806
    .line 807
    move-result-object v1

    .line 808
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 809
    .line 810
    .line 811
    new-instance v1, Ll/a430;

    .line 812
    .line 813
    invoke-direct {v1, p0}, Ll/a430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 814
    .line 815
    .line 816
    const-string v2, "ideal profile guide dialog"

    .line 817
    .line 818
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 819
    .line 820
    .line 821
    move-result-object v1

    .line 822
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 823
    .line 824
    .line 825
    new-instance v1, Ll/b430;

    .line 826
    .line 827
    invoke-direct {v1, p0}, Ll/b430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 828
    .line 829
    .line 830
    const-string v2, "ideal profile mine tab guide"

    .line 831
    .line 832
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 833
    .line 834
    .line 835
    move-result-object v1

    .line 836
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 837
    .line 838
    .line 839
    new-instance v1, Ll/c430;

    .line 840
    .line 841
    invoke-direct {v1, p0}, Ll/c430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 842
    .line 843
    .line 844
    const-string v2, "deeplink: moment detail"

    .line 845
    .line 846
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 847
    .line 848
    .line 849
    move-result-object v1

    .line 850
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 851
    .line 852
    .line 853
    new-instance v1, Ll/d430;

    .line 854
    .line 855
    invoke-direct {v1, p0}, Ll/d430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 856
    .line 857
    .line 858
    const-string v2, "love letter act"

    .line 859
    .line 860
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 861
    .line 862
    .line 863
    move-result-object v1

    .line 864
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 865
    .line 866
    .line 867
    new-instance v1, Ljava/lang/StringBuilder;

    .line 868
    .line 869
    const-string v2, "web host change:"

    .line 870
    .line 871
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 872
    .line 873
    .line 874
    sget-object v2, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 875
    .line 876
    invoke-virtual {v2}, Ll/lhl;->f()Z

    .line 877
    .line 878
    .line 879
    move-result v3

    .line 880
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 881
    .line 882
    .line 883
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 884
    .line 885
    .line 886
    move-result-object v1

    .line 887
    new-instance v3, Ll/f430;

    .line 888
    .line 889
    invoke-direct {v3, p0}, Ll/f430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 890
    .line 891
    .line 892
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 893
    .line 894
    .line 895
    move-result-object v1

    .line 896
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 897
    .line 898
    .line 899
    new-instance v1, Ljava/lang/StringBuilder;

    .line 900
    .line 901
    const-string v3, "web host change firebase(web host change\u662ffalse\u65f6\u624d\u4f1a\u751f\u6548):"

    .line 902
    .line 903
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 904
    .line 905
    .line 906
    invoke-virtual {v2}, Ll/lhl;->g()Z

    .line 907
    .line 908
    .line 909
    move-result v2

    .line 910
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 911
    .line 912
    .line 913
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 914
    .line 915
    .line 916
    move-result-object v1

    .line 917
    new-instance v2, Ll/g430;

    .line 918
    .line 919
    invoke-direct {v2, p0}, Ll/g430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 920
    .line 921
    .line 922
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 923
    .line 924
    .line 925
    move-result-object p0

    .line 926
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 927
    .line 928
    .line 929
    return-object v0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->V5(Landroid/view/MotionEvent;Z)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/LauncherAct;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return v0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public e6()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->x6()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e7(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/a;->w9(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f6()Lcom/p1/mobile/putong/core/newui/main/a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->m:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/main/a;-><init>(Ll/ner;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->m:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/k930;->C(Ll/iam;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public f7(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->x9(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g6()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public g7()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->y9()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getPopLifeName()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Y6()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->getPopLifeName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->getPopLifeName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public h6()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h7(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->E:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->I7(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i7(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->z9(Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    const-string v0, "NewMainAct inflateView"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MainActInflate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 7
    .line 8
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 16
    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 18
    .line 19
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/a;->G7(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-interface {p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->qg()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    new-instance v0, Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/o430;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/o430;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ll/ln7;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_0

    .line 70
    .line 71
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->K5()V

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-static {}, Ll/yhi0;->b()V

    .line 75
    .line 76
    .line 77
    return-object p1

    .line 78
    :cond_1
    invoke-static {}, Ll/yhi0;->b()V

    .line 79
    .line 80
    .line 81
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    const-string v0, "NewMainAct initDataOnCreate"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MainStartWait:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 7
    .line 8
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NewMainCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->HomeFragWait:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 14
    .line 15
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 20
    .line 21
    .line 22
    invoke-super {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->initDataOnCreate()V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/p430;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/p430;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/q430;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/q430;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/yhi0;->b()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    const-string v0, "NewMainAct initSubscription"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->initSubscription()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->qg()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/ln7;->b()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/n430;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/n430;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-static {}, Ll/yhi0;->b()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public isAnonymousMode()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public j6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->I7(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public j7(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->r:Ljava/lang/Runnable;

    .line 6
    .line 7
    return-object p1
.end method

.method public k6()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->K7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public k7(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/a;->B9(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l7()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->t:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m7(Ljava/lang/CharSequence;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Figure;Ljava/lang/String;DLl/x20;)V
    .locals 8

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 5
    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move-object v3, p3

    .line 9
    move-object v4, p4

    .line 10
    move-wide v5, p5

    .line 11
    move-object v7, p7

    .line 12
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/core/newui/main/a;->M9(Ljava/lang/CharSequence;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Figure;Ljava/lang/String;DLl/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public n7()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->X5()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ll/n530;

    .line 6
    .line 7
    invoke-direct {v1, p0, v0}, Ll/n530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public needMarkResume()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public o7()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 1
    const-string v0, "tantanapp://webview?url="

    .line 2
    .line 3
    sget v1, Ll/k4h;->a:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-ne p1, v1, :cond_0

    .line 7
    .line 8
    if-ne p2, v2, :cond_7

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "last_moment_id"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 21
    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->k9(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_7

    .line 29
    .line 30
    goto/16 :goto_3

    .line 31
    .line 32
    :cond_0
    const/16 v1, 0x3f4

    .line 33
    .line 34
    if-ne p1, v1, :cond_7

    .line 35
    .line 36
    const-string p1, "\u6253\u5f00\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    .line 37
    .line 38
    if-eqz p3, :cond_6

    .line 39
    .line 40
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    if-nez p2, :cond_1

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    const-string p3, "result_type"

    .line 52
    .line 53
    invoke-virtual {p2, p3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    const/4 v1, 0x1

    .line 58
    if-ne p3, v1, :cond_2

    .line 59
    .line 60
    const-string p3, "result_string"

    .line 61
    .line 62
    invoke-virtual {p2, p3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const-string p2, ""

    .line 68
    .line 69
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-eqz p3, :cond_3

    .line 74
    .line 75
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    :try_start_0
    const-string p3, "tantan"

    .line 80
    .line 81
    invoke-virtual {p2, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    if-nez p3, :cond_5

    .line 86
    .line 87
    const-string p3, "tantanapp"

    .line 88
    .line 89
    invoke-virtual {p2, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    if-nez p3, :cond_5

    .line 94
    .line 95
    const-string p3, "tantantribe"

    .line 96
    .line 97
    invoke-virtual {p2, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    if-eqz p3, :cond_4

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-static {p0, p2}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-static {p0, p2}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :catch_0
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_6
    :goto_2
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_7
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 141
    .line 142
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 143
    .line 144
    invoke-interface {v0, p1, p2, p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->onActivityResultForSmartLock(IILandroid/content/Intent;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_8

    .line 149
    .line 150
    goto/16 :goto_3

    .line 151
    .line 152
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    if-eqz v1, :cond_9

    .line 171
    .line 172
    invoke-virtual {v0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 173
    .line 174
    .line 175
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Meet:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_a

    .line 194
    .line 195
    invoke-virtual {v0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 196
    .line 197
    .line 198
    :cond_a
    const/16 v0, 0x1003

    .line 199
    .line 200
    if-ne p1, v0, :cond_b

    .line 201
    .line 202
    if-ne p2, v2, :cond_b

    .line 203
    .line 204
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 205
    .line 206
    invoke-virtual {p3, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    check-cast v0, Ljava/util/ArrayList;

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-static {v1, v0}, Ll/qtk;->L0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 217
    .line 218
    .line 219
    :cond_b
    const/16 v0, 0x312

    .line 220
    .line 221
    if-ne p1, v0, :cond_d

    .line 222
    .line 223
    if-ne p2, v2, :cond_d

    .line 224
    .line 225
    const-string v0, "from"

    .line 226
    .line 227
    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    sget-object v1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {p3, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    check-cast v1, Ljava/util/ArrayList;

    .line 238
    .line 239
    const-string v2, "from_intl_pet_photo"

    .line 240
    .line 241
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-eqz v0, :cond_d

    .line 246
    .line 247
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 248
    .line 249
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 250
    .line 251
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->q6()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_c

    .line 260
    .line 261
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-nez p1, :cond_c

    .line 266
    .line 267
    instance-of p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    .line 268
    .line 269
    if-eqz p1, :cond_c

    .line 270
    .line 271
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    .line 272
    .line 273
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    instance-of p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 278
    .line 279
    if-eqz p1, :cond_c

    .line 280
    .line 281
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 282
    .line 283
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 284
    .line 285
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/b;->z5(Ljava/util/ArrayList;)V

    .line 286
    .line 287
    .line 288
    :cond_c
    :goto_3
    return-void

    .line 289
    :cond_d
    invoke-static {}, Ll/gra;->o2()Z

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    if-eqz v0, :cond_e

    .line 294
    .line 295
    const/16 v0, 0x19

    .line 296
    .line 297
    if-ne p1, v0, :cond_e

    .line 298
    .line 299
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 300
    .line 301
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/a;->q6()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 308
    .line 309
    if-eqz v1, :cond_e

    .line 310
    .line 311
    invoke-virtual {v0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 312
    .line 313
    .line 314
    :cond_e
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 315
    .line 316
    .line 317
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Activity AttachedToWindow"

    .line 5
    .line 6
    invoke-static {v0}, Ll/t4j;->g(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->n:J

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "displayed_time"

    .line 21
    .line 22
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    filled-new-array {p0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "e_main_displayed"

    .line 31
    .line 32
    const-string v1, "p_suggest_users_home_view"

    .line 33
    .line 34
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->w6()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    iget-object p0, p0, Ll/dkb;->I1:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/AutoReleaseVideoAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/ftn0;->b()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-static {p0}, Ll/yw0;->d(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onDialogAttachToWindow(Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->onDialogAttachToWindow(Landroid/app/Dialog;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->k4()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->m:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->I()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onPickImagesResult(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
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
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ll/vel0;

    .line 23
    .line 24
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v0, v2}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-wide v2, v0, Ll/vel0;->b:J

    .line 40
    .line 41
    const-wide/32 v4, 0xea60

    .line 42
    .line 43
    .line 44
    cmp-long v0, v2, v4

    .line 45
    .line 46
    if-lez v0, :cond_0

    .line 47
    .line 48
    sget p0, Lcom/p1/mobile/putong/core/R$string;->jj:I

    .line 49
    .line 50
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    instance-of v0, p1, Ljava/util/ArrayList;

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    check-cast p1, Ljava/util/ArrayList;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 64
    .line 65
    .line 66
    move-object p1, v0

    .line 67
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    invoke-interface {v0, p0, p1, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->toCaptionPage(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->l9(Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onResumeFragments()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResumeFragments()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->m9()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    sput-boolean p0, Lcom/p1/mobile/android/app/Act;->isActResumed:Z

    .line 13
    .line 14
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->n9(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->b5(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->qg()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-static {}, Ll/ln7;->b()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 62
    .line 63
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o:Landroid/widget/PopupWindow;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p1, p0, v1, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method public p7()Lcom/p1/mobile/putong/newui/main/base/TabName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->T9()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/a;->v()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public popLifeObs()Lrx/subjects/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/vk80;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Y6()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->popLifeObs()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->popLifeObs()Lrx/subjects/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y2:J

    .line 10
    .line 11
    const-string v0, "NewMainAct preCreateView"

    .line 12
    .line 13
    invoke-static {v0}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AsyncLayout:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 17
    .line 18
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/uj4;->a()Ll/nql;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0, p0, p0}, Ll/nql;->g(Landroid/content/Context;Ll/ner;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->y3()V

    .line 37
    .line 38
    .line 39
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->setTransparentStatusBar()V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    invoke-static {p0}, Ll/yw0;->d(Z)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/yhi0;->b()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic q6(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic r6(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic s6(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s7(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/main/a;->D:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->m:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->J0(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setTheme()V
    .locals 3

    .line 1
    const-string v0, "NewMainAct setTheme"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->ThemeChange:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 7
    .line 8
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v1, v2}, Ll/c30;->A(F)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v1, p0}, Ll/ux0;->k(Landroid/view/Window;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/yhi0;->b()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public setTransparentStatusBar()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->k4()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/high16 v1, 0x8000000

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/16 v2, 0x600

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 26
    .line 27
    .line 28
    const/high16 v1, -0x80000000

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0, p0}, Ll/eu9;->j(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public shouldWrapContentViewWithTransparentHeader()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic t6(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    const-string p1, "start"

    .line 2
    .line 3
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/cjj;->F()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p1, "vip\u5546\u54c1\u67e5\u8be2"

    .line 14
    .line 15
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 24
    .line 25
    const-string p2, "tttVip"

    .line 26
    .line 27
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/h530;

    .line 36
    .line 37
    invoke-direct {p2}, Ll/h530;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance p2, Ll/i530;

    .line 45
    .line 46
    invoke-direct {p2, p0}, Ll/i530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    const-string p1, "\u63a2\u63a2\u5e01\u67e5\u8be2"

    .line 58
    .line 59
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 68
    .line 69
    const-string p2, "coin"

    .line 70
    .line 71
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance p2, Ll/j530;

    .line 80
    .line 81
    invoke-direct {p2}, Ll/j530;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance p2, Ll/k530;

    .line 89
    .line 90
    invoke-direct {p2, p0}, Ll/k530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_2
    const-string p1, "boost"

    .line 102
    .line 103
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    if-eqz p2, :cond_3

    .line 108
    .line 109
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 112
    .line 113
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    new-instance p2, Ll/l530;

    .line 122
    .line 123
    invoke-direct {p2}, Ll/l530;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    new-instance p2, Ll/m530;

    .line 131
    .line 132
    invoke-direct {p2, p0}, Ll/m530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 140
    .line 141
    .line 142
    :cond_3
    return-void
.end method

.method public t7()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u6()V
    .locals 1

    .line 1
    const-string v0, "Tantan"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u7(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/main/a;->D:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->m:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->N0(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic v6()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "test"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/tx0;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic w6()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Ll/q9c;->a(Landroid/content/Context;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x3f4

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public x3()Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/adc0;->A4:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return-object p0

    .line 16
    :catch_0
    const-class p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic x6()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, "dialog"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/hxf;->p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic y6()V
    .locals 4

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/f6g0;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    array-length v1, v0

    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_0
    if-ge v2, v1, :cond_0

    .line 23
    .line 24
    aget-object v3, v0, v2

    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 27
    .line 28
    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {p0}, Ll/d1k0;->x(Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public bridge synthetic z3()Ll/k930;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->f6()Lcom/p1/mobile/putong/core/newui/main/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
