.class public Ll/b7s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cu6;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/cu6<",
        "Lrx/c<",
        "*>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/jcg0;Z)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b7s;->b(Ll/jcg0;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/jcg0;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/jcg0<",
            "TT;>;Z)",
            "Lrx/c<",
            "*>;"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    new-instance p2, Ll/z6s;

    .line 16
    .line 17
    invoke-direct {p2, p0}, Ll/z6s;-><init>(Ll/wbg0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/jcg0;->b(Ll/jcg0$b;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/a7s;

    .line 24
    .line 25
    invoke-direct {p2, p1}, Ll/a7s;-><init>(Ll/jcg0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p2}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
