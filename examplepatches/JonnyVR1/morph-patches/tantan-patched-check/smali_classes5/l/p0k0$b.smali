.class public Ll/p0k0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/p0k0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public b:Lcom/p1/mobile/putong/data/Media;

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

.field public h:Ljava/lang/String;

.field public i:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->IDLE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 5
    .line 6
    iput-object v0, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/p0k0$b;->d:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/p0k0$b;->e:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/p0k0$b;->f:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()Ll/p0k0$b;
    .locals 2

    .line 1
    new-instance v0, Ll/p0k0$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p0k0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Ll/p0k0$b;->d:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Ll/p0k0$b;->d:Z

    .line 9
    .line 10
    iget-boolean v1, p0, Ll/p0k0$b;->e:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Ll/p0k0$b;->e:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Ll/p0k0$b;->f:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Ll/p0k0$b;->f:Z

    .line 17
    .line 18
    iget-object v1, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 19
    .line 20
    iput-object v1, v0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 21
    .line 22
    iget-boolean v1, p0, Ll/p0k0$b;->i:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Ll/p0k0$b;->i:Z

    .line 25
    .line 26
    iget-object v1, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    :cond_0
    iget-object v1, p0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Ll/p0k0$b;->g:Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->clone()Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Ll/p0k0$b;->g:Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 49
    .line 50
    :cond_1
    iget-object p0, p0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 51
    .line 52
    iput-object p0, v0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 53
    .line 54
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/p0k0$b;

    .line 20
    .line 21
    iget-boolean v2, p0, Ll/p0k0$b;->d:Z

    .line 22
    .line 23
    iget-boolean v3, p1, Ll/p0k0$b;->d:Z

    .line 24
    .line 25
    if-ne v2, v3, :cond_2

    .line 26
    .line 27
    iget-boolean v2, p0, Ll/p0k0$b;->e:Z

    .line 28
    .line 29
    iget-boolean v3, p1, Ll/p0k0$b;->e:Z

    .line 30
    .line 31
    if-ne v2, v3, :cond_2

    .line 32
    .line 33
    iget-boolean v2, p0, Ll/p0k0$b;->f:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Ll/p0k0$b;->f:Z

    .line 36
    .line 37
    if-ne v2, v3, :cond_2

    .line 38
    .line 39
    iget-object v2, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 40
    .line 41
    iget-object v3, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 42
    .line 43
    if-ne v2, v3, :cond_2

    .line 44
    .line 45
    iget-boolean v2, p0, Ll/p0k0$b;->i:Z

    .line 46
    .line 47
    iget-boolean v3, p1, Ll/p0k0$b;->i:Z

    .line 48
    .line 49
    if-ne v2, v3, :cond_2

    .line 50
    .line 51
    iget-object v2, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 52
    .line 53
    iget-object v3, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 54
    .line 55
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    iget-object v2, p0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    iget-object v2, p0, Ll/p0k0$b;->g:Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 72
    .line 73
    iget-object v3, p1, Ll/p0k0$b;->g:Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 74
    .line 75
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    iget-object p0, p0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 82
    .line 83
    iget-object p1, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    return v0

    .line 92
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 9

    .line 1
    iget-object v0, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iget-object v1, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    iget-object v2, p0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 6
    .line 7
    iget-boolean v3, p0, Ll/p0k0$b;->d:Z

    .line 8
    .line 9
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-boolean v4, p0, Ll/p0k0$b;->e:Z

    .line 14
    .line 15
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    iget-boolean v5, p0, Ll/p0k0$b;->f:Z

    .line 20
    .line 21
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    iget-object v6, p0, Ll/p0k0$b;->g:Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 26
    .line 27
    iget-object v7, p0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 28
    .line 29
    iget-boolean p0, p0, Ll/p0k0$b;->i:Z

    .line 30
    .line 31
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    filled-new-array/range {v0 .. v8}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method
