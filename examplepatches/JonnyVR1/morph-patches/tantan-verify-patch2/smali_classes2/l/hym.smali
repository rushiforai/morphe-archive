.class public Ll/hym;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mpy;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/mpy<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field public final b:Ll/opy;


# direct methods
.method public constructor <init>(Ll/mpy;Ll/opy;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mpy<",
            "TK;TV;>;",
            "Ll/opy;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hym;->a:Ll/mpy;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hym;->b:Ll/opy;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hym;->a:Ll/mpy;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/mpy;->a(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/Object;Ll/fb5;)Ll/fb5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ll/fb5<",
            "TV;>;)",
            "Ll/fb5<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hym;->b:Ll/opy;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/opy;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/hym;->a:Ll/mpy;

    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Ll/mpy;->b(Ljava/lang/Object;Ll/fb5;)Ll/fb5;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public c(Ll/up80;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/up80<",
            "TK;>;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hym;->a:Ll/mpy;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/mpy;->c(Ll/up80;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ll/up80;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/up80<",
            "TK;>;)I"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hym;->a:Ll/mpy;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/mpy;->d(Ll/up80;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public get(Ljava/lang/Object;)Ll/fb5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ll/fb5<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hym;->a:Ll/mpy;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/mpy;->get(Ljava/lang/Object;)Ll/fb5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/hym;->b:Ll/opy;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/opy;->b(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    invoke-interface {p0, p1}, Ll/opy;->a(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
