.class public final Ll/b560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b560$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Ljava/util/Map<",
        "TK;TV;>;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+TK;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+TV;>;"
        }
    .end annotation
.end field

.field public final c:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "+",
            "Ljava/util/Map<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/qcj;Ll/qcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;)V"
        }
    .end annotation

    .line 11
    new-instance v0, Ll/b560$b;

    invoke-direct {v0}, Ll/b560$b;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Ll/b560;-><init>(Ll/qcj;Ll/qcj;Ll/pcj;)V

    return-void
.end method

.method public constructor <init>(Ll/qcj;Ll/qcj;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;",
            "Ll/pcj<",
            "+",
            "Ljava/util/Map<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b560;->a:Ll/qcj;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b560;->b:Ll/qcj;

    .line 7
    .line 8
    iput-object p3, p0, Ll/b560;->c:Ll/pcj;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/util/Map<",
            "TK;TV;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/b560;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    new-instance v1, Ll/b560$a;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, v0, p1}, Ll/b560$a;-><init>(Ll/b560;Ll/gcg0;Ljava/util/Map;Ll/gcg0;)V

    .line 12
    .line 13
    .line 14
    return-object v1

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    invoke-static {p0, p1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b560;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
