.class public final Ll/a0w0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:Ll/yhr0;

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a0w0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    new-instance p1, Ll/yhr0;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/yhr0;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/a0w0;->b:Ll/yhr0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(ILl/mwv0;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/a0w0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    if-eq p1, v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/a0w0;->b:Ll/yhr0;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/yhr0;->a(I)Ll/yhr0;

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Ll/a0w0;->c:Z

    .line 15
    .line 16
    iget-object p0, p0, Ll/a0w0;->a:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-interface {p2, p0}, Ll/mwv0;->zza(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public final b(Ll/zyv0;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/a0w0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/a0w0;->c:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/a0w0;->b:Ll/yhr0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/yhr0;->b()Ll/akr0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/yhr0;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/yhr0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/a0w0;->b:Ll/yhr0;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-boolean v1, p0, Ll/a0w0;->c:Z

    .line 24
    .line 25
    iget-object p0, p0, Ll/a0w0;->a:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-interface {p1, p0, v0}, Ll/zyv0;->a(Ljava/lang/Object;Ll/akr0;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final c(Ll/zyv0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/a0w0;->d:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Ll/a0w0;->c:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/a0w0;->c:Z

    .line 10
    .line 11
    iget-object v0, p0, Ll/a0w0;->a:Ljava/lang/Object;

    .line 12
    .line 13
    iget-object p0, p0, Ll/a0w0;->b:Ll/yhr0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/yhr0;->b()Ll/akr0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p1, v0, p0}, Ll/zyv0;->a(Ljava/lang/Object;Ll/akr0;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    if-eqz p1, :cond_2

    .line 6
    .line 7
    const-class v0, Ll/a0w0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    iget-object p0, p0, Ll/a0w0;->a:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Ll/a0w0;

    .line 19
    .line 20
    iget-object p1, p1, Ll/a0w0;->a:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0w0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
