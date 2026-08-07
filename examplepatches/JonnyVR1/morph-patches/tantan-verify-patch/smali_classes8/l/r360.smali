.class public final Ll/r360;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r360$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TR;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+TR;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-",
            "Ljava/lang/Throwable;",
            "+TR;>;"
        }
    .end annotation
.end field

.field public final c:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/qcj;Ll/qcj;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+TR;>;",
            "Ll/qcj<",
            "-",
            "Ljava/lang/Throwable;",
            "+TR;>;",
            "Ll/pcj<",
            "+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r360;->a:Ll/qcj;

    .line 5
    .line 6
    iput-object p2, p0, Ll/r360;->b:Ll/qcj;

    .line 7
    .line 8
    iput-object p3, p0, Ll/r360;->c:Ll/pcj;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/r360$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/r360;->a:Ll/qcj;

    .line 4
    .line 5
    iget-object v2, p0, Ll/r360;->b:Ll/qcj;

    .line 6
    .line 7
    iget-object v3, p0, Ll/r360;->c:Ll/pcj;

    .line 8
    .line 9
    invoke-direct {v0, p1, v1, v2, v3}, Ll/r360$b;-><init>(Ll/gcg0;Ll/qcj;Ll/qcj;Ll/pcj;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/r360$a;

    .line 16
    .line 17
    invoke-direct {v1, p0, v0}, Ll/r360$a;-><init>(Ll/r360;Ll/r360$b;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/r360;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
