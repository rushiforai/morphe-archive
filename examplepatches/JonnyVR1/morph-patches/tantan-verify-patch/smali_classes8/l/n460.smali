.class public final Ll/n460;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n460$a;,
        Ll/n460$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n460;->a:Lrx/c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wqe0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wqe0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/xk90;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/xk90;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/n460$b;

    .line 12
    .line 13
    iget-object p0, p0, Ll/n460;->a:Lrx/c;

    .line 14
    .line 15
    invoke-direct {v2, p1, v0, v1, p0}, Ll/n460$b;-><init>(Ll/gcg0;Ll/wqe0;Ll/xk90;Lrx/c;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 25
    .line 26
    .line 27
    return-object v2
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
