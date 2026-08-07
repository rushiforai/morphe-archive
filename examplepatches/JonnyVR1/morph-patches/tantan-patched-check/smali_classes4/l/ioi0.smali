.class public abstract Ll/ioi0;
.super Ll/qzl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/qzl<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public b:I

.field public c:Ll/f6m;

.field public d:Z

.field public volatile e:Z

.field public f:Landroid/content/Context;

.field public g:Ll/uni0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/qzl;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/ioi0;->b:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/ioi0;->e:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ioi0;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final i(Ljava/lang/String;)I
    .locals 3

    .line 1
    const-string p0, "_"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    aget-object v0, p0, p1

    .line 9
    .line 10
    array-length v1, p0

    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    :try_start_0
    invoke-static {v0}, Ll/p8c;->g(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    aget-object p0, p0, p1

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    return p0

    .line 32
    :cond_0
    return p1

    .line 33
    :catch_0
    const/16 p0, 0x64

    .line 34
    .line 35
    return p0

    .line 36
    :cond_1
    return p1
.end method

.method public abstract j()Ljava/lang/String;
.end method

.method public abstract k()Ll/f6m;
.end method

.method public abstract l()Ll/uni0;
.end method

.method public m()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ioi0;->d:Z

    .line 3
    .line 4
    return-void
.end method

.method public n(Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ioi0;->f:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ioi0;->k()Ll/f6m;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/ioi0;->c:Ll/f6m;

    .line 8
    .line 9
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/cjk0;->j()Ll/foi0;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ioi0;->l()Ll/uni0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/ioi0;->g:Ll/uni0;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ll/uni0;->b()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ioi0;->m()V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/ioi0;->g:Ll/uni0;

    .line 34
    .line 35
    invoke-interface {p1}, Ll/uni0;->a()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ioi0;->r()V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void

    .line 45
    :cond_1
    invoke-virtual {p0}, Ll/ioi0;->m()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final o()Z
    .locals 3

    .line 1
    iget v0, p0, Ll/ioi0;->b:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Ll/ioi0;->j()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, ""

    .line 15
    .line 16
    invoke-static {v0, v1, v2}, Ll/fq80;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ioi0;->i(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Ll/ioi0;->b:I

    .line 25
    .line 26
    :cond_0
    iget v0, p0, Ll/ioi0;->b:I

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ioi0;->p()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-ge v0, v1, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v0, 0x0

    .line 37
    :goto_0
    iput-boolean v0, p0, Ll/ioi0;->e:Z

    .line 38
    .line 39
    iget-boolean p0, p0, Ll/ioi0;->e:Z

    .line 40
    .line 41
    return p0
.end method

.method public abstract p()I
.end method

.method public q(Ll/eoi0;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ioi0;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract r()V
.end method

.method public final s()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/p8c;->c()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "_"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/ioi0;->b:I

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    iput v1, p0, Ll/ioi0;->b:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0}, Ll/ioi0;->j()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {v1, p0, v0}, Ll/fq80;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
