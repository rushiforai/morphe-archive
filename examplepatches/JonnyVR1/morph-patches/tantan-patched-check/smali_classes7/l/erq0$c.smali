.class Ll/erq0$c;
.super Ll/tsq0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/erq0;->t(Ll/y3f;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic c:Ll/erq0;


# direct methods
.method public constructor <init>(Ll/erq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/erq0$c;->c:Ll/erq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tsq0$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "100888"

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/erq0$c;->c:Ll/erq0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/erq0;->b(Ll/erq0;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/erq0$c;->c:Ll/erq0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/erq0;->c(Ll/erq0;)Ljava/util/concurrent/ExecutorService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/erq0$c$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/erq0$c$a;-><init>(Ll/erq0$c;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
