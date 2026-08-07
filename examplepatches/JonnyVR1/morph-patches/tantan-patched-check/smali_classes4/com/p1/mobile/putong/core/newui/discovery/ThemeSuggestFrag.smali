.class public Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Lv/VPager;

.field public B:Lv/VButton;

.field public C:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GPTopicCard;",
            ">;"
        }
    .end annotation
.end field

.field public D:Ll/zti0;

.field public E:Ljava/lang/String;

.field public F:I

.field public z:Lcom/google/android/material/tabs/TabLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->C:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "nearby"

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->F:I

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/LookingFor;
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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public static synthetic N4(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gtz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-gtz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic O4(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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

.method public static synthetic P4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->h5(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;Ljava/util/HashMap;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->d5(Ljava/util/HashMap;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;Ljava/util/HashMap;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->e5(Ljava/util/HashMap;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->c5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic T4()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->n7()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->f5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/data/LookingFor;)V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v0, Ll/uui0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/uui0;-><init>()V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x3e8

    .line 9
    .line 10
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->g5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/LikersLimit;->remaining:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->i5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic Z4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->C:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic a5(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->k5()V

    return-void
.end method

.method private synthetic c5(Ljava/util/List;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->C:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->D:Ll/zti0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/zti0;->j(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->j5()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic f5(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->B:Lv/VButton;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private synthetic g5(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_online:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "popular"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_pop:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 14
    .line 15
    const-string v0, "unlock_popular"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v0, "unlock_online"

    .line 19
    .line 20
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {v1, p0, v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public b5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gvi0;->b(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d4()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dkb;->n7()Lrx/c;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->C:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GPTopicCard;->new_()Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GPTopicCard;->new_()Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GPTopicCard;->new_()Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GPTopicCard;->new_()Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GPTopicCard;->new_()Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/ljj;->b(Ljava/util/List;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic d5(Ljava/util/HashMap;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic e5(Ljava/util/HashMap;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public f4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    iget-object v0, v0, Ll/dkb;->m1:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/xui0;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/xui0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/yui0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/yui0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/zui0;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/zui0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    iget-object v1, v1, Ll/dkb;->n1:Lrx/subjects/a;

    .line 55
    .line 56
    new-instance v2, Ll/avi0;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/avi0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lrx/c;->first(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    new-instance v2, Ll/bvi0;

    .line 66
    .line 67
    invoke-direct {v2, p0}, Ll/bvi0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v2, Ll/cvi0;

    .line 75
    .line 76
    invoke-direct {v2}, Ll/cvi0;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/dvi0;

    .line 88
    .line 89
    invoke-direct {v1}, Ll/dvi0;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/evi0;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/evi0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    new-instance v0, Ll/fvi0;

    .line 121
    .line 122
    invoke-direct {v0}, Ll/fvi0;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    const/4 v0, 0x1

    .line 134
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    new-instance v0, Ll/tui0;

    .line 139
    .line 140
    invoke-direct {v0}, Ll/tui0;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/zti0;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->C:Ljava/util/List;

    .line 11
    .line 12
    invoke-direct {p1, v0, v1}, Ll/zti0;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->D:Ll/zti0;

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->A:Lv/VPager;

    .line 18
    .line 19
    const/4 v0, 0x4

    .line 20
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->A:Lv/VPager;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->D:Ll/zti0;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->z:Lcom/google/android/material/tabs/TabLayout;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->A:Lv/VPager;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->A:Lv/VPager;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->z:Lcom/google/android/material/tabs/TabLayout;

    .line 44
    .line 45
    new-instance v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->B:Lv/VButton;

    .line 54
    .line 55
    new-instance v0, Ll/sui0;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/sui0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->j5()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic h5(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->b5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j5()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->z:Lcom/google/android/material/tabs/TabLayout;

    .line 3
    .line 4
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->z:Lcom/google/android/material/tabs/TabLayout;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->C:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    sget v4, Ll/kec0;->hf:I

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;

    .line 36
    .line 37
    invoke-virtual {v1, v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 38
    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->F:I

    .line 41
    .line 42
    if-ne v1, v0, :cond_0

    .line 43
    .line 44
    iget v1, v2, Lcom/p1/mobile/putong/core/data/GPTopicCard;->iconRes:I

    .line 45
    .line 46
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->q(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->z(Lcom/p1/mobile/putong/core/data/GPTopicCard;)V

    .line 51
    .line 52
    .line 53
    :goto_1
    iget-object v1, v3, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->f:Lv/VText;

    .line 54
    .line 55
    iget v2, v2, Lcom/p1/mobile/putong/core/data/GPTopicCard;->topicName:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 58
    .line 59
    .line 60
    add-int/lit8 v0, v0, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    return-void
.end method

.method public final k5()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/dkb;->o7(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/vui0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/vui0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/wui0;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/wui0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_explore_theme_recommend"

    .line 2
    .line 3
    return-object p0
.end method
