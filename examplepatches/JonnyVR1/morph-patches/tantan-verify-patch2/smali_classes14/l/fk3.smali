.class public Ll/fk3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fk3$a;,
        Ll/fk3$b;
    }
.end annotation


# instance fields
.field public a:Ll/fk3$a;

.field public b:Lcom/p1/mobile/putong/data/SchemeKey;

.field public c:Ll/abe0;

.field public d:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/UserLiveState;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/VoiceLiveState;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LiveWindowInfo;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/dgu;

.field public k:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/lc3;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/m4s;",
            ">;"
        }
    .end annotation
.end field

.field public o:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public p:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public q:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public r:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/fk3$b;",
            ">;"
        }
    .end annotation
.end field

.field public s:Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;

.field public t:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final u:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final v:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCounter;",
            ">;"
        }
    .end annotation
.end field

.field public w:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/a9d0;",
            ">;"
        }
    .end annotation
.end field

.field public x:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fk3;->e:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/fk3;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/fk3;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    .line 25
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/fk3;->h:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/fk3;->i:Lrx/subjects/b;

    .line 36
    .line 37
    new-instance v0, Ll/dgu;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/dgu;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/fk3;->j:Ll/dgu;

    .line 43
    .line 44
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Ll/fk3;->k:Lrx/subjects/b;

    .line 49
    .line 50
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Ll/fk3;->l:Lrx/subjects/a;

    .line 55
    .line 56
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Ll/fk3;->m:Lrx/subjects/b;

    .line 61
    .line 62
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Ll/fk3;->n:Lrx/subjects/a;

    .line 67
    .line 68
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Ll/fk3;->o:Lrx/subjects/a;

    .line 73
    .line 74
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Ll/fk3;->p:Lrx/subjects/a;

    .line 79
    .line 80
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Ll/fk3;->q:Lrx/subjects/a;

    .line 85
    .line 86
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Ll/fk3;->r:Lrx/subjects/a;

    .line 91
    .line 92
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Ll/fk3;->t:Lrx/subjects/a;

    .line 97
    .line 98
    const/4 v0, -0x1

    .line 99
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Ll/fk3;->u:Lrx/subjects/a;

    .line 108
    .line 109
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Ll/fk3;->v:Lrx/subjects/a;

    .line 114
    .line 115
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Ll/fk3;->w:Lrx/subjects/b;

    .line 120
    .line 121
    return-void
.end method

.method public static synthetic a(Ll/fk3$b;)Ljava/lang/Boolean;
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

