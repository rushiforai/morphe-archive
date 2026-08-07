.class public Ll/dsh;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/fsh;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/gsh;

.field public b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

.field public c:Z

.field public d:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/dsh;->c:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/dsh;->d:Ljava/util/HashSet;

    .line 13
    .line 14
    new-instance v0, Ll/trh;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/trh;-><init>(Ll/dsh;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/dsh;->e:Ljava/lang/Runnable;

    .line 20
    .line 21
    iput-object p1, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 22
    .line 23
    return-void
.end method

.method private synthetic E0()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/dsh;->c:Z

    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "sourcepage"

    .line 10
    .line 11
    sget-object v2, Ll/tel;->J:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    const-string v1, "actiontype"

    .line 17
    .line 18
    sget-object v2, Ll/tel;->K:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/dsh;->a:Ll/gsh;

    .line 24
    .line 25
    iget-object v1, v1, Ll/gsh;->a:Ll/ji80;

    .line 26
    .line 27
    iget-object v1, v1, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 32
    .line 33
    invoke-virtual {v2, v1, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y5(Lcom/p1/mobile/putong/data/User;Ljava/util/Map;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v2, Ll/ash;

    .line 38
    .line 39
    invoke-direct {v2, p0, v1}, Ll/ash;-><init>(Ll/dsh;Lcom/p1/mobile/putong/data/User;)V

    .line 40
    .line 41
    .line 42
    new-instance v3, Ll/bsh;

    .line 43
    .line 44
    invoke-direct {v3, p0, v1}, Ll/bsh;-><init>(Ll/dsh;Lcom/p1/mobile/putong/data/User;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private I0(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->o4(I)Landroid/app/Dialog;

    .line 13
    .line 14
    .line 15
    const-string v0, "profile"

    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/yb5;->I(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/urh;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/urh;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/vrh;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1, p2}, Ll/vrh;-><init>(Ll/dsh;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/wrh;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Ll/wrh;-><init>(Ll/dsh;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private J0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dsh;->a:Ll/gsh;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic e0(Ll/dsh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dsh;->E0()V

    return-void
.end method

.method public static synthetic f0(Ll/dsh;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dsh;->C0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic g0(Ll/dsh;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dsh;->y0(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic h0(Ll/dsh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dsh;->G0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ll/dsh;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dsh;->D0(Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ljava/util/List;)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ljava/util/ArrayList;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    invoke-virtual {v2, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput-object v2, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static synthetic l0(Ll/dsh;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dsh;->A0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m0(Ll/dsh;Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/dsh;->F0(Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Ll/dsh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dsh;->z0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private t0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/qyf;->f()Ll/qyf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object p0, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 22
    .line 23
    const/16 v3, 0x73

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2, p0, v3}, Ll/qyf;->e(Lrx/c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private u0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->i0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/zrh;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/zrh;-><init>(Ll/dsh;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final synthetic A0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dsh;->d:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/spl0;->U()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 17
    .line 18
    if-ne p1, v0, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Ll/fsh;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/fsh;->c()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic C0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dsh;->q0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dsh;->o0()V

    .line 5
    .line 6
    .line 7
    const-string p2, "p_poi_nearby_card"

    .line 8
    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/brh;->b(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const-string p1, ""

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 28
    .line 29
    const-string v0, "success"

    .line 30
    .line 31
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Ll/dsh;->c:Z

    .line 36
    .line 37
    return-void
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, "p_poi_nearby_card"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/brh;->b(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->a2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Ll/dsh;->c:Z

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Jq:I

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    sget v0, Ll/dbc0;->jv:I

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget v0, Ll/dbc0;->js:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p1, p2, p0}, Ll/o1j0;->H(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic F0(Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 4
    .line 5
    .line 6
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p3, v0}, Ll/dkb;->va(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Al:I

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v1, Ll/csh;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/csh;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {p3, v0, p1, p0, v1}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    const-string p0, "fake_to_good_dlg"

    .line 55
    .line 56
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    invoke-static {}, Ll/fph0;->G()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    const-string p0, "fakeView"

    .line 67
    .line 68
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_1

    .line 73
    .line 74
    invoke-static {}, Ll/fph0;->v()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public final synthetic G0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public H0(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/16 v0, 0x73

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p2, p1, :cond_0

    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    const-string p2, "from"

    .line 17
    .line 18
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-direct {p0, p1, p2}, Ll/dsh;->I0(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dsh;->r0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/dsh;->t0()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/dsh;->u0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/dsh;->a:Ll/gsh;

    .line 3
    .line 4
    return-void
.end method

.method public p0()Z
    .locals 10

    .line 1
    invoke-direct {p0}, Ll/dsh;->J0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/axj0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    iget-object v0, p0, Ll/dsh;->a:Ll/gsh;

    .line 17
    .line 18
    iget-object v0, v0, Ll/gsh;->a:Ll/ji80;

    .line 19
    .line 20
    iget-object v8, v0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    const-string v0, "p_poi_nearby_card"

    .line 23
    .line 24
    iget-object v2, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0, v2}, Ll/brh;->b(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, v8, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 31
    .line 32
    const-string v9, ""

    .line 33
    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    move-object v2, v9

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 39
    .line 40
    :goto_0
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/d;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 41
    .line 42
    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 65
    .line 66
    const-string v2, "failJailedUser"

    .line 67
    .line 68
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return v1

    .line 72
    :cond_2
    iget-boolean v2, p0, Ll/dsh;->c:Z

    .line 73
    .line 74
    if-nez v2, :cond_3

    .line 75
    .line 76
    return v1

    .line 77
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 86
    .line 87
    iget v4, v2, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->reset:I

    .line 88
    .line 89
    mul-int/lit16 v4, v4, 0x3e8

    .line 90
    .line 91
    int-to-long v4, v4

    .line 92
    iget-wide v6, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 93
    .line 94
    add-long/2addr v4, v6

    .line 95
    sget-object v3, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 96
    .line 97
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 98
    .line 99
    .line 100
    move-result-wide v6

    .line 101
    sub-long/2addr v4, v6

    .line 102
    const-wide/16 v6, 0x0

    .line 103
    .line 104
    cmp-long v3, v4, v6

    .line 105
    .line 106
    if-lez v3, :cond_4

    .line 107
    .line 108
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-nez v2, :cond_4

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 119
    .line 120
    const/4 v6, 0x0

    .line 121
    const/4 v7, 0x0

    .line 122
    const-string v3, "p_home,undo"

    .line 123
    .line 124
    const/4 v5, 0x0

    .line 125
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 126
    .line 127
    .line 128
    move v2, v1

    .line 129
    :goto_1
    move v3, v2

    .line 130
    goto :goto_2

    .line 131
    :cond_4
    iget-object v2, p0, Ll/dsh;->e:Ljava/lang/Runnable;

    .line 132
    .line 133
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 134
    .line 135
    .line 136
    const/4 v2, 0x1

    .line 137
    goto :goto_1

    .line 138
    :goto_2
    if-nez v2, :cond_6

    .line 139
    .line 140
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-eqz v2, :cond_5

    .line 145
    .line 146
    iget-object v2, v8, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 147
    .line 148
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_5

    .line 153
    .line 154
    iget-object v2, v8, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 155
    .line 156
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-lez v2, :cond_5

    .line 161
    .line 162
    iget-object v2, v8, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 169
    .line 170
    iget-object v9, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 171
    .line 172
    iget-object v2, v8, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 173
    .line 174
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    goto :goto_3

    .line 179
    :cond_5
    move v2, v1

    .line 180
    :goto_3
    invoke-virtual {v0, v9}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 190
    .line 191
    const-string v1, "failUndoLocal"

    .line 192
    .line 193
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    :cond_6
    return v3
.end method

.method public final q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/fsh;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/fsh;->f()Ll/hi80;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/dsh;->a:Ll/gsh;

    .line 13
    .line 14
    iget-object v1, v0, Ll/gsh;->a:Ll/ji80;

    .line 15
    .line 16
    iget-object v0, v0, Ll/gsh;->b:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/ji80;->a(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Ll/fsh;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/fsh;->f()Ll/hi80;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/dsh;->a:Ll/gsh;

    .line 30
    .line 31
    iget-object p0, p0, Ll/gsh;->a:Ll/ji80;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ll/hi80;->n(Ll/ji80;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final r0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->C:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Z6(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/xrh;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/xrh;-><init>(Ll/dsh;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/yrh;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/yrh;-><init>(Ll/dsh;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public s0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dsh;->d:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public x0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dsh;->d:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_3

    .line 19
    .line 20
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 27
    .line 28
    const-class v2, Lcom/p1/mobile/putong/data/CommonData;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 37
    .line 38
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 41
    .line 42
    new-instance v3, Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 45
    .line 46
    .line 47
    new-instance v4, Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    if-nez v5, :cond_0

    .line 57
    .line 58
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_0

    .line 67
    .line 68
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    check-cast v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 73
    .line 74
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v3, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-nez v2, :cond_1

    .line 85
    .line 86
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz v2, :cond_1

    .line 95
    .line 96
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    check-cast v2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 101
    .line 102
    iget-object v5, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 103
    .line 104
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v4, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-nez v1, :cond_3

    .line 115
    .line 116
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    :cond_2
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-eqz v1, :cond_3

    .line 125
    .line 126
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 131
    .line 132
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 139
    .line 140
    iget-object v5, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    check-cast v5, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 147
    .line 148
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    if-eqz v6, :cond_2

    .line 153
    .line 154
    new-instance v6, Ll/ji80;

    .line 155
    .line 156
    const/4 v7, 0x0

    .line 157
    invoke-direct {v6, v1, v2, v5, v7}, Ll/ji80;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;)V

    .line 158
    .line 159
    .line 160
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-nez p1, :cond_4

    .line 169
    .line 170
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 171
    .line 172
    check-cast p0, Ll/fsh;

    .line 173
    .line 174
    invoke-virtual {p0, v0}, Ll/fsh;->q(Ljava/util/List;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_4
    iget-object p0, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->Q4()V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public final synthetic z0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dsh;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->Q4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
