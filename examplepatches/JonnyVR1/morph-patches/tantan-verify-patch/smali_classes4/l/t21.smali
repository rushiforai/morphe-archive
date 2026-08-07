.class Ll/t21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ll/dm80;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;",
        "Ll/dm80<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final a:Ll/dr60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dr60<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final b:Ll/v3f$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v3f$b<",
            "TT;*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/v3f$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v3f$b<",
            "TT;*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t21;->b:Ll/v3f$b;

    .line 5
    .line 6
    new-instance p1, Ll/dr60;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/dr60;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/t21;->a:Ll/dr60;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Ll/jcg0;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jcg0<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/cr60;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Ll/cr60;-><init>(Ljava/lang/Object;Ll/jcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/t21;->a:Ll/dr60;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/dr60;->a(Ll/cr60;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/t21;->b:Ll/v3f$b;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/v3f$b;->b()Ljava/util/concurrent/ExecutorService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t21;->a:Ll/dr60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dr60;->b()Ll/cr60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/t21;->b:Ll/v3f$b;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/v3f$b;->e(Ll/cr60;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "No pending post available"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
