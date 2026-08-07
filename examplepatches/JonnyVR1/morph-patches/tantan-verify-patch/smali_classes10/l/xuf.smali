.class public Ll/xuf;
.super Ll/l4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, p1}, Ll/w5;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/l4;->a:Ll/wpq0;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2, v3, v4}, Ll/wpq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/xuf;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/ere;->e(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_1
    return v0
.end method

.method public f(Ljava/lang/String;ZLl/w8e;Ll/e4d0;)Z
    .locals 10

    .line 1
    invoke-virtual {p0, p1}, Ll/l4;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v2, p0, Ll/l4;->a:Ll/wpq0;

    .line 10
    .line 11
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v2, v3, v4, v5}, Ll/wpq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/xuf;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p1}, Ll/ere;->e(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_1
    if-eqz p2, :cond_2

    .line 39
    .line 40
    iget-object v2, p0, Ll/l4;->a:Ll/wpq0;

    .line 41
    .line 42
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 49
    .line 50
    const-string p0, "IMMEDIATE"

    .line 51
    .line 52
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/Priority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/Priority;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    move-object v8, p3

    .line 57
    move-object v9, p4

    .line 58
    invoke-virtual/range {v2 .. v9}, Ll/w5;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/Priority;Ll/w8e;Ll/e4d0;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    return v1
.end method

.method public final h(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Z
    .locals 4

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 9
    .line 10
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, v2, v3, p1}, Ll/w5;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, "/params.txt"

    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method
