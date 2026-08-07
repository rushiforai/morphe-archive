.class public abstract Ll/wbg0;
.super Lrx/c;
.source "SourceFile"

# interfaces
.implements Ll/bb50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/c<",
        "TR;>;",
        "Ll/bb50<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lrx/c$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c$a<",
            "TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lrx/c;-><init>(Lrx/c$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Ll/zqe0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/zqe0<",
            "TT;TR;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Ll/zqe0;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/zqe0;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ll/zqe0;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/zqe0;-><init>(Ll/wbg0;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method
