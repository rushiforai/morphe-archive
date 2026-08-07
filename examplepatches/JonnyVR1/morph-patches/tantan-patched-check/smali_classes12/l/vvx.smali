.class public Ll/vvx;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:J

.field public B:J

.field public C:J

.field public D:J

.field public E:J

.field public F:J

.field public G:J

.field public H:J

.field public I:J

.field public J:J

.field public K:J

.field public L:J

.field public M:J

.field public N:J

.field public O:J

.field public P:J

.field public Q:J

.field public R:J

.field public S:Ljava/lang/String;

.field public T:Ljava/lang/String;

.field public U:J

.field public V:J

.field public W:J

.field public X:Z

.field public Y:Ljava/lang/String;

.field public Z:Ljava/lang/String;

.field public a:J

.field public a0:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public b0:J

.field public c:Ljava/lang/String;

.field public c0:J

.field public d:Ljava/lang/String;

.field public d0:J

.field public e:J

.field public e0:Ljava/lang/String;

.field public f:J

.field public f0:J

.field public g:J

.field public g0:I

.field public h:J

.field public h0:J

.field public i:J

.field public j:J

.field public k:J

.field public l:J

.field public m:J

.field public n:Z

.field public o:J

.field public p:Ljava/lang/String;

.field public q:J

.field public r:J

.field public s:J

.field public t:J

.field public u:J

.field public v:J

.field public w:J

.field public x:J

.field public y:J

.field public z:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Ll/vvx;->a:J

    .line 9
    .line 10
    const-string v0, "0.0.0.0"

    .line 11
    .line 12
    iput-object v0, p0, Ll/vvx;->d:Ljava/lang/String;

    .line 13
    .line 14
    const-wide/16 v0, 0x2

    .line 15
    .line 16
    iput-wide v0, p0, Ll/vvx;->q:J

    .line 17
    .line 18
    const-wide/16 v0, 0x6f

    .line 19
    .line 20
    iput-wide v0, p0, Ll/vvx;->O:J

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Ll/vvx;->W:J

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    iput-boolean v2, p0, Ll/vvx;->X:Z

    .line 28
    .line 29
    const-string v2, ""

    .line 30
    .line 31
    iput-object v2, p0, Ll/vvx;->e0:Ljava/lang/String;

    .line 32
    .line 33
    iput-wide v0, p0, Ll/vvx;->f0:J

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    iput v2, p0, Ll/vvx;->g0:I

    .line 37
    .line 38
    iput-wide v0, p0, Ll/vvx;->h0:J

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "127.0.0.1"

    .line 2
    .line 3
    iget-object v1, p0, Ll/vvx;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "0.0.0.0"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/vvx;->d:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public b()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/vvx;->A:J

    .line 4
    .line 5
    iput-wide v0, p0, Ll/vvx;->B:J

    .line 6
    .line 7
    iput-wide v0, p0, Ll/vvx;->C:J

    .line 8
    .line 9
    iput-wide v0, p0, Ll/vvx;->D:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/vvx;->E:J

    .line 12
    .line 13
    iput-wide v0, p0, Ll/vvx;->F:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/vvx;->G:J

    .line 16
    .line 17
    iput-wide v0, p0, Ll/vvx;->R:J

    .line 18
    .line 19
    return-void
.end method
