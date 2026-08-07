.class public Lcom/p1/mobile/putong/ui/download/DownloadTask;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/ui/download/DownloadTask$State;,
        Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    }
.end annotation


# instance fields
.field public A:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public D:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public E:Lcom/tantanapp/common/network/ApiCallBack;

.field public F:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public G:Z

.field public a:Ll/rg50;

.field public b:J

.field public c:Z

.field public d:Z

.field public e:I

.field public f:J

.field public g:J

.field public h:J

.field public i:Ljava/lang/String;

.field public j:I

.field public k:Ljava/lang/Throwable;

.field public l:Ljava/lang/String;

.field public m:J

.field public n:J

.field public o:J

.field public p:Ljava/lang/String;

.field public q:I

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Ljava/lang/String;

.field public u:I

.field public v:I

.field public w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

.field public x:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field public y:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->b:J

    .line 7
    .line 8
    const/4 v2, -0x1

    .line 9
    iput v2, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->e:I

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 14
    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->h:J

    .line 16
    .line 17
    const-string v2, ""

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->i:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    iput v3, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->j:I

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->l:Ljava/lang/String;

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->m:J

    .line 27
    .line 28
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->n:J

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->o:J

    .line 31
    .line 32
    iput-object v2, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->p:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->r:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->s:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->t:Ljava/lang/String;

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->NORMAL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x:Ll/y20;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->y:Ll/z20;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->z:Ll/y20;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->A:Ll/z20;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->B:Ll/z20;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->C:Ll/z20;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->D:Ll/z20;

    .line 58
    .line 59
    iput-boolean v3, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->G:Z

    .line 60
    .line 61
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/download/DownloadTask$a;)V
    .locals 0

    .line 62
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/y20;)Ll/y20;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->z:Ll/y20;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->A:Ll/z20;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->C:Ll/z20;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->D:Ll/z20;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->B:Ll/z20;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/ui/download/DownloadTask;Lcom/tantanapp/common/network/ApiCallBack;)Lcom/tantanapp/common/network/ApiCallBack;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->E:Lcom/tantanapp/common/network/ApiCallBack;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/ui/download/DownloadTask;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->u:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/ui/download/DownloadTask;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/util/Map;)Ljava/util/Map;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->F:Ljava/util/Map;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/ui/download/DownloadTask;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->G:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/y20;)Ll/y20;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x:Ll/y20;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->y:Ll/z20;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public A()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->FAIL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public B()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->NEED_PAUSE:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public C()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->NEED_RESUME:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public D()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->PAUSED:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public E()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method public F()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->SUCCESS:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->CANCEL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->NEED_PAUSE:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->PAUSED:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->NEED_RESUME:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->CANCEL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->z:Ll/y20;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public J(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->y:Ll/z20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x:Ll/y20;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->y:Ll/z20;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->z:Ll/y20;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->A:Ll/z20;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->B:Ll/z20;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->C:Ll/z20;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->D:Ll/z20;

    .line 15
    .line 16
    return-void
.end method

.method public L(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->FAIL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->D:Ll/z20;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public M(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->A:Ll/z20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {v0, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public N(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->CANCEL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-eq v0, v1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->PAUSED:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->NORMAL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 21
    .line 22
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->B:Ll/z20;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {v0, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x:Ll/y20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public P(Ljava/io/File;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->SUCCESS:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->C:Ll/z20;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public Q()V
    .locals 2

    .line 1
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->CANCEL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->PAUSED:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Ll/ynl;->c(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method public R(Z)Lcom/p1/mobile/putong/ui/download/DownloadTask;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->G:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public S()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-ltz v0, :cond_1

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->b:J

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iget-wide v2, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->b:J

    .line 26
    .line 27
    sub-long/2addr v0, v2

    .line 28
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iget v2, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v:I

    .line 33
    .line 34
    int-to-long v2, v2

    .line 35
    cmp-long v0, v0, v2

    .line 36
    .line 37
    if-lez v0, :cond_1

    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->y()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->e:I

    .line 44
    .line 45
    if-eq v1, v0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    iput-wide v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->b:J

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->M(I)V

    .line 54
    .line 55
    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->e:I

    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->CANCEL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->I()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->K()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public q()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/a;->x(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-wide v2, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->b:J

    .line 20
    .line 21
    sub-long/2addr v0, v2

    .line 22
    long-to-int p0, v0

    .line 23
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    rsub-int p0, p0, 0xc8

    .line 28
    .line 29
    if-lez p0, :cond_0

    .line 30
    .line 31
    int-to-long v0, p0

    .line 32
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public r()Lcom/tantanapp/common/network/ApiCallBack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->E:Lcom/tantanapp/common/network/ApiCallBack;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public t()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public u()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->F:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public x()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()I
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-lez v2, :cond_2

    .line 9
    .line 10
    iget-wide v4, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 11
    .line 12
    long-to-float p0, v4

    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    mul-float/2addr p0, v2

    .line 16
    const/high16 v2, 0x42c80000    # 100.0f

    .line 17
    .line 18
    mul-float/2addr p0, v2

    .line 19
    long-to-float v0, v0

    .line 20
    div-float/2addr p0, v0

    .line 21
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-gez p0, :cond_0

    .line 26
    .line 27
    return v3

    .line 28
    :cond_0
    const/16 v0, 0x64

    .line 29
    .line 30
    if-le p0, v0, :cond_1

    .line 31
    .line 32
    return v0

    .line 33
    :cond_1
    return p0

    .line 34
    :cond_2
    return v3
.end method

.method public z()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$State;->CANCEL:Lcom/p1/mobile/putong/ui/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
