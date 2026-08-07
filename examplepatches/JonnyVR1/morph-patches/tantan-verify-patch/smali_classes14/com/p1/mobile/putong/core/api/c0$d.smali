.class public Lcom/p1/mobile/putong/core/api/c0$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/c0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/core/api/c0$c;",
            ">;"
        }
    .end annotation
.end field

.field public d:J

.field public e:J

.field public f:J

.field public g:Z

.field public h:J

.field public i:J

.field public j:J

.field public k:Z

.field public final synthetic l:Lcom/p1/mobile/putong/core/api/c0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c0;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->l:Lcom/p1/mobile/putong/core/api/c0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->b:Z

    .line 8
    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->e:J

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->f:J

    .line 14
    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->g:Z

    .line 16
    .line 17
    const-wide/16 v2, 0x1

    .line 18
    .line 19
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/api/c0$d;->h:J

    .line 20
    .line 21
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->i:J

    .line 22
    .line 23
    const-wide/16 v0, 0x3c

    .line 24
    .line 25
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->j:J

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->k:Z

    .line 29
    .line 30
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/c0;Ll/gbb;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/api/c0$d;-><init>(Lcom/p1/mobile/putong/core/api/c0;)V

    return-void
.end method


# virtual methods
.method public a(ZJ)Lcom/p1/mobile/putong/core/api/c0$b;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/c0$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/c0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/c0$b;->b:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->e:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/api/c0$b;->d:J

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->f:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/api/c0$b;->e:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->d:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/api/c0$b;->c:J

    .line 21
    .line 22
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/api/c0$b;->a:Z

    .line 23
    .line 24
    iput-wide p2, v0, Lcom/p1/mobile/putong/core/api/c0$b;->f:J

    .line 25
    .line 26
    return-object v0
.end method

.method public b(Lcom/p1/mobile/putong/core/api/c0$a;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/c0$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->a:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/c0$a;->b:Lcom/p1/mobile/putong/core/api/c0$c;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->c:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/api/c0$a;->c:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->e:J

    .line 17
    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->d:J

    .line 23
    .line 24
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/api/c0$a;->d:J

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->f:J

    .line 27
    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/api/c0$a;->e:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->g:Z

    .line 31
    .line 32
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/api/c0$a;->f:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->b:Z

    .line 35
    .line 36
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/api/c0$a;->g:J

    .line 37
    .line 38
    const-wide/16 v2, 0x3e8

    .line 39
    .line 40
    mul-long/2addr v0, v2

    .line 41
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->h:J

    .line 42
    .line 43
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/api/c0$a;->i:J

    .line 44
    .line 45
    mul-long/2addr v0, v2

    .line 46
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/c0$d;->j:J

    .line 47
    .line 48
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/api/c0$a;->h:Z

    .line 49
    .line 50
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/c0$d;->k:Z

    .line 51
    .line 52
    return-void
.end method
