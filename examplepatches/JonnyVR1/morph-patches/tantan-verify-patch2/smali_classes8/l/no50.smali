.class public Ll/no50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/d$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/d$b<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
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
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/no50;->a:Lrx/c;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Lrx/c;)Ll/no50;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Ll/no50<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/no50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/no50;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(Ll/oqf0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/oqf0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/no50$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/no50$a;-><init>(Ll/no50;Ll/oqf0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/oqf0;->a(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/no50;->a:Lrx/c;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/oqf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/no50;->a(Ll/oqf0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
