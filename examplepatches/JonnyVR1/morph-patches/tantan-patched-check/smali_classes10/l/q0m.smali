.class public abstract Ll/q0m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public b:Ll/g8t;


# direct methods
.method public constructor <init>(Lrx/c;Ll/g8t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;",
            "Ll/g8t;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q0m;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/q0m;->b:Ll/g8t;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public abstract b()V
.end method

.method public c(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/p0m;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/p0m;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/q0m;->a:Lrx/c;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-static {v0, p0, p1}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0m;->b:Ll/g8t;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g8t;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0m;->b:Ll/g8t;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g8t;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public abstract f()V
.end method
