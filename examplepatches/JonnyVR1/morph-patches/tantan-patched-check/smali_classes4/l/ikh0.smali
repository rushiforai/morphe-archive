.class public Ll/ikh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dxv$c;


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Ll/vxd0;

.field public f:Ll/vxd0;

.field public g:Ll/vxd0;

.field public h:Ll/vxd0;

.field public i:Ll/byd0;

.field public j:Ll/vxd0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vxd0;

    .line 5
    .line 6
    const-string v1, "dislike_count_device"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ikh0;->e:Ll/vxd0;

    .line 13
    .line 14
    new-instance v0, Ll/vxd0;

    .line 15
    .line 16
    const-string v1, "like_count_device"

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/ikh0;->f:Ll/vxd0;

    .line 22
    .line 23
    new-instance v0, Ll/vxd0;

    .line 24
    .line 25
    const-string v1, "superlike_count_device"

    .line 26
    .line 27
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/ikh0;->g:Ll/vxd0;

    .line 31
    .line 32
    new-instance v0, Ll/vxd0;

    .line 33
    .line 34
    const-string v1, "like_superlike_count_device"

    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/ikh0;->h:Ll/vxd0;

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->h:Ll/vwa;

    .line 42
    .line 43
    iget-object v0, v0, Ll/vwa;->b:Ll/byd0;

    .line 44
    .line 45
    iput-object v0, p0, Ll/ikh0;->i:Ll/byd0;

    .line 46
    .line 47
    new-instance v0, Ll/vxd0;

    .line 48
    .line 49
    const-string v1, "without_match_like_superlike_count_device"

    .line 50
    .line 51
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Ll/ikh0;->j:Ll/vxd0;

    .line 55
    .line 56
    return-void
.end method

.method public static synthetic c(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikh0;->u()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikh0;->v()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikh0;->w()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikh0;->p()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikh0;->t()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ikh0;->n()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ikh0;->o()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikh0;->s()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k()Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static synthetic l(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ikh0;->r()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Ll/ikh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ikh0;->q()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private synthetic n()Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/ikh0;->d:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private synthetic o()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikh0;->i:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private synthetic q()Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/ikh0;->a:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private synthetic r()Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/ikh0;->b:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public a(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/dxv$b<",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/xjh0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xjh0;-><init>(Ll/ikh0;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "swipe_count_session"

    .line 7
    .line 8
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/akh0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/akh0;-><init>(Ll/ikh0;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "swipe_count_device"

    .line 17
    .line 18
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/bkh0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/bkh0;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v1, "without_match_like_superlike_count_session"

    .line 27
    .line 28
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/ckh0;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/ckh0;-><init>(Ll/ikh0;)V

    .line 34
    .line 35
    .line 36
    const-string v1, "dislike_count_session"

    .line 37
    .line 38
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/dkh0;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/dkh0;-><init>(Ll/ikh0;)V

    .line 44
    .line 45
    .line 46
    const-string v1, "superlike_count_session"

    .line 47
    .line 48
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/ekh0;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/ekh0;-><init>(Ll/ikh0;)V

    .line 54
    .line 55
    .line 56
    const-string v1, "like_superlike_count_session"

    .line 57
    .line 58
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/fkh0;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/fkh0;-><init>(Ll/ikh0;)V

    .line 64
    .line 65
    .line 66
    const-string v1, "dislike_count_device"

    .line 67
    .line 68
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/gkh0;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/gkh0;-><init>(Ll/ikh0;)V

    .line 74
    .line 75
    .line 76
    const-string v1, "like_count_device"

    .line 77
    .line 78
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    new-instance v0, Ll/hkh0;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/hkh0;-><init>(Ll/ikh0;)V

    .line 84
    .line 85
    .line 86
    const-string v1, "superlike_count_device"

    .line 87
    .line 88
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    new-instance v0, Ll/yjh0;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Ll/yjh0;-><init>(Ll/ikh0;)V

    .line 94
    .line 95
    .line 96
    const-string v1, "like_superlike_count_device"

    .line 97
    .line 98
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    new-instance v0, Ll/zjh0;

    .line 102
    .line 103
    invoke-direct {v0, p0}, Ll/zjh0;-><init>(Ll/ikh0;)V

    .line 104
    .line 105
    .line 106
    const-string p0, "without_match_like_superlike_count_device"

    .line 107
    .line 108
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public b(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/dxv$a<",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final synthetic p()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikh0;->j:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic s()Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/ikh0;->c:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic t()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikh0;->e:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic u()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikh0;->f:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic v()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikh0;->g:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic w()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikh0;->h:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
