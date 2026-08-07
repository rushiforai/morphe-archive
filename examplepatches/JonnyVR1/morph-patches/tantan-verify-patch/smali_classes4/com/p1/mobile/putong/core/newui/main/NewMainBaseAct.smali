.class public abstract Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;
.super Lcom/p1/mobile/putong/core/LauncherAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/k930;",
        ">",
        "Lcom/p1/mobile/putong/core/LauncherAct;",
        "Ll/crl;"
    }
.end annotation


# static fields
.field public static l:Z = true


# instance fields
.field public g:Ljava/lang/Runnable;

.field public h:Ll/k930;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/LauncherAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->i:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->j:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->k:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic A2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->Y3()V

    return-void
.end method

.method public static synthetic B2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->f4(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic C2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->D3()V

    return-void
.end method

.method private synthetic C3()V
    .locals 2

    .line 1
    sget-object v0, Ll/d1k0;->f:Lrx/subjects/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/l730;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/l730;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic D2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/dc2;->d(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic D3()V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/m730;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/m730;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic E2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->a4()V

    return-void
.end method

.method private synthetic E3()V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/u630;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/u630;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic F2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->K3()V

    return-void
.end method

.method private synthetic F3()V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/i730;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/i730;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic G3()V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/safety/CrashTestActivity;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic H2(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Ll/tg50;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method private synthetic H3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/h2g;->b(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic I2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->Z3()V

    return-void
.end method

.method private synthetic I3()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    const-string v1, "test"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->o1(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic J3()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS_EXTRA:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    const-string v1, "test"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->o1(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic K2()V
    .locals 2

    .line 1
    const-wide/16 v0, 0xfa0

    .line 2
    .line 3
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    const/4 v0, 0x0

    .line 7
    :goto_0
    const v1, 0xf4240

    .line 8
    .line 9
    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method private synthetic K3()V
    .locals 1

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
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->l0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/android/app/Dialog;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic L2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->J3()V

    return-void
.end method

.method private synthetic L3()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "\u95ea\u804a\u5269\u4f59\u6b21\u6570\uff1a"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic M2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->d4()V

    return-void
.end method

.method private synthetic M3()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;-><init>()V

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
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->name:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikk2MlRQNldBSVFaM1ZRRFRPU01FSFdIS043Nk5RUTA0IiwidyI6MTk2MCwiaCI6MTk1OSwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjYxNzE0NDg5Nzk1MzUzMzg2ODAsImFiIjowfQ.jpg?format=128x128"

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->avatarUrl:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, ""

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->action:Ljava/lang/String;

    .line 56
    .line 57
    const-string v1, "female"

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gender:Ljava/lang/String;

    .line 60
    .line 61
    const-string v1, "10"

    .line 62
    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->age:Ljava/lang/String;

    .line 64
    .line 65
    const/16 v1, 0x64

    .line 66
    .line 67
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->distance:I

    .line 68
    .line 69
    const-string v1, "\u559c\u6b22\u5e7f\u573a\u821e"

    .line 70
    .line 71
    const-string v2, "\u559c\u6b22\u54c8\u54c8\u54c8"

    .line 72
    .line 73
    const-string v3, "\u5531\u5404\u8428\u8fbe\u591a\u4e2a"

    .line 74
    .line 75
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    new-instance v2, Ll/p730;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/p730;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->n0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static synthetic N2(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic N3()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;-><init>()V

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
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->name:Ljava/lang/String;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikk2MlRQNldBSVFaM1ZRRFRPU01FSFdIS043Nk5RUTA0IiwidyI6MTk2MCwiaCI6MTk1OSwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjYxNzE0NDg5Nzk1MzUzMzg2ODAsImFiIjowfQ.jpg?format=128x128"

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->avatarUrl:Ljava/lang/String;

    .line 43
    .line 44
    const-string v1, ""

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->action:Ljava/lang/String;

    .line 47
    .line 48
    const-string v1, "female"

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gender:Ljava/lang/String;

    .line 51
    .line 52
    const-string v1, "10"

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->age:Ljava/lang/String;

    .line 55
    .line 56
    const/16 v1, 0x64

    .line 57
    .line 58
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->distance:I

    .line 59
    .line 60
    const-string v1, "\u559c\u6b22\u5e7f\u573a\u821e"

    .line 61
    .line 62
    const-string v2, "\u559c\u6b22\u54c8\u54c8\u54c8"

    .line 63
    .line 64
    const-string v3, "\u5531\u5404\u8428\u8fbe\u591a\u4e2a"

    .line 65
    .line 66
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v2, Ll/o730;

    .line 71
    .line 72
    invoke-direct {v2}, Ll/o730;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    const/4 v1, 0x0

    .line 84
    invoke-static {p0, v1, v0}, Ll/jxb0;->e(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static synthetic Q2(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/ls4;->c:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic R2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic R3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "active_unmatch"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->e4()V

    return-void
.end method

.method private synthetic S3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "passive_unmatch"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic T2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->H3()V

    return-void
.end method

.method private synthetic T3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "overheat_protection"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic U2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g4()V

    return-void
.end method

.method private synthetic U3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "use_up"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic V2()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v1, Ll/h730;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/h730;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic V3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "match_timeout"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic W2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->R3()V

    return-void
.end method

.method private synthetic W3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "active_unmatch"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic X2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->G3()V

    return-void
.end method

.method private synthetic X3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "passive_unmatch"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic Y3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "overheat_protection"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic Z2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->I3()V

    return-void
.end method

.method private synthetic Z3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "use_up"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->i4()V

    return-void
.end method

.method private synthetic a4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "match_timeout"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ll/gs50;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->X3()V

    return-void
.end method

.method public static synthetic d3()V
    .locals 0

    .line 1
    invoke-static {}, Landroid/os/Debug;->stopMethodTracing()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "Change ip"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v0, 0x64

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p0, v0}, Ll/w1e$b;->E(I)Ll/w1e$b;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, ""

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/w1e$b;->H(Ljava/lang/String;)Ll/w1e$b;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/n730;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/n730;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic e3()V
    .locals 0

    .line 1
    :goto_0
    nop

    .line 2
    goto :goto_0
.end method

.method private synthetic e4()V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/map/IntlMapAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/k730;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/k730;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic f3(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->j4()V

    return-void
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->c4()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->O3(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic i3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->F3()V

    return-void
.end method

.method private synthetic i4()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->i()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->i:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->U3()V

    return-void
.end method

.method public static synthetic k2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/tg50;->g()Ll/tg50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tg50;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->M3()V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->B3(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic m2(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->i0:Ll/z1f;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/z1f;->c(Ljava/lang/String;)Ll/y1f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string v0, "null"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 13
    .line 14
    :goto_0
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->i0:Ll/z1f;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/z1f;->a(Ll/y1f;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->W3()V

    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->V3()V

    return-void
.end method

.method public static synthetic n3(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/dc2;->d(Z)V

    .line 3
    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/v;->Y:Z

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic o2()V
    .locals 0

    .line 1
    :goto_0
    nop

    .line 2
    goto :goto_0
.end method

.method public static synthetic o3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    div-int/lit8 v0, v0, 0x0

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->L3()V

    return-void
.end method

.method public static synthetic p3()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->w3(Landroid/content/Context;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "copied device info to clipboard"

    .line 11
    .line 12
    invoke-static {v0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic q2(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->W(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sput-object p0, Lcom/p1/mobile/putong/core/api/g0;->Q:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic q3()V
    .locals 4

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/bnl0;->y0()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Ll/bnl0;->w0()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 27
    .line 28
    div-float/2addr v2, v3

    .line 29
    float-to-int v2, v2

    .line 30
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "screen height = %s, width = %s, dh = %s"

    .line 39
    .line 40
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic r2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->C3()V

    return-void
.end method

.method public static synthetic r3()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->m0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->N3()V

    return-void
.end method

.method public static synthetic s3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->S3()V

    return-void
.end method

.method public static synthetic t3()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "crash test  from "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw v0
.end method

.method public static synthetic u2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->T3()V

    return-void
.end method

.method public static synthetic u3(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->E3()V

    return-void
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->b4(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic w2(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static w3(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/qzd;->d()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "wifi"

    .line 11
    .line 12
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroid/net/wifi/WifiManager;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v2, "mac"

    .line 27
    .line 28
    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    move-object v1, p0

    .line 38
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    :cond_1
    const-string p0, "device_id"

    .line 49
    .line 50
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    return-object p0

    .line 58
    :catch_0
    move-exception p0

    .line 59
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method public static synthetic y2(IILandroid/content/Intent;)Z
    .locals 2

    .line 1
    const-string p0, "map_location"

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/DoublePair;

    .line 8
    .line 9
    new-instance p1, Lcom/p1/mobile/putong/location/a$b;

    .line 10
    .line 11
    const-string p2, "debug_intl_live_blocking_location"

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-direct {p1, p2, v0}, Lcom/p1/mobile/putong/location/a$b;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/location/Location;)V

    .line 15
    .line 16
    .line 17
    new-instance p2, Lcom/p1/mobile/putong/location/Location;

    .line 18
    .line 19
    const-string v0, "tantan"

    .line 20
    .line 21
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/location/Location;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 25
    .line 26
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/location/Location;->K(D)V

    .line 27
    .line 28
    .line 29
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 30
    .line 31
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/location/Location;->M(D)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public static synthetic z2()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    div-int/lit8 v0, v0, 0x0

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic B3(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v630;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/v630;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "crash"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/w630;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/w630;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "anr"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/x630;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/x630;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v1, "device info"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic O3(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/a730;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/a730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "Online Match Membership Pay"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/b730;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/b730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "Online Match Numbers Pay"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/c730;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/c730;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v1, "Online Match Default Match"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/d730;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/d730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "Online Match Default Match Dlg"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/e730;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/e730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 63
    .line 64
    .line 65
    const-string v1, "Online Match Left Times"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/f730;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/f730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 77
    .line 78
    .line 79
    const-string v1, "Online Match Broadcast Match"

    .line 80
    .line 81
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v0, Ll/g730;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Ll/g730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 91
    .line 92
    .line 93
    const-string v1, "Online tip  audio Match  "

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final synthetic b4(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/j630;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/j630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "Online Match View Initiative"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/k630;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/k630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "Online Match View Passivity"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/l630;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/l630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 35
    .line 36
    .line 37
    const-string v1, "Online Match View Overheating"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/m630;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/m630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "Online Match View NoTime"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/o630;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/o630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 63
    .line 64
    .line 65
    const-string v1, "Online Match View Search Timeout"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/p630;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/p630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 77
    .line 78
    .line 79
    const-string v1, "Online Match General Initiative"

    .line 80
    .line 81
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v0, Ll/q630;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Ll/q630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 91
    .line 92
    .line 93
    const-string v1, "Online Match General Passivity"

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    new-instance v0, Ll/r630;

    .line 103
    .line 104
    invoke-direct {v0, p0}, Ll/r630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 105
    .line 106
    .line 107
    const-string v1, "Online Match General Overheating"

    .line 108
    .line 109
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/s630;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ll/s630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 119
    .line 120
    .line 121
    const-string v1, "Online Match General NoTime"

    .line 122
    .line 123
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    new-instance v0, Ll/t630;

    .line 131
    .line 132
    invoke-direct {v0, p0}, Ll/t630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 133
    .line 134
    .line 135
    const-string v1, "Online Match General Search Timeout"

    .line 136
    .line 137
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final synthetic c4()V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/map/IntlMapAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const/16 v1, 0x444

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 3
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
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->debugItems()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/r730;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/r730;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "\u5206\u8fa8\u7387"

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
    new-instance v1, Ll/y530;

    .line 20
    .line 21
    invoke-direct {v1, p0, v0}, Ll/y530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "crash/anr the app/get device info"

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
    new-instance v1, Ll/z530;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/z530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 36
    .line 37
    .line 38
    const-string v2, "fake my app version for update api"

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
    new-instance v1, Ll/a630;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/a630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 50
    .line 51
    .line 52
    const-string v2, "set distributor "

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
    new-instance v1, Ll/b630;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/b630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 64
    .line 65
    .line 66
    const-string v2, "set engine params"

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
    new-instance v1, Ll/d630;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/d630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 78
    .line 79
    .line 80
    const-string v2, "engine example"

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
    new-instance v1, Ll/e630;

    .line 90
    .line 91
    invoke-direct {v1}, Ll/e630;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v2, "Make the app crash(main)"

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
    new-instance v1, Ll/f630;

    .line 104
    .line 105
    invoke-direct {v1}, Ll/f630;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v2, "Make the app crash(thread)"

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
    new-instance v1, Ll/g630;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/g630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 120
    .line 121
    .line 122
    const-string v2, "CrashTestActivity"

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
    new-instance v1, Ll/h630;

    .line 132
    .line 133
    invoke-direct {v1}, Ll/h630;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v2, "Block UI thread"

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
    new-instance v1, Ll/s730;

    .line 146
    .line 147
    invoke-direct {v1}, Ll/s730;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string v2, "Block UI thread for long"

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
    new-instance v1, Ll/t730;

    .line 160
    .line 161
    invoke-direct {v1, p0}, Ll/t730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 162
    .line 163
    .line 164
    const-string v2, "Change location"

    .line 165
    .line 166
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    new-instance v1, Ll/u730;

    .line 174
    .line 175
    invoke-direct {v1, p0, v0}, Ll/u730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V

    .line 176
    .line 177
    .line 178
    const-string v2, "online Match debugItem"

    .line 179
    .line 180
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    new-instance v1, Ll/s530;

    .line 188
    .line 189
    invoke-direct {v1, p0, v0}, Ll/s530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V

    .line 190
    .line 191
    .line 192
    const-string v2, "online Match Dlg"

    .line 193
    .line 194
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    new-instance v1, Ll/t530;

    .line 202
    .line 203
    invoke-direct {v1, p0}, Ll/t530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 204
    .line 205
    .line 206
    const-string v2, "Pick city"

    .line 207
    .line 208
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    new-instance v1, Ll/u530;

    .line 216
    .line 217
    invoke-direct {v1, p0}, Ll/u530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 218
    .line 219
    .line 220
    const-string v2, "Change ip for httpdns"

    .line 221
    .line 222
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    new-instance v1, Ll/v530;

    .line 230
    .line 231
    invoke-direct {v1}, Ll/v530;-><init>()V

    .line 232
    .line 233
    .line 234
    const-string v2, "pull httpdns data"

    .line 235
    .line 236
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    new-instance v1, Ll/w530;

    .line 244
    .line 245
    invoke-direct {v1, p0}, Ll/w530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 246
    .line 247
    .line 248
    const-string v2, "Set the live blocking location(Int\'l)"

    .line 249
    .line 250
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    new-instance v1, Ll/x530;

    .line 258
    .line 259
    invoke-direct {v1, p0, v0}, Ll/x530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V

    .line 260
    .line 261
    .line 262
    const-string p0, "mln"

    .line 263
    .line 264
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    return-object v0
.end method

.method public final synthetic f4(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic g4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/LauncherAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->z3()Ll/k930;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/k930;->z1()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/LauncherAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/n630;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/n630;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/y630;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/y630;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/k930;->a0()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/j730;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/j730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/q730;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/q730;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    invoke-static {v0, p0}, Ll/uqb0;->r0(Ljava/lang/Runnable;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic j4()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->i:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->j:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->i:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, ","

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->j:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/z630;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/z630;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_0

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->i:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v1, "-----"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->j:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    new-instance v0, Ll/pf60;

    .line 77
    .line 78
    const-string v1, "content"

    .line 79
    .line 80
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    filled-new-array {v0}, [Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, "e_ab_modify"

    .line 88
    .line 89
    const-string v2, ""

    .line 90
    .line 91
    invoke-static {v1, v2, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 92
    .line 93
    .line 94
    const-string v0, "[putong-common][ab]"

    .line 95
    .line 96
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void
.end method

.method public k4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_1

    .line 3
    .line 4
    const/16 v0, 0x21

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/k930;->B1(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->y3()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/toh0;->i(Landroid/content/Intent;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/p1/mobile/android/app/App;->b:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/i630;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/i630;-><init>()V

    .line 11
    .line 12
    .line 13
    const-wide/16 v1, 0x3e8

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget-boolean v0, Lcom/p1/mobile/android/app/App;->c:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->l:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->l:Z

    .line 28
    .line 29
    sput-boolean v0, Lcom/p1/mobile/android/app/App;->c:Z

    .line 30
    .line 31
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/k930;->D1()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onStopLifecycle()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onStopLifecycle()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->j:Ljava/lang/String;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->i()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->j:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ll/c630;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/c630;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public showInput(Landroid/view/View;I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/k930;->e1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    sget-object v3, Ll/og3;->b:Ll/og3;

    .line 8
    .line 9
    const-string v4, "frag"

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->x3()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    const-string v1, "notification navigation"

    .line 16
    .line 17
    move-object v6, v3

    .line 18
    filled-new-array/range {v1 .. v6}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public v3(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract x3()Ljava/lang/String;
.end method

.method public y3()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r530;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/r530;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->g:Ljava/lang/Runnable;

    .line 13
    .line 14
    const-wide/16 v1, 0x1f4

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->h:Ll/k930;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/k930;->f1(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public abstract z3()Ll/k930;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TP;"
        }
    .end annotation
.end method
