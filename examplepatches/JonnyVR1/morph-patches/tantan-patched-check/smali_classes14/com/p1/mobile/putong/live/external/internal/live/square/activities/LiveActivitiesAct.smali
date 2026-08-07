.class public Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;",
        "Ll/iam<",
        "Ll/eur;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VRelative;

.field public g:Lv/VImage;

.field public h:Lv/VRelative;

.field public i:Lv/VImage;

.field public j:Ll/eur;

.field public k:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public l:Ll/jxd0;

.field public m:Ll/itr;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->k:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    new-instance v0, Ll/jxd0;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "has_live_activities_recommend_shown"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->l:Ll/jxd0;

    .line 37
    .line 38
    return-void
.end method

.method public static A2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "room_name"

    .line 7
    .line 8
    iget-object v2, p2, Ll/str;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "label_name"

    .line 16
    .line 17
    iget-object v2, p2, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->value:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v1

    .line 26
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    :goto_0
    move-object v1, p0

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 34
    .line 35
    iget-object p2, p2, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 36
    .line 37
    invoke-static {v1, p2}, Ll/gfj0;->b(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "page"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    invoke-virtual {v1, p1}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1, p0}, Ll/kfd0$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, p2}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1, v0}, Ll/kfd0$a;->A(Ljava/lang/Object;)Ll/kfd0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1, p0}, Ll/kfd0$a;->x(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string p1, "p_live_follow"

    .line 78
    .line 79
    invoke-static {p0, p1}, Ll/bfu;->c(Ll/kfd0;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static B2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V
    .locals 4

    .line 1
    move-object v0, p0

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 3
    .line 4
    iget-object v1, p2, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 5
    .line 6
    invoke-static {v0, v1}, Ll/gfj0;->b(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    const-string v2, "room_name"

    .line 16
    .line 17
    iget-object v3, p2, Ll/str;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 18
    .line 19
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v2, "label_name"

    .line 25
    .line 26
    iget-object p2, p2, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p2

    .line 35
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const-string v2, "page"

    .line 46
    .line 47
    invoke-virtual {p2, v2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    invoke-virtual {p2, p1}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1, p0}, Ll/kfd0$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, v0}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1, v1}, Ll/kfd0$a;->A(Ljava/lang/Object;)Ll/kfd0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1, p0}, Ll/kfd0$a;->x(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string p1, "p_live_follow"

    .line 78
    .line 79
    invoke-static {p0, p1}, Ll/bfu;->g(Ll/kfd0;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->o2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->B2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->p2()V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->l2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static bridge synthetic b2(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;)Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->k:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    return-object p0
.end method

.method public static bridge synthetic c2(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;)Ll/eur;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->j:Ll/eur;

    return-object p0
.end method

.method public static bridge synthetic d2(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->w2(Landroid/view/View;)V

    return-void
.end method

.method public static g2(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, ""

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->h2(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;Ljava/lang/String;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static h2(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string p0, "extra_live_square_summary"

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    :cond_0
    const-string p0, "extra_from"

    .line 16
    .line 17
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method private l2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/ux0;->p()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->setGradientStatusBar()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->r()V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ll/eur;

    .line 32
    .line 33
    invoke-direct {p1, p0}, Ll/eur;-><init>(Ll/ner;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ll/eur;->z0()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ll/eur;->t0()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private n2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->e:Lv/VRecyclerView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->k:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->e:Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->e:Lv/VRecyclerView;

    .line 19
    .line 20
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct$b;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct$b;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->e:Lv/VRecyclerView;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct$c;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct$c;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic p2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->j:Ll/eur;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eur;->t0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->n2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->c:Lv/navigationbar/VNavigationBar;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 10
    .line 11
    new-instance v1, Ll/crr;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/crr;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 20
    .line 21
    sget v0, Ll/m9c0;->G:I

    .line 22
    .line 23
    sget v1, Ll/m9c0;->D:I

    .line 24
    .line 25
    sget v2, Ll/m9c0;->E:I

    .line 26
    .line 27
    sget v3, Ll/m9c0;->F:I

    .line 28
    .line 29
    filled-new-array {v0, v1, v2, v3}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    const-string p0, "context_live_activities"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/frr;->b(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eur;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->i2(Ll/eur;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i2(Ll/eur;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->j:Ll/eur;

    .line 2
    .line 3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/brr;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/brr;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final k2(Ll/rtr;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rtr;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
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
    invoke-virtual {p1}, Ll/rtr;->j()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v7, v2

    .line 12
    :goto_0
    invoke-virtual {p1}, Ll/rtr;->i()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge v7, v2, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/rtr;->i()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    move-object v6, v2

    .line 31
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 32
    .line 33
    iget-object v2, v6, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->reference:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v2}, Ll/rtr;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    if-nez v5, :cond_0

    .line 42
    .line 43
    move-object v4, p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    if-ne v7, v1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/rtr;->h()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m2()Ll/itr;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2, p1}, Ll/itr;->I(Ll/rtr;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m2()Ll/itr;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object v2, v6, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Ll/rtr;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iget-object v3, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, v3}, Ll/rtr;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    new-instance v8, Ll/str;

    .line 88
    .line 89
    invoke-direct {v8, v6, v2, v5, v3}, Ll/str;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 90
    .line 91
    .line 92
    new-instance v2, Ll/drr;

    .line 93
    .line 94
    invoke-direct {v2, v5, v7, v8}, Ll/drr;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v8, v2}, Ll/d3q;->z(Ljava/lang/Runnable;)V

    .line 98
    .line 99
    .line 100
    new-instance v3, Ll/err;

    .line 101
    .line 102
    move-object v4, p0

    .line 103
    invoke-direct/range {v3 .. v8}, Ll/err;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v8, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    :goto_1
    add-int/lit8 v7, v7, 0x1

    .line 113
    .line 114
    move-object p0, v4

    .line 115
    goto :goto_0

    .line 116
    :cond_2
    move-object v4, p0

    .line 117
    invoke-virtual {p1}, Ll/rtr;->i()Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-ne p0, v1, :cond_3

    .line 126
    .line 127
    invoke-virtual {p1}, Ll/rtr;->h()Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-nez p0, :cond_3

    .line 136
    .line 137
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m2()Ll/itr;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0, p1}, Ll/itr;->I(Ll/rtr;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m2()Ll/itr;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    :cond_3
    new-instance p0, Ll/dtr;

    .line 152
    .line 153
    invoke-virtual {p1}, Ll/rtr;->m()Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    invoke-direct {p0, p1}, Ll/dtr;-><init>(Z)V

    .line 158
    .line 159
    .line 160
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    return-object v0
.end method

.method public final m2()Ll/itr;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m:Ll/itr;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/itr;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->j:Ll/eur;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/itr;-><init>(Ll/eur;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m:Ll/itr;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m:Ll/itr;

    .line 15
    .line 16
    return-object p0
.end method

.method public final synthetic o2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->getRecommendCategory()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->valueType:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p5, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->s2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, p3, p4}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->A2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_follow"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q2(Ll/rtr;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->k:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->k2(Ll/rtr;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public r2(Ll/rtr;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m2()Ll/itr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/itr;->I(Ll/rtr;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->k:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->m2()Ll/itr;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final s2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->z2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public u2()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public v2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->f:Lv/VRelative;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->e:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->h:Lv/VRelative;

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final w2(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/xec0;->d:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/external/view/widgets/FollowVText;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/FollowVText;->w(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public y2(Ll/rtr;)V
    .locals 4
    .param p1    # Ll/rtr;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->f:Lv/VRelative;

    .line 8
    .line 9
    const/4 v2, 0x4

    .line 10
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/rtr;->i()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/rtr;->h()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    move v0, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v0, v1

    .line 37
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->h:Lv/VRelative;

    .line 38
    .line 39
    invoke-static {v3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->e:Lv/VRecyclerView;

    .line 43
    .line 44
    xor-int/2addr v0, v2

    .line 45
    invoke-static {v3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->k:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->k2(Ll/rtr;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final z2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object p3, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "live-activity"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p3, p0, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
