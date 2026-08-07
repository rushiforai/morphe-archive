.class public final Ll/s360;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s360$c;,
        Ll/s360$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Lrx/c<",
        "+TR;>;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TU;>;>;"
        }
    .end annotation
.end field

.field public final b:Ll/rcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rcj<",
            "-TT;-TU;+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/qcj;Ll/rcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TU;>;>;",
            "Ll/rcj<",
            "-TT;-TU;+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s360;->a:Ll/qcj;

    .line 5
    .line 6
    iput-object p2, p0, Ll/s360;->b:Ll/rcj;

    .line 7
    .line 8
    return-void
.end method

.method public static b(Ll/qcj;)Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TU;>;>;)",
            "Ll/qcj<",
            "TT;",
            "Lrx/c<",
            "TU;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/s360$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/s360$a;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Lrx/c<",
            "+TR;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/s360$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/s360;->a:Ll/qcj;

    .line 4
    .line 5
    iget-object p0, p0, Ll/s360;->b:Ll/rcj;

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, p0}, Ll/s360$b;-><init>(Ll/gcg0;Ll/qcj;Ll/rcj;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s360;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
