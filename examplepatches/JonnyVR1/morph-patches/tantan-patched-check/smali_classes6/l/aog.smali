.class public abstract Ll/aog;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ll/aog;

.field public c:Ll/aog;

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/aog;->d:I

    .line 5
    .line 6
    iput p2, p0, Ll/aog;->e:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/aog;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/aog;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/aog;->c:Ll/aog;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Ll/aog;->a(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Ll/aog;->b:Ll/aog;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Ll/aog;->a(Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public c(Z)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/aog;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/aog;->e:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget p0, p0, Ll/aog;->d:I

    .line 11
    .line 12
    return p0

    .line 13
    :cond_1
    if-eqz p1, :cond_2

    .line 14
    .line 15
    iget p0, p0, Ll/aog;->d:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_2
    iget p0, p0, Ll/aog;->e:I

    .line 19
    .line 20
    return p0
.end method

.method public d(Ll/bog;)Ll/aog;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aog;->b:Ll/aog;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/aog;->f(Ll/aog;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public e(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object p1, p0, Ll/aog;->b:Ll/aog;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/aog;->a(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    :goto_0
    iget-object p0, p1, Ll/aog;->b:Ll/aog;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    move-object p1, p0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-virtual {p1, v0}, Ll/aog;->a(Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Ll/aog;->a(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final f(Ll/aog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aog;->c:Ll/aog;

    .line 2
    .line 3
    return-void
.end method

.method public g(Ll/cog;)Ll/aog;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aog;->b:Ll/aog;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/aog;->f(Ll/aog;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method
