.class public Lcom/p1/mobile/putong/core/ui/onlinematch/b;
.super Ll/pq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;
    }
.end annotation


# instance fields
.field public b:Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;

.field public c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;)V
    .locals 2

    .line 1
    const-wide/32 v0, 0x493e0

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, v0, v1}, Ll/pq2;-><init>(J)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/sv50;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/sv50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/b;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->c:Ljava/lang/Runnable;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;J)V
    .locals 0

    .line 17
    invoke-direct {p0, p2, p3}, Ll/pq2;-><init>(J)V

    .line 18
    new-instance p2, Ll/sv50;

    invoke-direct {p2, p0}, Ll/sv50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/b;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->c:Ljava/lang/Runnable;

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/onlinematch/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->c:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->c:Ljava/lang/Runnable;

    .line 9
    .line 10
    iget-wide v2, p0, Ll/pq2;->a:J

    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->c:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
