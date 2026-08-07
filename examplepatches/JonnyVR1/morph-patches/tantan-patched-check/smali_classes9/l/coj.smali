.class public Ll/coj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

.field public c:Z

.field public d:Ljava/lang/String;

.field public e:Ll/h64;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public f:Ll/p54;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public g:Ljava/lang/String;

.field public h:Z


# direct methods
.method public constructor <init>(Ll/h64;Ll/p54;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/h64;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/p54;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "default"

    .line 5
    .line 6
    iput-object v0, p0, Ll/coj;->g:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/coj;->h:Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/coj;->e:Ll/h64;

    .line 12
    .line 13
    iput-object p2, p0, Ll/coj;->f:Ll/p54;

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/coj;->a:Z

    .line 16
    .line 17
    iput-object p3, p0, Ll/coj;->d:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public static a(Ll/h64;Ll/p54;)Ll/coj;
    .locals 2
    .param p0    # Ll/h64;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/p54;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/coj;

    .line 2
    .line 3
    const-string v1, "multi_call"

    .line 4
    .line 5
    invoke-direct {v0, p0, p1, v1}, Ll/coj;-><init>(Ll/h64;Ll/p54;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static b(Ll/h64;Ll/p54;)Ll/coj;
    .locals 2
    .param p0    # Ll/h64;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/p54;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p1, Ll/p54;->d:I

    .line 3
    .line 4
    new-instance v0, Ll/coj;

    .line 5
    .line 6
    const-string v1, "voice_call"

    .line 7
    .line 8
    invoke-direct {v0, p0, p1, v1}, Ll/coj;-><init>(Ll/h64;Ll/p54;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static c(Ll/h64;Ll/p54;)Ll/coj;
    .locals 2
    .param p0    # Ll/h64;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/p54;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/coj;

    .line 2
    .line 3
    const-string v1, "voice_call"

    .line 4
    .line 5
    invoke-direct {v0, p0, p1, v1}, Ll/coj;-><init>(Ll/h64;Ll/p54;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public d()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/coj;->e:Ll/h64;

    .line 7
    .line 8
    iget-object v1, v1, Ll/h64;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/coj;->e:Ll/h64;

    .line 14
    .line 15
    iget-object v1, v1, Ll/h64;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/coj;->e:Ll/h64;

    .line 21
    .line 22
    iget-object v1, v1, Ll/h64;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/coj;->f:Ll/p54;

    .line 28
    .line 29
    iget-object v1, v1, Ll/p54;->a:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/coj;->f:Ll/p54;

    .line 35
    .line 36
    iget p0, p0, Ll/p54;->d:I

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public e()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/coj;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/coj;->f:Ll/p54;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget p0, p0, Ll/p54;->d:I

    .line 12
    .line 13
    if-ne p0, v2, :cond_0

    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    return v1

    .line 17
    :cond_1
    iget p0, p0, Ll/p54;->d:I

    .line 18
    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    return v2

    .line 22
    :cond_2
    return v1
.end method

.method public f()Z
    .locals 1

    .line 1
    const-string v0, "multi_call"

    .line 2
    .line 3
    iget-object p0, p0, Ll/coj;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public g(Ll/coj;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h64;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/coj;->e:Ll/h64;

    .line 6
    .line 7
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/coj;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/coj;->f:Ll/p54;

    .line 2
    .line 3
    iget v0, v0, Ll/p54;->d:I

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-boolean p0, p0, Ll/coj;->c:Z

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/coj;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GiftCallInfo  callUser = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/coj;->e:Ll/h64;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/h64;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, " callParam = "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/coj;->f:Ll/p54;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/p54;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " isSelect = "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-boolean p0, p0, Ll/coj;->h:Z

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
