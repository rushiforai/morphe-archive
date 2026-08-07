.class public final Ll/u360;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u360$b;
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
.field public final a:Ll/f2e0;

.field public final b:Z

.field public final c:I


# direct methods
.method public constructor <init>(Ll/f2e0;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u360;->a:Ll/f2e0;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/u360;->b:Z

    .line 7
    .line 8
    if-lez p3, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget p3, Ll/urd0;->g:I

    .line 12
    .line 13
    :goto_0
    iput p3, p0, Ll/u360;->c:I

    .line 14
    .line 15
    return-void
.end method

.method public static b(I)Lrx/c$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lrx/c$c<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/u360$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/u360$a;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
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
    iget-object v0, p0, Ll/u360;->a:Ll/f2e0;

    .line 2
    .line 3
    instance-of v1, v0, Ll/olm;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of v1, v0, Ll/igj0;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    :goto_0
    return-object p1

    .line 13
    :cond_1
    new-instance v1, Ll/u360$b;

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/u360;->b:Z

    .line 16
    .line 17
    iget p0, p0, Ll/u360;->c:I

    .line 18
    .line 19
    invoke-direct {v1, v0, p1, v2, p0}, Ll/u360$b;-><init>(Ll/f2e0;Ll/gcg0;ZI)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ll/u360$b;->h()V

    .line 23
    .line 24
    .line 25
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u360;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
