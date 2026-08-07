.class public final Lcom/google/android/exoplayer2/ExoPlayer$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/ExoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Landroid/os/Looper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public D:Z

.field public final a:Landroid/content/Context;

.field public b:Ll/qa5;

.field public c:J

.field public d:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Ll/lzc0;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Lcom/google/android/exoplayer2/source/i$a;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Ll/cgj0;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Ll/ltv;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Ll/md2;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/adj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/adj<",
            "Ll/qa5;",
            "Ll/dk0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Landroid/os/Looper;

.field public k:Lcom/google/android/exoplayer2/util/PriorityTaskManager;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public l:Lcom/google/android/exoplayer2/audio/a;

.field public m:Z

.field public n:I

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:I

.field public s:I

.field public t:Z

.field public u:Ll/nke0;

.field public v:J

.field public w:J

.field public x:Lcom/google/android/exoplayer2/m;

.field public y:J

.field public z:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 83
    new-instance v0, Ll/w7f;

    invoke-direct {v0, p1}, Ll/w7f;-><init>(Landroid/content/Context;)V

    new-instance v1, Ll/x7f;

    invoke-direct {v1, p1}, Ll/x7f;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/ExoPlayer$c;-><init>(Landroid/content/Context;Ll/b7h0;Ll/b7h0;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/b7h0;Ll/b7h0;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/b7h0<",
            "Ll/lzc0;",
            ">;",
            "Ll/b7h0<",
            "Lcom/google/android/exoplayer2/source/i$a;",
            ">;)V"
        }
    .end annotation

    .line 82
    new-instance v4, Ll/a8f;

    invoke-direct {v4, p1}, Ll/a8f;-><init>(Landroid/content/Context;)V

    new-instance v5, Ll/b8f;

    invoke-direct {v5}, Ll/b8f;-><init>()V

    new-instance v6, Ll/c8f;

    invoke-direct {v6, p1}, Ll/c8f;-><init>(Landroid/content/Context;)V

    new-instance v7, Ll/d8f;

    invoke-direct {v7}, Ll/d8f;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer2/ExoPlayer$c;-><init>(Landroid/content/Context;Ll/b7h0;Ll/b7h0;Ll/b7h0;Ll/b7h0;Ll/b7h0;Ll/adj;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/b7h0;Ll/b7h0;Ll/b7h0;Ll/b7h0;Ll/b7h0;Ll/adj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/b7h0<",
            "Ll/lzc0;",
            ">;",
            "Ll/b7h0<",
            "Lcom/google/android/exoplayer2/source/i$a;",
            ">;",
            "Ll/b7h0<",
            "Ll/cgj0;",
            ">;",
            "Ll/b7h0<",
            "Ll/ltv;",
            ">;",
            "Ll/b7h0<",
            "Ll/md2;",
            ">;",
            "Ll/adj<",
            "Ll/qa5;",
            "Ll/dk0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/content/Context;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->a:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->d:Ll/b7h0;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->e:Ll/b7h0;

    .line 15
    .line 16
    iput-object p4, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->f:Ll/b7h0;

    .line 17
    .line 18
    iput-object p5, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->g:Ll/b7h0;

    .line 19
    .line 20
    iput-object p6, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->h:Ll/b7h0;

    .line 21
    .line 22
    iput-object p7, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->i:Ll/adj;

    .line 23
    .line 24
    invoke-static {}, Ll/bmk0;->R()Landroid/os/Looper;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->j:Landroid/os/Looper;

    .line 29
    .line 30
    sget-object p1, Lcom/google/android/exoplayer2/audio/a;->g:Lcom/google/android/exoplayer2/audio/a;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->l:Lcom/google/android/exoplayer2/audio/a;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput p1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->n:I

    .line 36
    .line 37
    const/4 p2, 0x1

    .line 38
    iput p2, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->r:I

    .line 39
    .line 40
    iput p1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->s:I

    .line 41
    .line 42
    iput-boolean p2, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->t:Z

    .line 43
    .line 44
    sget-object p1, Ll/nke0;->g:Ll/nke0;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->u:Ll/nke0;

    .line 47
    .line 48
    const-wide/16 p3, 0x1388

    .line 49
    .line 50
    iput-wide p3, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->v:J

    .line 51
    .line 52
    const-wide/16 p3, 0x3a98

    .line 53
    .line 54
    iput-wide p3, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->w:J

    .line 55
    .line 56
    new-instance p1, Lcom/google/android/exoplayer2/f$b;

    .line 57
    .line 58
    invoke-direct {p1}, Lcom/google/android/exoplayer2/f$b;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/f$b;->a()Lcom/google/android/exoplayer2/f;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->x:Lcom/google/android/exoplayer2/m;

    .line 66
    .line 67
    sget-object p1, Ll/qa5;->a:Ll/qa5;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->b:Ll/qa5;

    .line 70
    .line 71
    const-wide/16 p3, 0x1f4

    .line 72
    .line 73
    iput-wide p3, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->y:J

    .line 74
    .line 75
    const-wide/16 p3, 0x7d0

    .line 76
    .line 77
    iput-wide p3, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->z:J

    .line 78
    .line 79
    iput-boolean p2, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->B:Z

    .line 80
    .line 81
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)Ll/lzc0;
    .locals 1

    .line 1
    new-instance v0, Ll/vrd;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vrd;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/source/i$a;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ll/cgj0;)Ll/cgj0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Landroid/content/Context;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/d;

    .line 2
    .line 3
    new-instance v1, Ll/tod;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/tod;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/source/d;-><init>(Landroid/content/Context;Ll/esf;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static synthetic e(Landroid/content/Context;)Ll/md2;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/pmd;->n(Landroid/content/Context;)Ll/pmd;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Landroid/content/Context;)Ll/cgj0;
    .locals 1

    .line 1
    new-instance v0, Ll/atd;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/atd;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public g()Lcom/google/android/exoplayer2/ExoPlayer;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->D:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 6
    .line 7
    .line 8
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->D:Z

    .line 9
    .line 10
    new-instance v0, Lcom/google/android/exoplayer2/i;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/i;-><init>(Lcom/google/android/exoplayer2/ExoPlayer$c;Lcom/google/android/exoplayer2/t;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public h(Lcom/google/android/exoplayer2/source/i$a;)Lcom/google/android/exoplayer2/ExoPlayer$c;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->D:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/z7f;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/z7f;-><init>(Lcom/google/android/exoplayer2/source/i$a;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->e:Ll/b7h0;

    .line 17
    .line 18
    return-object p0
.end method

.method public i(Ll/cgj0;)Lcom/google/android/exoplayer2/ExoPlayer$c;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->D:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/y7f;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/y7f;-><init>(Ll/cgj0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/google/android/exoplayer2/ExoPlayer$c;->f:Ll/b7h0;

    .line 17
    .line 18
    return-object p0
.end method
