.class public Ll/mq70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a7h0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/a7h0<",
        "Ll/lq70;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/rjm;

.field public final c:Ll/nq70;

.field public final d:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/v36;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/u36;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ll/gjm;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/kde;)V
    .locals 1

    .line 53
    invoke-static {}, Ll/vjm;->m()Ll/vjm;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Ll/mq70;-><init>(Landroid/content/Context;Ll/vjm;Ll/kde;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/vjm;Ljava/util/Set;Ljava/util/Set;Ll/kde;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/vjm;",
            "Ljava/util/Set<",
            "Ll/v36;",
            ">;",
            "Ljava/util/Set<",
            "Ll/u36;",
            ">;",
            "Ll/kde;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mq70;->a:Landroid/content/Context;

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/vjm;->k()Ll/rjm;

    .line 7
    .line 8
    .line 9
    move-result-object p5

    .line 10
    iput-object p5, p0, Ll/mq70;->b:Ll/rjm;

    .line 11
    .line 12
    new-instance v0, Ll/nq70;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/nq70;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/mq70;->c:Ll/nq70;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {}, Ll/ytd;->b()Ll/ytd;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p2, p1}, Ll/vjm;->b(Landroid/content/Context;)Ll/rce;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {}, Ll/esj0;->v()Ll/esj0;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {p5}, Ll/rjm;->n()Ll/mpy;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    const/4 v6, 0x0

    .line 40
    const/4 v7, 0x0

    .line 41
    invoke-virtual/range {v0 .. v7}, Ll/nq70;->a(Landroid/content/res/Resources;Ll/ytd;Ll/rce;Ljava/util/concurrent/Executor;Ll/mpy;Lcom/facebook/common/internal/ImmutableList;Ll/a7h0;)V

    .line 42
    .line 43
    .line 44
    iput-object p3, p0, Ll/mq70;->d:Ljava/util/Set;

    .line 45
    .line 46
    iput-object p4, p0, Ll/mq70;->e:Ljava/util/Set;

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Ll/mq70;->f:Ll/gjm;

    .line 50
    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/vjm;Ll/kde;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    .line 52
    invoke-direct/range {v0 .. v5}, Ll/mq70;-><init>(Landroid/content/Context;Ll/vjm;Ljava/util/Set;Ljava/util/Set;Ll/kde;)V

    return-void
.end method


# virtual methods
.method public a()Ll/lq70;
    .locals 6

    .line 1
    new-instance v0, Ll/lq70;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mq70;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mq70;->c:Ll/nq70;

    .line 6
    .line 7
    iget-object v3, p0, Ll/mq70;->b:Ll/rjm;

    .line 8
    .line 9
    iget-object v4, p0, Ll/mq70;->d:Ljava/util/Set;

    .line 10
    .line 11
    iget-object v5, p0, Ll/mq70;->e:Ljava/util/Set;

    .line 12
    .line 13
    invoke-direct/range {v0 .. v5}, Ll/lq70;-><init>(Landroid/content/Context;Ll/nq70;Ll/rjm;Ljava/util/Set;Ljava/util/Set;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/mq70;->f:Ll/gjm;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/lq70;->M(Ll/gjm;)Ll/lq70;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mq70;->a()Ll/lq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
