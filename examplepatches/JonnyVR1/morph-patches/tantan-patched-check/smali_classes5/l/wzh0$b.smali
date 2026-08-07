.class public Ll/wzh0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wzh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/wzh0$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "TT;>.a;"
        }
    .end annotation
.end field

.field public final b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:I


# virtual methods
.method public a(Lcom/tantanapp/common/data/DbObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wzh0$b;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, -0x63

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/wzh0$b;->a:Ll/wzh0$a;

    .line 10
    .line 11
    iget-object v0, v0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Ll/wzh0$b;->c:Z

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/wzh0$b;->d()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    sub-int/2addr v0, p1

    .line 27
    iput v0, p0, Ll/wzh0$b;->d:I

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public b(Lcom/tantanapp/common/data/DbObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wzh0$b;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, -0x63

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/wzh0$b;->a:Ll/wzh0$a;

    .line 10
    .line 11
    iget-object v0, v0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Ll/wzh0$b;->c:Z

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/wzh0$b;->d()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/2addr v0, p1

    .line 27
    iput v0, p0, Ll/wzh0$b;->d:I

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public c(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wzh0$b;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, -0x63

    .line 6
    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/wzh0$b;->a:Ll/wzh0$a;

    .line 10
    .line 11
    iget-object v0, v0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/wzh0$b;->a:Ll/wzh0$a;

    .line 21
    .line 22
    iget-object v0, v0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wzh0$b;->d()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    sub-int/2addr p1, v1

    .line 35
    iput p1, p0, Ll/wzh0$b;->d:I

    .line 36
    .line 37
    iput-boolean v1, p0, Ll/wzh0$b;->c:Z

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object v0, p0, Ll/wzh0$b;->a:Ll/wzh0$a;

    .line 41
    .line 42
    iget-object v0, v0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Ll/wzh0$b;->a:Ll/wzh0$a;

    .line 51
    .line 52
    iget-object p1, p1, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/wzh0$b;->d()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    add-int/2addr p1, v1

    .line 65
    iput p1, p0, Ll/wzh0$b;->d:I

    .line 66
    .line 67
    iput-boolean v1, p0, Ll/wzh0$b;->c:Z

    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public d()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wzh0$b;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/wzh0$b;->d:I

    .line 10
    .line 11
    const/16 v1, -0x63

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/wzh0$b;->b:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    iget p0, p0, Ll/wzh0$b;->d:I

    .line 29
    .line 30
    return p0
.end method

.method public e()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/wzh0$b;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/wzh0$b;->b:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wzh0$b;->d()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const/16 v0, -0x63

    .line 19
    .line 20
    iput v0, p0, Ll/wzh0$b;->d:I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/wzh0$b;->c:Z

    .line 24
    .line 25
    :cond_0
    return-void
.end method
