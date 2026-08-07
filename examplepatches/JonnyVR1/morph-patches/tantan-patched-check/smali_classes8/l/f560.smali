.class public Ll/f560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
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
.field public final a:Ll/f2e0;


# direct methods
.method public constructor <init>(Ll/f2e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f560;->a:Ll/f2e0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 2
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
    new-instance v0, Ll/f560$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/f560$a;-><init>(Ll/f560;Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/f560$b;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0}, Ll/f560$b;-><init>(Ll/f560;Ll/gcg0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f560;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
