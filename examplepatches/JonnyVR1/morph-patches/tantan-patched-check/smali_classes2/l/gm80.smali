.class public Ll/gm80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gm80$b;,
        Ll/gm80$c;,
        Ll/gm80$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation
.end field

.field public final b:Ll/xc80;

.field public final c:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Ll/wk90;Ll/xc80;Ljava/util/concurrent/Executor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/xc80;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/wk90;

    .line 9
    .line 10
    iput-object p1, p0, Ll/gm80;->a:Ll/wk90;

    .line 11
    .line 12
    iput-object p2, p0, Ll/gm80;->b:Ll/xc80;

    .line 13
    .line 14
    invoke-static {p3}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/util/concurrent/Executor;

    .line 19
    .line 20
    iput-object p1, p0, Ll/gm80;->c:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic c(Ll/gm80;)Ll/xc80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gm80;->b:Ll/xc80;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/gm80;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gm80;->c:Ljava/util/concurrent/Executor;

    return-object p0
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->m()Ll/fm80;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-static {v4}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/gm80$a;

    .line 17
    .line 18
    move-object v1, p0

    .line 19
    move-object v2, p1

    .line 20
    move-object v5, p2

    .line 21
    invoke-direct/range {v0 .. v5}, Ll/gm80$a;-><init>(Ll/gm80;Ll/z06;Ll/cl90;Ll/fm80;Ll/yk90;)V

    .line 22
    .line 23
    .line 24
    instance-of p0, v4, Ll/h0d0;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    move-object v9, v5

    .line 29
    new-instance v5, Ll/gm80$b;

    .line 30
    .line 31
    move-object v8, v4

    .line 32
    check-cast v8, Ll/h0d0;

    .line 33
    .line 34
    const/4 v10, 0x0

    .line 35
    move-object v7, v0

    .line 36
    move-object v6, v1

    .line 37
    invoke-direct/range {v5 .. v10}, Ll/gm80$b;-><init>(Ll/gm80;Ll/gm80$a;Ll/h0d0;Ll/yk90;Ll/hm80;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move-object v9, v5

    .line 42
    new-instance v5, Ll/gm80$c;

    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    invoke-direct {v5, v1, v0, p0}, Ll/gm80$c;-><init>(Ll/gm80;Ll/gm80$a;Ll/hm80;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object p0, v1, Ll/gm80;->a:Ll/wk90;

    .line 49
    .line 50
    invoke-interface {p0, v5, v9}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
