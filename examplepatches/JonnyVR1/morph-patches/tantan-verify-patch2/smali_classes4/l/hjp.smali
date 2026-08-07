.class public Ll/hjp;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pkp;",
        ">;"
    }
.end annotation


# static fields
.field public static I:Ljava/lang/String; = "click"

.field public static J:Ljava/lang/String; = "swipe"


# instance fields
.field public A:Ljava/lang/Runnable;

.field public B:Z

.field public C:Ljava/lang/String;

.field public D:Ll/g6m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/g6m<",
            "Ll/rfh0$a;",
            "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
            ">;"
        }
    .end annotation
.end field

.field public E:Z

.field public F:I

.field public G:Ll/kcg0;

.field public H:J

.field public a:Z

.field public b:Z

.field public c:Ljava/lang/String;

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/PartialListOpt<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z

.field public p:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:J

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Z

.field public x:Z

.field public y:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/hjp;->a:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/hjp;->b:Z

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    iput-object v0, p0, Ll/hjp;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput p1, p0, Ll/hjp;->d:I

    .line 14
    .line 15
    iput-object v0, p0, Ll/hjp;->e:Ljava/lang/String;

    .line 16
    .line 17
    iput-boolean p1, p0, Ll/hjp;->f:Z

    .line 18
    .line 19
    iput-boolean p1, p0, Ll/hjp;->g:Z

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    iput-boolean v1, p0, Ll/hjp;->h:Z

    .line 23
    .line 24
    iput-boolean p1, p0, Ll/hjp;->i:Z

    .line 25
    .line 26
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iput-object v2, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 31
    .line 32
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 37
    .line 38
    iput-object v2, p0, Ll/hjp;->k:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iput-object v2, p0, Ll/hjp;->l:Lrx/subjects/a;

    .line 45
    .line 46
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-static {v2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iput-object v3, p0, Ll/hjp;->m:Lrx/subjects/a;

    .line 53
    .line 54
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iput-object v3, p0, Ll/hjp;->n:Lrx/subjects/b;

    .line 59
    .line 60
    iput-boolean p1, p0, Ll/hjp;->o:Z

    .line 61
    .line 62
    invoke-static {v2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iput-object v3, p0, Ll/hjp;->p:Lrx/subjects/a;

    .line 67
    .line 68
    iput-boolean p1, p0, Ll/hjp;->q:Z

    .line 69
    .line 70
    iput-boolean v1, p0, Ll/hjp;->r:Z

    .line 71
    .line 72
    iput-boolean v1, p0, Ll/hjp;->s:Z

    .line 73
    .line 74
    const-wide/16 v3, 0x0

    .line 75
    .line 76
    iput-wide v3, p0, Ll/hjp;->t:J

    .line 77
    .line 78
    iput-boolean v1, p0, Ll/hjp;->w:Z

    .line 79
    .line 80
    invoke-static {v2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, p0, Ll/hjp;->y:Lrx/subjects/a;

    .line 85
    .line 86
    new-instance v1, Ll/gip;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/gip;-><init>(Ll/hjp;)V

    .line 89
    .line 90
    .line 91
    iput-object v1, p0, Ll/hjp;->A:Ljava/lang/Runnable;

    .line 92
    .line 93
    iput-object v0, p0, Ll/hjp;->C:Ljava/lang/String;

    .line 94
    .line 95
    iput-boolean p1, p0, Ll/hjp;->E:Z

    .line 96
    .line 97
    iput p1, p0, Ll/hjp;->F:I

    .line 98
    .line 99
    const/4 p1, 0x0

    .line 100
    iput-object p1, p0, Ll/hjp;->G:Ll/kcg0;

    .line 101
    .line 102
    sget-object p1, Ll/ami0;->INSTANCE:Ll/ami0;

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/ami0;->d()J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    iput-wide v0, p0, Ll/hjp;->H:J

    .line 109
    .line 110
    return-void
.end method

.method public static synthetic A0(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hjp;->Q1()V

    return-void
.end method

.method public static synthetic C0(Ll/hjp;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjp;->V1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic D0(Ll/hjp;Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hjp;->g2(Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method private D2()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/qhp;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/qhp;-><init>(Ll/hjp;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/rhp;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/rhp;-><init>(Ll/hjp;)V

    .line 13
    .line 14
    .line 15
    new-instance v3, Ll/shp;

    .line 16
    .line 17
    invoke-direct {v3, p0}, Ll/shp;-><init>(Ll/hjp;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/thp;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/thp;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1, v2, v3, p0}, Ll/xxv;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Landroid/content/DialogInterface$OnCancelListener;Ljava/lang/Runnable;Ll/x20;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic E0(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hjp;->J1()V

    return-void
.end method

.method public static synthetic F0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G0()V
    .locals 1

    .line 1
    sget-object v0, Ll/fph0;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/fph0;->n0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic H0(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/dkb;->va(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private H2()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static synthetic I0(Ljava/util/List;)Lrx/c;
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

.method public static synthetic J0(Ll/hjp;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hjp;->d2(Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic L0(Ll/hjp;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->Z1(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N0()V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic N1(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

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
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/pkp;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/pkp;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Ll/hjp;->B:Z

    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public static synthetic O0(Ll/hjp;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->H1(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic O1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/yip;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/yip;-><init>(Ll/hjp;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p1, v1}, Ll/qtk;->Q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O2:Ll/wyd0;

    .line 16
    .line 17
    const-string p1, ""

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic P0(Ll/hjp;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hjp;->c2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method private synthetic P1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hjp;->m:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/hjp;->h1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Q0(Ll/hjp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjp;->O1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic R0(Ll/hjp;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->R1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic S0(Ll/hjp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjp;->N1(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic T1(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/n;->x3()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic U0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

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

.method private synthetic U1()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v7, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v10, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    const/4 v3, 0x0

    .line 27
    const/4 v4, 0x0

    .line 28
    const/4 v5, 0x1

    .line 29
    const-string v6, "fake_to_good_dlg"

    .line 30
    .line 31
    const/4 v8, 0x0

    .line 32
    const/4 v9, 0x1

    .line 33
    invoke-static/range {v1 .. v10}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->h2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/16 v1, 0x73

    .line 38
    .line 39
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic V0(Ll/hjp;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->I1(Ll/pf60;)V

    return-void
.end method

.method private synthetic V1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/n;->w3()V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/n;->x3()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 16
    .line 17
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Ll/pkp;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0, v0}, Ll/pkp;->B0(ZZ)V

    .line 28
    .line 29
    .line 30
    iput-boolean v0, p0, Ll/hjp;->o:Z

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic W0(Ll/hjp;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->X1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic X0(Ll/hjp;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjp;->T1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic Y0(Lcom/p1/mobile/android/app/c;Ll/uxj0;Ljava/util/List;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method private synthetic Y1(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pkp;->w1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a1(Ll/hjp;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjp;->P1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic b1(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hjp;->e2()V

    return-void
.end method

.method public static synthetic c1(Ll/hjp;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic c2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v1, Ll/pkp;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/pkp;->m0()Ll/f1g0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {p0, v0, p2, v1, p1}, Ll/hjp;->j1(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 40
    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    :goto_0
    const-string p1, ""

    .line 48
    .line 49
    :goto_1
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 50
    .line 51
    .line 52
    const-string p1, "success"

    .line 53
    .line 54
    invoke-virtual {p0, p2, p1}, Ll/hjp;->x2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    const/4 p1, 0x1

    .line 58
    iput-boolean p1, p0, Ll/hjp;->h:Z

    .line 59
    .line 60
    return-void
.end method

.method public static synthetic d1(Ll/hjp;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic d2(Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

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
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v1, Ll/pkp;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/pkp;->m0()Ll/f1g0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, ""

    .line 32
    .line 33
    invoke-direct {p0, v0, v2, v1, p1}, Ll/hjp;->j1(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1, p2}, Ll/hjp;->w2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    const/4 p1, 0x1

    .line 41
    iput-boolean p1, p0, Ll/hjp;->h:Z

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Jq:I

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    sget v0, Ll/dbc0;->jv:I

    .line 66
    .line 67
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    sget v0, Ll/dbc0;->js:I

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {p1, p2, p0}, Ll/o1j0;->H(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static synthetic e0()V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic e2()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hjp;->h:Z

    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "tribe-"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v3, Ll/pkp;

    .line 19
    .line 20
    iget-object v3, v3, Ll/pkp;->U:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v3, "sourcepage"

    .line 30
    .line 31
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    const-string v1, "actiontype"

    .line 35
    .line 36
    sget-object v3, Ll/hjp;->I:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 44
    .line 45
    iget-object v3, v1, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/n;->V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/n;->V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->clone()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 62
    .line 63
    .line 64
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 70
    .line 71
    check-cast v2, Ll/pkp;

    .line 72
    .line 73
    iget-object v2, v2, Ll/pkp;->U:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 85
    .line 86
    invoke-virtual {v2, v0, v1}, Lcom/p1/mobile/putong/core/api/n;->d4(Ljava/util/Map;Ljava/lang/String;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_1

    .line 95
    .line 96
    new-instance v1, Ll/jip;

    .line 97
    .line 98
    invoke-direct {v1, p0, v3}, Ll/jip;-><init>(Ll/hjp;Lcom/p1/mobile/putong/data/User;)V

    .line 99
    .line 100
    .line 101
    new-instance v2, Ll/kip;

    .line 102
    .line 103
    invoke-direct {v2, p0, v3}, Ll/kip;-><init>(Ll/hjp;Lcom/p1/mobile/putong/data/User;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 115
    .line 116
    check-cast v0, Ll/pkp;

    .line 117
    .line 118
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 137
    .line 138
    check-cast v1, Ll/pkp;

    .line 139
    .line 140
    invoke-virtual {v1}, Ll/pkp;->m0()Ll/f1g0;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    const-string v2, ""

    .line 145
    .line 146
    invoke-direct {p0, v0, v2, v1, v3}, Ll/hjp;->j1(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p0, v0, v2}, Ll/hjp;->x2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_2
    const/4 v0, 0x1

    .line 154
    iput-boolean v0, p0, Ll/hjp;->h:Z

    .line 155
    .line 156
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Jq:I

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    sget v2, Ll/dbc0;->jv:I

    .line 179
    .line 180
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    sget v2, Ll/dbc0;->js:I

    .line 193
    .line 194
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-static {v0, v1, p0}, Ll/o1j0;->H(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public static synthetic f0(Ll/hjp;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->S1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hjp;->W1()V

    return-void
.end method

.method public static synthetic h0(Ll/hjp;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->a2(Ll/uxj0;)V

    return-void
.end method

.method private h1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    invoke-static {}, Ll/d09;->d()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const-string v2, ""

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    iget-object v0, v0, Ll/dkb;->c0:Ll/jxd0;

    .line 30
    .line 31
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/pip;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/pip;-><init>(Ll/hjp;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    invoke-static {v0, v2, v1, p0}, Ll/qtk;->O0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/hjp;->f1()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    iget-object v1, v1, Ll/dkb;->c0:Ll/jxd0;

    .line 61
    .line 62
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    new-instance v1, Ll/qip;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/qip;-><init>(Ll/hjp;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    invoke-static {v0, v2, v1, p0}, Ll/qtk;->O0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Z)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object p0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 78
    .line 79
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    iget-object p0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 86
    .line 87
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic i0(Ll/hjp;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->h2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/hjp;Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hjp;->i2(Lrx/subjects/a;Ljava/lang/Throwable;)V

    return-void
.end method

.method private j1(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/n;->A3()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, -0x1

    .line 10
    .line 11
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    if-ltz p0, :cond_0

    .line 18
    .line 19
    iget-object v0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-le v0, p0, :cond_0

    .line 26
    .line 27
    iget-object v0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p4, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result p4

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string v0, ""

    .line 45
    .line 46
    const/4 p4, 0x0

    .line 47
    :goto_0
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 58
    .line 59
    .line 60
    return-object p1
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

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

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private l1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pkp;->j0()Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;->requested:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->e(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;)V

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Ll/hjp;->r:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/hjp;->r:Z

    .line 20
    .line 21
    iget-object p0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 22
    .line 23
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic m0(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hjp;->L1()V

    return-void
.end method

.method public static synthetic n0(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hjp;->U1()V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic p0(Ll/hjp;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hjp;->j2(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic q0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private q1(Landroid/content/Intent;)V
    .locals 3

    .line 1
    const-string v0, "heart_confession_uid"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "heart_confession_content"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v1, Ll/pkp;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/pkp;->m0()Ll/f1g0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string v1, ""

    .line 35
    .line 36
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    iput-object v0, p0, Ll/hjp;->u:Ljava/lang/String;

    .line 55
    .line 56
    iput-object p1, p0, Ll/hjp;->v:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method private q2(Ljava/util/ArrayList;Ljava/lang/String;)V
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
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->o4(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    const-string v0, "profile"

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/yb5;->I(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/sip;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/sip;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/tip;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1, p2}, Ll/tip;-><init>(Ll/hjp;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Ll/uip;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Ll/uip;-><init>(Ll/hjp;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public static synthetic r0(Ll/pf60;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic s0(Ll/hjp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->b2(Ljava/lang/String;)V

    return-void
.end method

.method private s1()V
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
    new-instance v1, Ll/eip;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/eip;-><init>(Ll/hjp;)V

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

.method public static synthetic t0(Ll/hjp;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjp;->Y1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private t1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O2:Ll/wyd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hxd0;->obs()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/php;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/php;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/aip;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/aip;-><init>(Ll/hjp;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Ll/hjp;->m:Lrx/subjects/a;

    .line 47
    .line 48
    new-instance v2, Ll/st30;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/st30;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/lip;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/lip;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/wip;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/wip;-><init>(Ll/hjp;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 83
    .line 84
    new-instance v1, Ll/hjp$a;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/hjp$a;-><init>(Ll/hjp;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/ajp;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/ajp;-><init>(Ll/hjp;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v1, p0, Ll/hjp;->l:Lrx/subjects/a;

    .line 114
    .line 115
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 118
    .line 119
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->E4()Lrx/subjects/a;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    const/4 v3, 0x1

    .line 124
    invoke-virtual {v2, v3}, Lrx/c;->take(I)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    new-instance v3, Ll/bjp;

    .line 129
    .line 130
    invoke-direct {v3}, Ll/bjp;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    new-instance v1, Ll/cjp;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Ll/cjp;-><init>(Ll/hjp;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 151
    .line 152
    .line 153
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->h9()Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    new-instance v1, Ll/djp;

    .line 166
    .line 167
    invoke-direct {v1, p0}, Ll/djp;-><init>(Ll/hjp;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public static synthetic u0(Ll/hjp;Ljava/lang/String;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/hjp;->f2(Ljava/lang/String;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private u1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjp;->k:Lrx/subjects/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/cip;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/cip;-><init>(Ll/hjp;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/dip;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/dip;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private u2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hjp;->z:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/hjp;->z:Ll/kcg0;

    .line 8
    .line 9
    return-void
.end method

.method private v1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/fip;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/fip;-><init>(Ll/hjp;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

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

.method private x1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ejp;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/ejp;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/fjp;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/fjp;-><init>(Ll/hjp;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic y0(Ll/hjp;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hjp;->k2(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic z0(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hjp;->l2()V

    return-void
.end method

.method private z1()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/uhp;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/uhp;-><init>(Ll/hjp;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/vhp;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/vhp;-><init>(Ll/hjp;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/qyf;->f()Ll/qyf;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v3, Ll/pkp;

    .line 57
    .line 58
    invoke-virtual {v3}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    const/16 v4, 0x73

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/qyf;->e(Lrx/c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 65
    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/dkb;->wa()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/whp;

    .line 80
    .line 81
    invoke-direct {v1}, Ll/whp;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/xhp;

    .line 100
    .line 101
    invoke-direct {v1}, Ll/xhp;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v1, Ll/yhp;

    .line 109
    .line 110
    invoke-direct {v1}, Ll/yhp;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v1, Ll/zhp;

    .line 126
    .line 127
    invoke-direct {v1, p0}, Ll/zhp;-><init>(Ll/hjp;)V

    .line 128
    .line 129
    .line 130
    new-instance p0, Ll/bip;

    .line 131
    .line 132
    invoke-direct {p0}, Ll/bip;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    return-void
.end method


# virtual methods
.method public A2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hjp;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public B1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjp;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public B2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/hjp;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public C1(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hjp;->u:Ljava/lang/String;

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
    iget-object v0, p0, Ll/hjp;->u:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/hjp;->v:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public C2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/hjp;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public D1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hjp;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public E1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hjp;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public E2(Z)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/hjp;->F2(ZZ)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public F1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hjp;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public F2(ZZ)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object v4, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v4, Ll/pkp;

    .line 12
    .line 13
    invoke-virtual {v4}, Ll/pkp;->m0()Ll/f1g0;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    move-object v4, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v4, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v4, Ll/pkp;

    .line 24
    .line 25
    invoke-virtual {v4}, Ll/pkp;->m0()Ll/f1g0;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-interface {v4}, Ll/f1g0;->o()Ll/ik4;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    :goto_0
    iget-boolean v5, v0, Ll/hjp;->i:Z

    .line 34
    .line 35
    sget-object v6, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 36
    .line 37
    iget-object v7, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v7, Ll/pkp;

    .line 40
    .line 41
    invoke-virtual {v7}, Ll/pkp;->m0()Ll/f1g0;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    invoke-static {v4, v2, v5, v6, v7}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->d(Ll/ik4;ZZLcom/p1/mobile/putong/core/data/SwipeDirection;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    move-object v5, v3

    .line 50
    goto :goto_4

    .line 51
    :cond_1
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 54
    .line 55
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    if-nez v4, :cond_2

    .line 66
    .line 67
    move-object v6, v1

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    .line 71
    :goto_1
    iget-object v7, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast v7, Ll/pkp;

    .line 74
    .line 75
    invoke-virtual {v7}, Ll/pkp;->m0()Ll/f1g0;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    invoke-static {v5, v6, v7}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    if-eqz v4, :cond_4

    .line 84
    .line 85
    iget-object v6, v4, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 86
    .line 87
    if-nez v6, :cond_3

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_3
    iget-object v6, v6, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_4
    :goto_2
    move-object v6, v1

    .line 94
    :goto_3
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/newui/home/d;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 95
    .line 96
    .line 97
    move-object v15, v5

    .line 98
    move-object v5, v4

    .line 99
    move-object v4, v15

    .line 100
    :goto_4
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 103
    .line 104
    invoke-virtual {v6}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    const/4 v7, 0x0

    .line 113
    if-eqz v6, :cond_5

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 120
    .line 121
    .line 122
    const-string v1, "failJailedUser"

    .line 123
    .line 124
    invoke-virtual {v0, v4, v1}, Ll/hjp;->x2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return v7

    .line 128
    :cond_5
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 129
    .line 130
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    if-nez v6, :cond_6

    .line 135
    .line 136
    goto :goto_5

    .line 137
    :cond_6
    iget-object v3, v6, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 138
    .line 139
    :goto_5
    iget-object v8, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 140
    .line 141
    check-cast v8, Ll/pkp;

    .line 142
    .line 143
    iget-object v8, v8, Ll/pkp;->U:Ljava/lang/String;

    .line 144
    .line 145
    const-string v9, "certified"

    .line 146
    .line 147
    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v8

    .line 151
    if-eqz v8, :cond_7

    .line 152
    .line 153
    invoke-static {}, Ll/joa;->f4()Z

    .line 154
    .line 155
    .line 156
    move-result v8

    .line 157
    if-eqz v8, :cond_7

    .line 158
    .line 159
    if-eqz v3, :cond_7

    .line 160
    .line 161
    iget v8, v3, Lcom/p1/mobile/putong/data/VerificationLimit;->tribeSwipeCount:I

    .line 162
    .line 163
    iget v3, v3, Lcom/p1/mobile/putong/data/VerificationLimit;->tribeTotalCount:I

    .line 164
    .line 165
    if-lt v8, v3, :cond_7

    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    const-string v2, "p_intl_tribe_swipe_view,e_intl_tribe_card_like_click,click"

    .line 180
    .line 181
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->intl_advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 182
    .line 183
    invoke-interface {v1, v0, v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 184
    .line 185
    .line 186
    return v7

    .line 187
    :cond_7
    iget-object v3, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 188
    .line 189
    check-cast v3, Ll/pkp;

    .line 190
    .line 191
    invoke-virtual {v3}, Ll/pkp;->m0()Ll/f1g0;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-interface {v3}, Ll/f1g0;->d()Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v8

    .line 203
    if-eqz v8, :cond_12

    .line 204
    .line 205
    instance-of v8, v3, Ll/t7m;

    .line 206
    .line 207
    if-eqz v8, :cond_8

    .line 208
    .line 209
    check-cast v3, Ll/t7m;

    .line 210
    .line 211
    invoke-interface {v3}, Ll/t7m;->k0()Z

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-nez v3, :cond_12

    .line 216
    .line 217
    :cond_8
    iget-boolean v3, v0, Ll/hjp;->h:Z

    .line 218
    .line 219
    if-eqz v3, :cond_12

    .line 220
    .line 221
    if-eqz p1, :cond_9

    .line 222
    .line 223
    iget-object v0, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 224
    .line 225
    check-cast v0, Ll/pkp;

    .line 226
    .line 227
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 232
    .line 233
    invoke-interface {v0, v1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 234
    .line 235
    .line 236
    return v7

    .line 237
    :cond_9
    invoke-direct {v0}, Ll/hjp;->H2()Z

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    const-wide/16 v8, 0x0

    .line 242
    .line 243
    if-eqz v3, :cond_d

    .line 244
    .line 245
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 246
    .line 247
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 248
    .line 249
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/n;->V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 250
    .line 251
    invoke-static {}, Ll/d79;->j0()Z

    .line 252
    .line 253
    .line 254
    move-result v10

    .line 255
    if-eqz v10, :cond_a

    .line 256
    .line 257
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v10

    .line 261
    if-eqz v10, :cond_a

    .line 262
    .line 263
    iget-object v10, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->letter:Ljava/lang/String;

    .line 264
    .line 265
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 266
    .line 267
    .line 268
    move-result v10

    .line 269
    if-nez v10, :cond_a

    .line 270
    .line 271
    sget v3, Lcom/p1/mobile/putong/core/R$string;->a3:I

    .line 272
    .line 273
    invoke-static {v3}, Ll/o1j0;->w(I)V

    .line 274
    .line 275
    .line 276
    goto/16 :goto_6

    .line 277
    .line 278
    :cond_a
    iget-object v10, v6, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 279
    .line 280
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 281
    .line 282
    iget v11, v6, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->reset:I

    .line 283
    .line 284
    mul-int/lit16 v11, v11, 0x3e8

    .line 285
    .line 286
    int-to-long v11, v11

    .line 287
    iget-wide v13, v10, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 288
    .line 289
    add-long/2addr v11, v13

    .line 290
    sget-object v10, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 291
    .line 292
    invoke-virtual {v10}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 293
    .line 294
    .line 295
    move-result-wide v13

    .line 296
    sub-long/2addr v11, v13

    .line 297
    cmp-long v8, v11, v8

    .line 298
    .line 299
    if-lez v8, :cond_b

    .line 300
    .line 301
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 302
    .line 303
    .line 304
    move-result v6

    .line 305
    if-nez v6, :cond_b

    .line 306
    .line 307
    invoke-virtual {v0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 308
    .line 309
    .line 310
    move-result-object v8

    .line 311
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 312
    .line 313
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 314
    .line 315
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 316
    .line 317
    iget-object v14, v3, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 318
    .line 319
    const-string v9, "p_intl_tribe_swipe_view,e_undo_button,click"

    .line 320
    .line 321
    const/4 v11, 0x0

    .line 322
    const/4 v12, 0x0

    .line 323
    const/4 v13, 0x0

    .line 324
    invoke-static/range {v8 .. v14}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 325
    .line 326
    .line 327
    goto/16 :goto_6

    .line 328
    .line 329
    :cond_b
    iget-boolean v6, v0, Ll/hjp;->h:Z

    .line 330
    .line 331
    if-eqz v6, :cond_f

    .line 332
    .line 333
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 334
    .line 335
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 336
    .line 337
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/n;->V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 338
    .line 339
    iget-boolean v6, v6, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 340
    .line 341
    if-eqz v6, :cond_f

    .line 342
    .line 343
    iget-object v6, v0, Ll/hjp;->A:Ljava/lang/Runnable;

    .line 344
    .line 345
    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    .line 346
    .line 347
    .line 348
    invoke-static {}, Ll/spl0;->Z()Z

    .line 349
    .line 350
    .line 351
    move-result v6

    .line 352
    if-eqz v6, :cond_c

    .line 353
    .line 354
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 355
    .line 356
    .line 357
    move-result-object v6

    .line 358
    iget-object v8, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 359
    .line 360
    invoke-virtual {v6, v8}, Ll/bpe0;->i(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    invoke-virtual {v0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 364
    .line 365
    .line 366
    move-result-object v6

    .line 367
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v6

    .line 371
    const-string v8, "other_user_id"

    .line 372
    .line 373
    iget-object v9, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 374
    .line 375
    invoke-static {v8, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 376
    .line 377
    .line 378
    move-result-object v8

    .line 379
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 380
    .line 381
    .line 382
    move-result-object v9

    .line 383
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {v9, v3}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 386
    .line 387
    .line 388
    move-result v3

    .line 389
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    const-string v9, "superlike_quantity"

    .line 394
    .line 395
    invoke-static {v9, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 396
    .line 397
    .line 398
    move-result-object v3

    .line 399
    filled-new-array {v8, v3}, [Ll/pf60;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    const-string v8, "e_undo_superlike"

    .line 404
    .line 405
    invoke-static {v8, v6, v3}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 406
    .line 407
    .line 408
    :cond_c
    move v3, v2

    .line 409
    goto :goto_7

    .line 410
    :cond_d
    iget-object v3, v6, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 411
    .line 412
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 413
    .line 414
    iget v10, v6, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->reset:I

    .line 415
    .line 416
    mul-int/lit16 v10, v10, 0x3e8

    .line 417
    .line 418
    int-to-long v10, v10

    .line 419
    iget-wide v12, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 420
    .line 421
    add-long/2addr v10, v12

    .line 422
    sget-object v3, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 423
    .line 424
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 425
    .line 426
    .line 427
    move-result-wide v12

    .line 428
    sub-long/2addr v10, v12

    .line 429
    cmp-long v3, v10, v8

    .line 430
    .line 431
    if-lez v3, :cond_e

    .line 432
    .line 433
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 434
    .line 435
    .line 436
    move-result v3

    .line 437
    if-nez v3, :cond_e

    .line 438
    .line 439
    invoke-virtual {v0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 440
    .line 441
    .line 442
    move-result-object v8

    .line 443
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 444
    .line 445
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 446
    .line 447
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 448
    .line 449
    iget-object v14, v3, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 450
    .line 451
    const-string v9, "p_intl_tribe_swipe_view,e_undo_button,click"

    .line 452
    .line 453
    const/4 v11, 0x0

    .line 454
    const/4 v12, 0x0

    .line 455
    const/4 v13, 0x0

    .line 456
    invoke-static/range {v8 .. v14}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 457
    .line 458
    .line 459
    goto :goto_6

    .line 460
    :cond_e
    invoke-virtual {v0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 461
    .line 462
    .line 463
    move-result-object v3

    .line 464
    invoke-static {v3}, Ll/axj0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 465
    .line 466
    .line 467
    :cond_f
    :goto_6
    move v3, v7

    .line 468
    :goto_7
    move v6, v3

    .line 469
    if-nez v3, :cond_11

    .line 470
    .line 471
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 472
    .line 473
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 474
    .line 475
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/n;->A3()I

    .line 476
    .line 477
    .line 478
    move-result v3

    .line 479
    sub-int/2addr v3, v2

    .line 480
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 481
    .line 482
    .line 483
    move-result v2

    .line 484
    if-eqz v2, :cond_10

    .line 485
    .line 486
    if-ltz v3, :cond_10

    .line 487
    .line 488
    iget-object v2, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 489
    .line 490
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 491
    .line 492
    .line 493
    move-result v2

    .line 494
    if-le v2, v3, :cond_10

    .line 495
    .line 496
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 497
    .line 498
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 499
    .line 500
    .line 501
    move-result-object v1

    .line 502
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 503
    .line 504
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 505
    .line 506
    iget-object v2, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 507
    .line 508
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 509
    .line 510
    .line 511
    move-result v7

    .line 512
    :cond_10
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 513
    .line 514
    .line 515
    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 516
    .line 517
    .line 518
    invoke-virtual {v4, v7}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 519
    .line 520
    .line 521
    const-string v1, "failUndoLocal"

    .line 522
    .line 523
    invoke-virtual {v0, v4, v1}, Ll/hjp;->x2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 524
    .line 525
    .line 526
    :cond_11
    return v6

    .line 527
    :cond_12
    return v7
.end method

.method public final synthetic H1(Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Ll/hjp;->F:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic I1(Ll/pf60;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "checkIntro error, local has user me is "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v1, ", "

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v1, Ll/vg60;

    .line 43
    .line 44
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    move v1, v2

    .line 53
    :goto_0
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v3, Ll/vg60;

    .line 56
    .line 57
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-ge v1, v3, :cond_2

    .line 64
    .line 65
    const/4 v3, 0x5

    .line 66
    if-ge v1, v3, :cond_2

    .line 67
    .line 68
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v3, Ll/vg60;

    .line 71
    .line 72
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 79
    .line 80
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    const-string v4, "cid-"

    .line 83
    .line 84
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v4, " : "

    .line 91
    .line 92
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 98
    .line 99
    invoke-virtual {v4, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_0

    .line 108
    .line 109
    const-string v3, "1"

    .line 110
    .line 111
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_0
    const-string v3, "0"

    .line 116
    .line 117
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_1
    const-string p1, "local has no conversations"

    .line 124
    .line 125
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    iput v2, p0, Ll/hjp;->F:I

    .line 141
    .line 142
    return-void
.end method

.method public final synthetic J1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/iz40;->y(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/hjp;->p:Lrx/subjects/a;

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic L1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/iz40;->y(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/hjp;->p:Lrx/subjects/a;

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic Q1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hjp;->p1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hjp;->r1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic R1(Ll/pf60;)V
    .locals 10

    .line 1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->needRefresh()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v2, Ll/pkp;

    .line 18
    .line 19
    iget-object v2, v2, Ll/pkp;->F:Ll/s740;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ll/s740;->y(Ljava/util/List;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Ll/hjp;->e:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v4, 0x0

    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-nez v3, :cond_1

    .line 41
    .line 42
    invoke-static {}, Ll/uih0;->m0()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 53
    .line 54
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v3}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-nez v3, :cond_1

    .line 61
    .line 62
    :cond_0
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 67
    .line 68
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v3, p0, Ll/hjp;->e:Ljava/lang/String;

    .line 71
    .line 72
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    const-string v5, ","

    .line 77
    .line 78
    const/4 v6, 0x1

    .line 79
    if-eq v0, v3, :cond_2

    .line 80
    .line 81
    new-instance v3, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v7, "moment render List refresh change "

    .line 84
    .line 85
    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    move v0, v6

    .line 109
    goto :goto_0

    .line 110
    :cond_2
    move v0, v1

    .line 111
    :goto_0
    if-eqz v0, :cond_3

    .line 112
    .line 113
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 114
    .line 115
    check-cast v3, Ll/pkp;

    .line 116
    .line 117
    iget-object v3, v3, Ll/pkp;->F:Ll/s740;

    .line 118
    .line 119
    invoke-virtual {v3, v2}, Ll/s740;->G(Ljava/util/List;)V

    .line 120
    .line 121
    .line 122
    :cond_3
    if-nez v0, :cond_4

    .line 123
    .line 124
    invoke-virtual {p1, v6}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->setRefreshValue(Z)V

    .line 125
    .line 126
    .line 127
    :cond_4
    iput-boolean v6, p0, Ll/hjp;->f:Z

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    new-instance v7, Ll/rip;

    .line 134
    .line 135
    invoke-direct {v7, p0}, Ll/rip;-><init>(Ll/hjp;)V

    .line 136
    .line 137
    .line 138
    const-wide/16 v8, 0x64

    .line 139
    .line 140
    invoke-virtual {v3, v7, v8, v9}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 141
    .line 142
    .line 143
    new-instance v3, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v7, "moment render cards: "

    .line 146
    .line 147
    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->hasMore()Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_5

    .line 167
    .line 168
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_5

    .line 173
    .line 174
    move v0, v6

    .line 175
    goto :goto_1

    .line 176
    :cond_5
    move v0, v4

    .line 177
    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-static {v0}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->hasMore()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-nez p1, :cond_6

    .line 202
    .line 203
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-nez p1, :cond_6

    .line 208
    .line 209
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 210
    .line 211
    check-cast p1, Ll/pkp;

    .line 212
    .line 213
    invoke-virtual {p1, v6, v4, v6}, Ll/pkp;->v1(ZZZ)V

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_6
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 222
    .line 223
    if-eqz p1, :cond_7

    .line 224
    .line 225
    check-cast v0, Ll/pkp;

    .line 226
    .line 227
    invoke-virtual {v0, v6, v6, v6}, Ll/pkp;->v1(ZZZ)V

    .line 228
    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_7
    check-cast v0, Ll/pkp;

    .line 232
    .line 233
    invoke-virtual {v0, v4, v6, v6}, Ll/pkp;->v1(ZZZ)V

    .line 234
    .line 235
    .line 236
    :goto_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 237
    .line 238
    check-cast p1, Ll/pkp;

    .line 239
    .line 240
    invoke-virtual {p1}, Ll/pkp;->J0()Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-nez p1, :cond_8

    .line 245
    .line 246
    iget-object p1, p0, Ll/hjp;->l:Lrx/subjects/a;

    .line 247
    .line 248
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    if-nez p1, :cond_8

    .line 253
    .line 254
    iget-object p0, p0, Ll/hjp;->l:Lrx/subjects/a;

    .line 255
    .line 256
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 257
    .line 258
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 259
    .line 260
    .line 261
    :cond_8
    return-void
.end method

.method public final synthetic S1(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hjp;->g1()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic W1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hjp;->B:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/pkp;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 13
    .line 14
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic X1(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/hjp;->B:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/mip;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/mip;-><init>(Ll/hjp;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v1, 0x1f4

    .line 19
    .line 20
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic Z1(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjp;->n:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hjp;->u1()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/hjp;->t1()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/hjp;->z1()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/hjp;->v1()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/hjp;->x1()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ll/hjp;->s1()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic a2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic b2(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 7
    .line 8
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v1, Ll/pkp;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/pkp;->h0()Lv/VDraweeView;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {p1, v1, v2}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/pkp;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/pkp;->d0()Lcom/facebook/drawee/view/DraweeView;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hjp;->z:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/hjp;->u2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Ll/qyf;->f()Ll/qyf;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/qyf;->d()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public f1()Z
    .locals 1

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 10
    .line 11
    const-string v0, "wechat"

    .line 12
    .line 13
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 28
    .line 29
    const-string v0, "qq"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    :cond_0
    invoke-static {}, Ll/d09;->o()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    iget-object p0, p0, Ll/dkb;->b0:Ll/jxd0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_1

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_1
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public final synthetic f2(Ljava/lang/String;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object p4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p4, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {p4}, Ll/pkp;->m0()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    if-eqz p4, :cond_2

    .line 14
    .line 15
    iget-object p4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p4, Ll/pkp;

    .line 18
    .line 19
    invoke-virtual {p4}, Ll/pkp;->m0()Ll/f1g0;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-interface {p4}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-ne p2, p4, :cond_1

    .line 48
    .line 49
    iget-object p4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p4, Ll/pkp;

    .line 52
    .line 53
    invoke-virtual {p4}, Ll/pkp;->m0()Ll/f1g0;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-interface {p4, v0}, Ll/f1g0;->c(Z)Z

    .line 59
    .line 60
    .line 61
    move-result p4

    .line 62
    if-eqz p4, :cond_2

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-ne p2, p1, :cond_0

    .line 69
    .line 70
    invoke-static {}, Ll/d79;->j0()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_0

    .line 75
    .line 76
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    invoke-direct {p0, p3}, Ll/hjp;->q1(Landroid/content/Intent;)V

    .line 83
    .line 84
    .line 85
    :cond_0
    const/4 p1, 0x1

    .line 86
    invoke-virtual {p0, p1}, Ll/hjp;->E2(Z)Z

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->fromValue(I)Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 95
    .line 96
    check-cast p0, Ll/pkp;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    return-void
.end method

.method public g1()V
    .locals 3

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
    if-nez v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Ll/hjp;->F:I

    .line 13
    .line 14
    iget-object v0, p0, Ll/hjp;->G:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/hjp;->G:Ll/kcg0;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/hjp;->G:Ll/kcg0;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 33
    .line 34
    .line 35
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "checkIntro error when illegal account state, userId:"

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ", login: "

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, ", me == null"

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->on()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 97
    .line 98
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    new-instance v2, Ll/mw30;

    .line 103
    .line 104
    invoke-direct {v2}, Ll/mw30;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/vip;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/vip;-><init>(Ll/hjp;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/xip;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/xip;-><init>(Ll/hjp;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Ll/hjp;->G:Ll/kcg0;

    .line 138
    .line 139
    :cond_1
    return-void
.end method

.method public final synthetic g2(Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p3, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {p3}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 10
    .line 11
    .line 12
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p3, v0}, Ll/dkb;->va(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Al:I

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v1, Ll/zip;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/zip;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {p3, v0, p1, p0, v1}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    const-string p0, "fake_to_good_dlg"

    .line 61
    .line 62
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_0

    .line 67
    .line 68
    invoke-static {}, Ll/fph0;->G()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    const-string p0, "fakeView"

    .line 73
    .line 74
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_1

    .line 79
    .line 80
    invoke-static {}, Ll/fph0;->v()V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method public final synthetic h2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pkp;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public i1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/hjp;->v:Ljava/lang/String;

    .line 3
    .line 4
    iput-object v0, p0, Ll/hjp;->u:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i2(Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/n;->S3()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p1, Ll/pkp;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/pkp;->J0()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Ll/hjp;->E:Z

    .line 40
    .line 41
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Ll/pkp;

    .line 44
    .line 45
    const/4 p2, 0x0

    .line 46
    invoke-virtual {p0, p1, p2}, Ll/pkp;->u1(ZZ)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public final synthetic j2(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->Null:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 2
    .line 3
    if-ne p2, p1, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/fph0;->h:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Ll/fph0;->l0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/xxv;->n(Lcom/p1/mobile/android/app/Act;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const-string p1, "off"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p1, "on"

    .line 25
    .line 26
    :goto_0
    sget-object p2, Ll/fph0;->h:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p2, p1}, Ll/fph0;->m0(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :goto_1
    invoke-direct {p0}, Ll/hjp;->l1()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public k1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hjp;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k2(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hjp;->l1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hjp;->l1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/hjp;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public m2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hjp;->E:Z

    .line 3
    .line 4
    return-void
.end method

.method public n1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjp;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n2(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    const/16 v0, 0x72

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/pkp;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p1, Ll/pkp;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/pkp;->m0()Ll/f1g0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eq p2, v0, :cond_0

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eq p2, v0, :cond_0

    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-ne p2, v0, :cond_2

    .line 76
    .line 77
    :cond_0
    const/4 v0, 0x1

    .line 78
    iput-boolean v0, p0, Ll/hjp;->i:Z

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/hip;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/hip;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/iip;

    .line 94
    .line 95
    invoke-direct {v1, p0, p1, p2, p3}, Ll/iip;-><init>(Ll/hjp;Ljava/lang/String;ILandroid/content/Intent;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_1
    const/16 v0, 0x73

    .line 107
    .line 108
    if-ne p1, v0, :cond_2

    .line 109
    .line 110
    const/4 p1, -0x1

    .line 111
    if-ne p2, p1, :cond_2

    .line 112
    .line 113
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Ljava/util/ArrayList;

    .line 120
    .line 121
    const-string p2, "from"

    .line 122
    .line 123
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-direct {p0, p1, p2}, Ll/hjp;->q2(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_2
    return-void
.end method

.method public o1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjp;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o2(Ll/xql;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/hjp;->D:Ll/g6m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/rfh0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/rfh0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/hjp;->D:Ll/g6m;

    .line 11
    .line 12
    :cond_0
    iget-boolean v0, p0, Ll/hjp;->f:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 17
    .line 18
    const-string v1, "moment onCardSwipe be called before card rendered"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/tl9;->b()Ll/skk0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {p1}, Ll/xql;->e0()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-interface {p1}, Ll/xql;->getCardDataProxy()Ll/ik4;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const-string v1, ""

    .line 51
    .line 52
    :goto_0
    iput-object v1, v0, Ll/skk0;->b:Ljava/lang/String;

    .line 53
    .line 54
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    const/4 v2, 0x0

    .line 58
    if-eq p2, v0, :cond_4

    .line 59
    .line 60
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 61
    .line 62
    if-ne p2, v3, :cond_3

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    move v3, v2

    .line 66
    goto :goto_3

    .line 67
    :cond_4
    :goto_2
    move v3, v1

    .line 68
    :goto_3
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 69
    .line 70
    if-ne p2, v4, :cond_5

    .line 71
    .line 72
    move v5, v1

    .line 73
    goto :goto_4

    .line 74
    :cond_5
    move v5, v2

    .line 75
    :goto_4
    if-nez p3, :cond_6

    .line 76
    .line 77
    iget-object v6, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast v6, Ll/pkp;

    .line 80
    .line 81
    invoke-virtual {v6, v3, v5}, Ll/pkp;->W(ZZ)Ll/avl;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    invoke-interface {v6}, Ll/avl;->i()V

    .line 86
    .line 87
    .line 88
    :cond_6
    if-eqz v3, :cond_8

    .line 89
    .line 90
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 91
    .line 92
    if-eqz v5, :cond_7

    .line 93
    .line 94
    check-cast v3, Ll/pkp;

    .line 95
    .line 96
    invoke-virtual {v3}, Ll/pkp;->f0()Ll/avl;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-interface {v3}, Ll/avl;->reset()V

    .line 101
    .line 102
    .line 103
    goto :goto_5

    .line 104
    :cond_7
    check-cast v3, Ll/pkp;

    .line 105
    .line 106
    invoke-virtual {v3}, Ll/pkp;->n0()Ll/avl;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-interface {v3}, Ll/avl;->reset()V

    .line 111
    .line 112
    .line 113
    :goto_5
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 114
    .line 115
    check-cast v3, Ll/pkp;

    .line 116
    .line 117
    invoke-virtual {v3}, Ll/pkp;->c0()Ll/avl;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-interface {v3}, Ll/avl;->reset()V

    .line 122
    .line 123
    .line 124
    goto :goto_6

    .line 125
    :cond_8
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 126
    .line 127
    check-cast v3, Ll/pkp;

    .line 128
    .line 129
    invoke-virtual {v3}, Ll/pkp;->f0()Ll/avl;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-interface {v3}, Ll/avl;->reset()V

    .line 134
    .line 135
    .line 136
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 137
    .line 138
    check-cast v3, Ll/pkp;

    .line 139
    .line 140
    invoke-virtual {v3}, Ll/pkp;->n0()Ll/avl;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-interface {v3}, Ll/avl;->reset()V

    .line 145
    .line 146
    .line 147
    :goto_6
    invoke-interface {p1, p2}, Ll/xql;->j0(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 148
    .line 149
    .line 150
    const-string v3, "card"

    .line 151
    .line 152
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->E(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    const-string v3, "swipe"

    .line 156
    .line 157
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->F(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 161
    .line 162
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 163
    .line 164
    if-eq p2, v0, :cond_a

    .line 165
    .line 166
    if-ne p2, v4, :cond_9

    .line 167
    .line 168
    goto :goto_7

    .line 169
    :cond_9
    move v1, v2

    .line 170
    :cond_a
    :goto_7
    invoke-virtual {v3, v1}, Ll/r4a;->e(Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/hjp;->D:Ll/g6m;

    .line 174
    .line 175
    new-instance v3, Ll/rfh0$a;

    .line 176
    .line 177
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 178
    .line 179
    move-object v5, v1

    .line 180
    check-cast v5, Ll/pkp;

    .line 181
    .line 182
    invoke-interface {p1}, Ll/xql;->getCardDataProxy()Ll/ik4;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    move-object v4, p0

    .line 187
    move-object v7, p2

    .line 188
    move v8, p3

    .line 189
    invoke-direct/range {v3 .. v8}, Ll/rfh0$a;-><init>(Ll/hjp;Ll/pkp;Ll/ik4;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 190
    .line 191
    .line 192
    invoke-interface {v0, v3}, Ll/g6m;->a(Ll/e2m;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    check-cast p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 197
    .line 198
    sget-object p1, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 199
    .line 200
    if-ne p0, p1, :cond_b

    .line 201
    .line 202
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 203
    .line 204
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 205
    .line 206
    invoke-virtual {p2}, Ll/r4a;->f()V

    .line 207
    .line 208
    .line 209
    :cond_b
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 210
    .line 211
    if-eq p0, p2, :cond_c

    .line 212
    .line 213
    if-ne p0, p1, :cond_d

    .line 214
    .line 215
    :cond_c
    invoke-virtual {v4}, Ll/hjp;->i1()V

    .line 216
    .line 217
    .line 218
    :cond_d
    iput-boolean v2, v4, Ll/hjp;->i:Z

    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 221
    .line 222
    .line 223
    move-result p2

    .line 224
    if-eqz p2, :cond_e

    .line 225
    .line 226
    iget-object p2, v4, Ll/ar2;->viewModel:Ll/iam;

    .line 227
    .line 228
    check-cast p2, Ll/pkp;

    .line 229
    .line 230
    invoke-virtual {p2, p0, v7}, Ll/pkp;->y1(Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 231
    .line 232
    .line 233
    if-eq p0, p1, :cond_e

    .line 234
    .line 235
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 236
    .line 237
    :cond_e
    return-object p0
.end method

.method public p1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/asj0;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/pkp;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/pkp;->G0()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Ll/pkp;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast v0, Ll/pkp;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/pkp;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    instance-of v0, p0, Ll/t7m;

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    check-cast p0, Ll/t7m;

    .line 78
    .line 79
    invoke-interface {p0}, Ll/q7m;->y()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    invoke-interface {p0}, Ll/t7m;->L()V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public p2(Z)V
    .locals 5

    .line 1
    iput-boolean p1, p0, Ll/hjp;->x:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/hjp;->y:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/dkb;->H9()Lrx/c;

    .line 20
    .line 21
    .line 22
    iget-boolean v1, p0, Ll/hjp;->g:Z

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iput-boolean v0, p0, Ll/hjp;->g:Z

    .line 27
    .line 28
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast v1, Ll/pkp;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/pkp;->m0()Ll/f1g0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v1, Ll/pkp;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/pkp;->m0()Ll/f1g0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast v1, Ll/pkp;

    .line 63
    .line 64
    iget-object v1, v1, Ll/pkp;->U:Ljava/lang/String;

    .line 65
    .line 66
    const-string v2, "intl_tribe_source_name"

    .line 67
    .line 68
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast v2, Ll/pkp;

    .line 75
    .line 76
    invoke-virtual {v2}, Ll/pkp;->m0()Ll/f1g0;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {v2}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 85
    .line 86
    const-string v3, "receiver_user_id"

    .line 87
    .line 88
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    filled-new-array {v1, v2}, [Ll/sfj0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const-string v2, "e_intl_tribe_card"

    .line 97
    .line 98
    const-string v3, "p_intl_tribe_swipe_view"

    .line 99
    .line 100
    invoke-static {v2, v3, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 104
    .line 105
    check-cast v1, Ll/pkp;

    .line 106
    .line 107
    invoke-virtual {v1}, Ll/pkp;->m0()Ll/f1g0;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->i(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 127
    .line 128
    check-cast v1, Ll/pkp;

    .line 129
    .line 130
    invoke-virtual {v1}, Ll/pkp;->m0()Ll/f1g0;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    iget-object v3, p0, Ll/hjp;->c:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {p0, v3}, Ll/hjp;->B1(Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    invoke-static {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->r(Ll/ik4;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 153
    .line 154
    .line 155
    :cond_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 156
    .line 157
    check-cast v1, Ll/pkp;

    .line 158
    .line 159
    invoke-virtual {v1, p1}, Ll/pkp;->n1(Z)V

    .line 160
    .line 161
    .line 162
    iget-boolean p1, p0, Ll/hjp;->x:Z

    .line 163
    .line 164
    if-nez p1, :cond_3

    .line 165
    .line 166
    iget-boolean p1, p0, Ll/hjp;->w:Z

    .line 167
    .line 168
    if-eqz p1, :cond_1

    .line 169
    .line 170
    iput-boolean v0, p0, Ll/hjp;->w:Z

    .line 171
    .line 172
    return-void

    .line 173
    :cond_1
    iget-boolean p1, p0, Ll/hjp;->o:Z

    .line 174
    .line 175
    if-eqz p1, :cond_3

    .line 176
    .line 177
    iget-object p1, p0, Ll/hjp;->k:Lrx/subjects/a;

    .line 178
    .line 179
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    if-eqz p1, :cond_2

    .line 184
    .line 185
    iget-object p1, p0, Ll/hjp;->k:Lrx/subjects/a;

    .line 186
    .line 187
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 192
    .line 193
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 194
    .line 195
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    if-eqz p1, :cond_3

    .line 200
    .line 201
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 202
    .line 203
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 204
    .line 205
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/n;->x3()V

    .line 206
    .line 207
    .line 208
    iget-object p0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 209
    .line 210
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 211
    .line 212
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    :cond_3
    return-void
.end method

.method public r1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne v0, v1, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Ll/pkp;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/pkp;->G0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v0, Ll/pkp;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v0, Ll/pkp;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/pkp;->A1()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    sget-boolean v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    sput-boolean v1, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 53
    .line 54
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v0, Ll/pkp;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/pkp;->B1()V

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-static {}, Ll/f4s;->d()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-static {v1}, Ll/f4s;->e(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast v0, Ll/pkp;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/pkp;->B1()V

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast v0, Ll/pkp;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/pkp;->Z()Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_2

    .line 90
    .line 91
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 92
    .line 93
    check-cast p0, Ll/pkp;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/pkp;->B1()V

    .line 96
    .line 97
    .line 98
    :cond_2
    return-void
.end method

.method public r2()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/hjp;->t:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x7d0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/hjp;->t:J

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0}, Ll/hjp;->v2(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public s2(I[Ljava/lang/String;[I)V
    .locals 2
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p2, 0x0

    .line 2
    move v0, p2

    .line 3
    :goto_0
    array-length v1, p3

    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    aget v1, p3, v0

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 p3, 0x1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    move p3, p2

    .line 16
    :goto_1
    if-eqz p3, :cond_2

    .line 17
    .line 18
    sget-object v0, Ll/fph0;->h:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Ll/fph0;->l0(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    goto :goto_3

    .line 24
    :cond_2
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/xxv;->n(Lcom/p1/mobile/android/app/Act;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    const-string v0, "off"

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_3
    const-string v0, "on"

    .line 38
    .line 39
    :goto_2
    sget-object v1, Ll/fph0;->h:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/fph0;->m0(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :goto_3
    const/16 v0, 0x700

    .line 45
    .line 46
    if-ne p1, v0, :cond_5

    .line 47
    .line 48
    if-nez p3, :cond_4

    .line 49
    .line 50
    invoke-direct {p0}, Ll/hjp;->D2()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast p1, Ll/pkp;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/pkp;->j0()Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget-object p3, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;->requested:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 63
    .line 64
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->e(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;)V

    .line 65
    .line 66
    .line 67
    iget-boolean p1, p0, Ll/hjp;->r:Z

    .line 68
    .line 69
    if-eqz p1, :cond_5

    .line 70
    .line 71
    iput-boolean p2, p0, Ll/hjp;->r:Z

    .line 72
    .line 73
    iget-boolean p1, p0, Ll/hjp;->q:Z

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    iget-object p0, p0, Ll/hjp;->j:Lrx/subjects/a;

    .line 78
    .line 79
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    :cond_5
    return-void
.end method

.method public t2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hjp;->s:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/pkp;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pkp;->s1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public v2(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hjp;->k:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 8
    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->hasMore()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 24
    .line 25
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    move-object v2, v1

    .line 28
    check-cast v2, Ll/pkp;

    .line 29
    .line 30
    iget-object v2, v2, Ll/pkp;->T:Ljava/lang/String;

    .line 31
    .line 32
    check-cast v1, Ll/pkp;

    .line 33
    .line 34
    iget-object v1, v1, Ll/pkp;->U:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, v2, v1}, Lcom/p1/mobile/putong/core/api/n;->U3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {p1, v1}, Lrx/c;->take(I)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v1, Ll/nip;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/nip;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v2, Ll/oip;

    .line 55
    .line 56
    invoke-direct {v2, p0, v0}, Ll/oip;-><init>(Ll/hjp;Lrx/subjects/a;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public w2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/hjp;->i:Z

    .line 6
    .line 7
    invoke-static {}, Ll/sdp;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public x2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "success"

    .line 8
    .line 9
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "reason_type"

    .line 24
    .line 25
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    filled-new-array {v1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "e_user_cant_rightswipe_reason"

    .line 34
    .line 35
    invoke-static {v2, v0, v1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    sget-object v0, Ll/hjp$b;->a:[I

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/d;->k()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    aget v0, v0, v1

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    if-eq v0, v1, :cond_5

    .line 52
    .line 53
    const/4 v1, 0x2

    .line 54
    if-eq v0, v1, :cond_4

    .line 55
    .line 56
    const/4 v1, 0x3

    .line 57
    if-eq v0, v1, :cond_3

    .line 58
    .line 59
    const/4 v1, 0x4

    .line 60
    if-eq v0, v1, :cond_2

    .line 61
    .line 62
    const/4 v1, 0x5

    .line 63
    if-eq v0, v1, :cond_1

    .line 64
    .line 65
    const-string v0, "unknow"

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const-string v0, "unkown"

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const-string v0, "back"

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    const-string v0, "up"

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    const-string v0, "left"

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    const-string v0, "right"

    .line 81
    .line 82
    :goto_0
    invoke-virtual {p0}, Ll/hjp;->e1()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v2, "direction"

    .line 91
    .line 92
    invoke-static {v2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 97
    .line 98
    check-cast v2, Ll/pkp;

    .line 99
    .line 100
    iget-object v2, v2, Ll/pkp;->U:Ljava/lang/String;

    .line 101
    .line 102
    const-string v3, "intl_tribe_source_name"

    .line 103
    .line 104
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    filled-new-array {v0, v2}, [Ll/sfj0$a;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const-string v2, "e_intl_tribe_card"

    .line 113
    .line 114
    invoke-static {v2, v1, v0}, Ll/sfj0;->g(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 115
    .line 116
    .line 117
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const/4 p1, 0x0

    .line 121
    iput-boolean p1, p0, Ll/hjp;->i:Z

    .line 122
    .line 123
    invoke-static {}, Ll/sdp;->b()V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public y2(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/hjp;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public z2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hjp;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
