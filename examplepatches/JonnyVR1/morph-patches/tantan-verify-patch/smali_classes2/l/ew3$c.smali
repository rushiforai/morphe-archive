.class Ll/ew3$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ew3;->d(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Z

.field final synthetic c:J

.field final synthetic d:Ll/ew3;


# direct methods
.method public constructor <init>(Ll/ew3;Ljava/lang/String;ZJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ew3$c;->d:Ll/ew3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ew3$c;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/ew3$c;->b:Z

    .line 6
    .line 7
    iput-wide p4, p0, Ll/ew3$c;->c:J

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Void;
    .locals 5
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ew3$c;->d:Ll/ew3;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ew3;->f(Ll/ew3;)Ll/h1c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/ew3$c;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p0, Ll/ew3$c;->d:Ll/ew3;

    .line 10
    .line 11
    invoke-static {v2}, Ll/ew3;->e(Ll/ew3;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Ll/h1c;->H(Ljava/lang/String;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Ll/ew3$c;->b:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/ew3$c;->d:Ll/ew3;

    .line 23
    .line 24
    invoke-static {v0}, Ll/ew3;->f(Ll/ew3;)Ll/h1c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/ew3$c;->a:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v2, p0, Ll/ew3$c;->d:Ll/ew3;

    .line 31
    .line 32
    invoke-static {v2}, Ll/ew3;->e(Ll/ew3;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-wide v3, p0, Ll/ew3$c;->c:J

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/h1c;->g(Ljava/lang/String;Ljava/lang/String;J)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ew3$c;->a()Ljava/lang/Void;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
