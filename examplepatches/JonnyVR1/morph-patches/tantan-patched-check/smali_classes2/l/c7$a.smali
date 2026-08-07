.class public Ll/c7$a;
.super Ll/aj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/c7;->g0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/aj2<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Ll/c7;


# direct methods
.method public constructor <init>(Ll/c7;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c7$a;->c:Ll/c7;

    .line 2
    .line 3
    iput-object p2, p0, Ll/c7$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/c7$a;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ll/aj2;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/i6c;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/i6c;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p1}, Ll/i6c;->c()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/c7$a;->c:Ll/c7;

    .line 10
    .line 11
    iget-object p0, p0, Ll/c7$a;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v2, p0, p1, v1, v0}, Ll/c7;->i(Ll/c7;Ljava/lang/String;Ll/i6c;FZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public e(Ll/i6c;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/c7$a;->c:Ll/c7;

    .line 2
    .line 3
    iget-object p0, p0, Ll/c7$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/i6c;->b()Ljava/lang/Throwable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, p0, p1, v1, v2}, Ll/c7;->g(Ll/c7;Ljava/lang/String;Ll/i6c;Ljava/lang/Throwable;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public f(Ll/i6c;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/i6c;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v5

    .line 5
    invoke-interface {p1}, Ll/i6c;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v7

    .line 9
    invoke-interface {p1}, Ll/i6c;->c()F

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    invoke-interface {p1}, Ll/i6c;->getResult()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/c7$a;->c:Ll/c7;

    .line 20
    .line 21
    iget-object v1, p0, Ll/c7$a;->a:Ljava/lang/String;

    .line 22
    .line 23
    iget-boolean v6, p0, Ll/c7$a;->b:Z

    .line 24
    .line 25
    move-object v2, p1

    .line 26
    invoke-static/range {v0 .. v7}, Ll/c7;->h(Ll/c7;Ljava/lang/String;Ll/i6c;Ljava/lang/Object;FZZZ)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    move-object v2, p1

    .line 31
    if-eqz v5, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/c7$a;->c:Ll/c7;

    .line 34
    .line 35
    iget-object p0, p0, Ll/c7$a;->a:Ljava/lang/String;

    .line 36
    .line 37
    new-instance v0, Ljava/lang/NullPointerException;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-static {p1, p0, v2, v0, v1}, Ll/c7;->g(Ll/c7;Ljava/lang/String;Ll/i6c;Ljava/lang/Throwable;Z)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method
