.class public Ll/vkw;
.super Ll/djw;
.source "SourceFile"


# static fields
.field private static final o:Ljava/lang/String; = "vkw"


# instance fields
.field private j:J

.field private k:J

.field private l:Z

.field private m:I

.field private n:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private q(I)V
    .locals 1

    .line 1
    const-string v0, "ec"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, v0, p1}, Ll/djw;->h(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "OpenURL"

    .line 2
    .line 3
    return-object p0
.end method

.method public e()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/djw;->e()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/vkw;->l:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-wide v0, p0, Ll/vkw;->j:J

    .line 9
    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    cmp-long v4, v0, v2

    .line 13
    .line 14
    if-lez v4, :cond_0

    .line 15
    .line 16
    iget-wide v4, p0, Ll/vkw;->k:J

    .line 17
    .line 18
    cmp-long v6, v4, v2

    .line 19
    .line 20
    if-lez v6, :cond_0

    .line 21
    .line 22
    sub-long/2addr v4, v0

    .line 23
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "t_title"

    .line 28
    .line 29
    invoke-virtual {p0, v1, v0}, Ll/djw;->h(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-wide v0, p0, Ll/vkw;->k:J

    .line 33
    .line 34
    iget-wide v4, p0, Ll/djw;->g:J

    .line 35
    .line 36
    cmp-long v6, v0, v4

    .line 37
    .line 38
    if-lez v6, :cond_1

    .line 39
    .line 40
    cmp-long v2, v4, v2

    .line 41
    .line 42
    if-lez v2, :cond_1

    .line 43
    .line 44
    sub-long/2addr v0, v4

    .line 45
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "t_white_screen"

    .line 50
    .line 51
    invoke-virtual {p0, v1, v0}, Ll/djw;->h(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_1
    iget v0, p0, Ll/vkw;->m:I

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "http_status"

    .line 61
    .line 62
    invoke-virtual {p0, v1, v0}, Ll/djw;->h(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/vkw;->n:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    const-string v1, "errorInfo"

    .line 70
    .line 71
    invoke-virtual {p0, v1, v0}, Ll/djw;->h(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-wide v0, p0, Ll/djw;->h:J

    .line 75
    .line 76
    iget-wide v2, p0, Ll/djw;->g:J

    .line 77
    .line 78
    sub-long/2addr v0, v2

    .line 79
    const-string v2, "t_all"

    .line 80
    .line 81
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v2, v0}, Ll/djw;->h(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public l(ILjava/lang/String;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/djw;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/djw;->i:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iput p1, p0, Ll/vkw;->m:I

    .line 14
    .line 15
    iput-object p2, p0, Ll/vkw;->n:Ljava/lang/String;

    .line 16
    .line 17
    iput-boolean v1, p0, Ll/vkw;->l:Z

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-direct {p0, p1}, Ll/vkw;->q(I)V

    .line 21
    .line 22
    .line 23
    return p1

    .line 24
    :cond_1
    :goto_0
    sget-object p1, Ll/vkw;->o:Ljava/lang/String;

    .line 25
    .line 26
    const-string p2, "tang----onOpenError \u65e5\u5fd7\u7edf\u8ba1\u9519\u8bef\uff1a\u65e5\u5fd7\u6ca1\u6709\u6b63\u5728\u7edf\u8ba1"

    .line 27
    .line 28
    invoke-static {p1, p2}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iput-boolean v1, p0, Ll/djw;->i:Z

    .line 32
    .line 33
    return v1
.end method

.method public m()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/djw;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/djw;->i:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/vkw;->l:Z

    .line 15
    .line 16
    invoke-direct {p0, v1}, Ll/vkw;->q(I)V

    .line 17
    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    :goto_0
    sget-object v0, Ll/vkw;->o:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "tang----onOpenSuccess \u65e5\u5fd7\u7edf\u8ba1\u9519\u8bef\uff1a\u65e5\u5fd7\u6ca1\u6709\u6b63\u5728\u7edf\u8ba1"

    .line 23
    .line 24
    invoke-static {v0, v2}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-boolean v1, p0, Ll/djw;->i:Z

    .line 28
    .line 29
    return v1
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/djw;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/djw;->i:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    sget-object v0, Ll/vkw;->o:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "tang----setGetTitleTime \u65e5\u5fd7\u7edf\u8ba1\u9519\u8bef\uff1a\u65e5\u5fd7\u6ca1\u6709\u6b63\u5728\u7edf\u8ba1"

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Ll/djw;->i:Z

    .line 22
    .line 23
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/djw;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/djw;->i:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    sget-object v0, Ll/vkw;->o:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "tang----setGetTitleTime \u65e5\u5fd7\u7edf\u8ba1\u9519\u8bef\uff1a\u65e5\u5fd7\u6ca1\u6709\u6b63\u5728\u7edf\u8ba1"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/djw;->i:Z

    .line 20
    .line 21
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Ll/vkw;->j:J

    .line 26
    .line 27
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/djw;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/djw;->i:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Ll/vkw;->k:J

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    :goto_0
    sget-object v0, Ll/vkw;->o:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "tang----setGetTitleTime \u65e5\u5fd7\u7edf\u8ba1\u9519\u8bef\uff1a\u65e5\u5fd7\u6ca1\u6709\u6b63\u5728\u7edf\u8ba1"

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Ll/djw;->i:Z

    .line 28
    .line 29
    return-void
.end method
