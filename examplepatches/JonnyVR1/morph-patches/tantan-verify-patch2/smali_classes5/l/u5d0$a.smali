.class public Ll/u5d0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u5d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Z

.field public i:I

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/Runnable;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "\u7ee7\u7eed\u63a2\u7d22"

    .line 5
    .line 6
    iput-object v0, p0, Ll/u5d0$a;->j:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/u5d0$a;->k:Ljava/lang/Runnable;

    .line 10
    .line 11
    const-string v0, "explore"

    .line 12
    .line 13
    iput-object v0, p0, Ll/u5d0$a;->l:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "pending"

    .line 16
    .line 17
    iput-object v0, p0, Ll/u5d0$a;->m:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a()Ll/u5d0;
    .locals 2

    .line 1
    new-instance v0, Ll/u5d0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u5d0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ll/u5d0$a;->a:I

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/u5d0;->m(Ll/u5d0;I)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Ll/u5d0$a;->b:I

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/u5d0;->l(Ll/u5d0;I)V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Ll/u5d0$a;->c:I

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/u5d0;->c(Ll/u5d0;I)V

    .line 19
    .line 20
    .line 21
    iget v1, p0, Ll/u5d0$a;->d:I

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/u5d0;->j(Ll/u5d0;I)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/u5d0$a;->f:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/u5d0;->i(Ll/u5d0;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/u5d0$a;->g:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/u5d0;->h(Ll/u5d0;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-boolean v1, p0, Ll/u5d0$a;->h:Z

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/u5d0;->g(Ll/u5d0;Z)V

    .line 39
    .line 40
    .line 41
    iget v1, p0, Ll/u5d0$a;->i:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/u5d0;->e(Ll/u5d0;I)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/u5d0$a;->j:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/u5d0;->b(Ll/u5d0;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/u5d0$a;->k:Ljava/lang/Runnable;

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/u5d0;->a(Ll/u5d0;Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/u5d0$a;->l:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/u5d0;->d(Ll/u5d0;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/u5d0$a;->m:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/u5d0;->f(Ll/u5d0;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/u5d0$a;->e:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0, p0}, Ll/u5d0;->k(Ll/u5d0;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method

.method public b(Ljava/lang/Runnable;)Ll/u5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0$a;->k:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)Ll/u5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0$a;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/u5d0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/u5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;)Ll/u5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0$a;->l:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/u5d0$a;->m:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public g(I)Ll/u5d0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0$a;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Z)Ll/u5d0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/u5d0$a;->h:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)Ll/u5d0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/u5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/String;)Ll/u5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(I)Ll/u5d0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(I)Ll/u5d0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0$a;->a:I

    .line 2
    .line 3
    return-object p0
.end method
