.class public final Lrx/internal/operators/OperatorWindowWithSize;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;,
        Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;,
        Lrx/internal/operators/OperatorWindowWithSize$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Lrx/c<",
        "TT;>;TT;>;"
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lrx/internal/operators/OperatorWindowWithSize;->a:I

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorWindowWithSize;->b:I

    .line 7
    .line 8
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
            "Lrx/c<",
            "TT;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lrx/internal/operators/OperatorWindowWithSize;->b:I

    .line 2
    .line 3
    iget p0, p0, Lrx/internal/operators/OperatorWindowWithSize;->a:I

    .line 4
    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lrx/internal/operators/OperatorWindowWithSize$a;

    .line 8
    .line 9
    invoke-direct {v0, p1, p0}, Lrx/internal/operators/OperatorWindowWithSize$a;-><init>(Ll/gcg0;I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, v0, Lrx/internal/operators/OperatorWindowWithSize$a;->h:Ll/kcg0;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lrx/internal/operators/OperatorWindowWithSize$a;->h()Ll/vk90;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    if-le v0, p0, :cond_1

    .line 26
    .line 27
    new-instance v1, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;

    .line 28
    .line 29
    invoke-direct {v1, p1, p0, v0}, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;-><init>(Ll/gcg0;II)V

    .line 30
    .line 31
    .line 32
    iget-object p0, v1, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->i:Ll/kcg0;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->i()Ll/vk90;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 42
    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_1
    new-instance v1, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;

    .line 46
    .line 47
    invoke-direct {v1, p1, p0, v0}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;-><init>(Ll/gcg0;II)V

    .line 48
    .line 49
    .line 50
    iget-object p0, v1, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->i:Ll/kcg0;

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->j()Ll/vk90;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 60
    .line 61
    .line 62
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithSize;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
