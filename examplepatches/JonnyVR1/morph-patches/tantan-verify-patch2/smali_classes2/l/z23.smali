.class public Ll/z23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/z23$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation
.end field

.field public final b:I

.field public final c:I

.field public final d:Z


# direct methods
.method public constructor <init>(Ll/wk90;IIZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;IIZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-gt p2, p3, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/wn80;->b(Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/wk90;

    .line 21
    .line 22
    iput-object p1, p0, Ll/z23;->a:Ll/wk90;

    .line 23
    .line 24
    iput p2, p0, Ll/z23;->b:I

    .line 25
    .line 26
    iput p3, p0, Ll/z23;->c:I

    .line 27
    .line 28
    iput-boolean p4, p0, Ll/z23;->d:Z

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/z23;->d:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/z23;->a:Ll/wk90;

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Ll/z23;->a:Ll/wk90;

    .line 18
    .line 19
    new-instance v1, Ll/z23$a;

    .line 20
    .line 21
    iget v2, p0, Ll/z23;->b:I

    .line 22
    .line 23
    iget p0, p0, Ll/z23;->c:I

    .line 24
    .line 25
    invoke-direct {v1, p1, v2, p0}, Ll/z23$a;-><init>(Ll/z06;II)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, v1, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