.method public static synthetic b(Ll/fk3;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fk3;->H(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c(Ll/fk3;Ll/fk3$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fk3;->G(Ll/fk3$b;)V

    return-void
.end method


# virtual methods
.method public A()Lrx/c;
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
    iget-object p0, p0, Ll/fk3;->m:Lrx/subjects/b;

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

.method public B(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->e:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveState;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveState;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public C(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveState;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->e:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveState;

    .line 8
    .line 9
    return-object p0
.end method

.method public D(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VoiceLiveState;->voiceLiveId:Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public E(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VoiceLiveState;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 8
    .line 9
    return-object p0
.end method

.method public F(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fk3;->b:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Ll/fk3;->c:Ll/abe0;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    const-string v1, "enterVoiceRoom"

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string v0, "cards"

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1, v0}, Ll/mbs;->r(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/fk3;->c:Ll/abe0;

    .line 35
    .line 36
    const-string v1, "tabId"

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {p1, v0}, Ll/h3g0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Ll/fk3;->b:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "live"

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    invoke-static {v1}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {p1, v0}, Ll/mbs;->r(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v1, p0, Ll/fk3;->b:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 76
    .line 77
    new-instance v2, Ll/abe0$a;

    .line 78
    .line 79
    iget-object v3, p0, Ll/fk3;->c:Ll/abe0;

    .line 80
    .line 81
    invoke-virtual {v3}, Ll/abe0;->c()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-direct {v2, p1, v3}, Ll/abe0$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, Ll/abe0$a;->d()Ll/abe0;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v3, p0, Ll/fk3;->d:Ll/z20;

    .line 93
    .line 94
    invoke-virtual {v0, v1, v2, v3}, Ll/t4k0;->e(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)V

    .line 95
    .line 96
    .line 97
    const/4 v0, 0x0

    .line 98
    invoke-virtual {p1, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 99
    .line 100
    .line 101
    :cond_2
    invoke-virtual {p0}, Ll/fk3;->f()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final synthetic G(Ll/fk3$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->r:Lrx/subjects/a;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fk3;->e:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/fk3;->e:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 21
    .line 22
    const-string v1, "onlive"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 33
    .line 34
    const-string v2, "suspended"

    .line 35
    .line 36
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/fk3;->e:Ljava/util/concurrent/ConcurrentHashMap;

    .line 43
    .line 44
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 47
    .line 48
    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Ll/fk3;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 52
    .line 53
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    iget-object v0, p0, Ll/fk3;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 62
    .line 63
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->state:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    iget-object p0, p0, Ll/fk3;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 79
    .line 80
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 83
    .line 84
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    :cond_4
    return-void
.end method

.method public I(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->k:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fk3;->m:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    new-instance v0, Ll/ck3;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/ck3;-><init>(Ll/fk3;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fk3;->o:Lrx/subjects/a;

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

.method public M(Ll/m4s;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/fk3;->n()Ll/m4s;

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
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/m4s;->a()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/m4s;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/m4s;->a()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p1}, Ll/m4s;->a()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    :cond_0
    iget-object p0, p0, Ll/fk3;->n:Lrx/subjects/a;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    iget-object p0, p0, Ll/fk3;->n:Lrx/subjects/a;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    iget-object p0, p0, Ll/fk3;->n:Lrx/subjects/a;

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fk3;->s:Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fk3;->t:Lrx/subjects/a;

    .line 4
    .line 5
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SchemeKey;",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fk3;->b:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fk3;->c:Ll/abe0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/fk3;->d:Ll/z20;

    .line 6
    .line 7
    return-void
.end method

.method public P(Ll/fk3$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fk3;->a:Ll/fk3$a;

    .line 2
    .line 3
    return-void
.end method

.method public Q(Ll/fk3$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->r:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R(Ll/lc3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fk3;->j:Ll/dgu;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dgu;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ll/j6t;->u(Lcom/p1/mobile/putong/data/User;Z)V

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/fk3;->i:Lrx/subjects/b;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fk3;->j:Ll/dgu;

    .line 2
    .line 3
    const-string v0, "scene_out_live_room"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/dgu;->a(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->v:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/fk3;->b:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 3
    .line 4
    iput-object v0, p0, Ll/fk3;->c:Ll/abe0;

    .line 5
    .line 6
    iput-object v0, p0, Ll/fk3;->d:Ll/z20;

    .line 7
    .line 8
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/fk3;->a:Ll/fk3$a;

    .line 3
    .line 4
    return-void
.end method

.method public h()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCounter;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fk3;->v:Lrx/subjects/a;

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

.method public i()Lcom/p1/mobile/putong/live/base/data/BLiveCounter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->v:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 8
    .line 9
    return-object p0
.end method

.method public j()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fk3;->h:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->requestBubble()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveNormalApi;->requestBubble()V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/fk3;->h:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fk3;->h:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public l()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fk3;->i:Lrx/subjects/b;

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

.method public m()Ll/fk3$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->a:Ll/fk3$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ll/m4s;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->n:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/m4s;

    .line 8
    .line 9
    return-object p0
.end method

.method public o()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/m4s;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fk3;->n:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
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
    iget-object p0, p0, Ll/fk3;->o:Lrx/subjects/a;

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

.method public q()Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->s:Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Lrx/c;
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
    iget-object p0, p0, Ll/fk3;->t:Lrx/subjects/a;

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

.method public s()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/lc3;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fk3;->l:Lrx/subjects/a;

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

.method public t()Ll/lc3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/lc3;

    .line 8
    .line 9
    return-object p0
.end method

.method public u()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->p:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public v(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk3;->j:Ll/dgu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgu;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public w()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fk3;->x:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->requestMyLiveHierarchy()V

    .line 6
    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    return-wide v0

    .line 11
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 12
    .line 13
    return-wide v0
.end method

.method public x()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/a9d0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fk3;->w:Lrx/subjects/b;

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

.method public y()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/fk3$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fk3;->r:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/dk3;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/dk3;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/ek3;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/ek3;-><init>(Ll/fk3;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public z()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fk3;->k:Lrx/subjects/b;

    .line 2
    .line 3
    const-wide/16 v0, 0x5

    .line 4
    .line 5
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, v2}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
