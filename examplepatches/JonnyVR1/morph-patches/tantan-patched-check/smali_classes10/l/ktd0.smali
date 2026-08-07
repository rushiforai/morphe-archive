.class public Ll/ktd0;
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
    .locals 5

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, p1}, Ll/w5;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    array-length p1, p0

    .line 29
    const/4 v1, 0x0

    .line 30
    :goto_0
    if-ge v1, p1, :cond_2

    .line 31
    .line 32
    aget-object v2, p0, v1

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string v4, ".svga"

    .line 39
    .line 40
    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    return-object v0
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Z
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/l4;->a:Ll/wpq0;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Ll/wpq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/ktd0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/ere;->e(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
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
    invoke-virtual {p0, v0}, Ll/ktd0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p1}, Ll/ere;->e(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    if-eqz p2, :cond_2

    .line 43
    .line 44
    iget-object v2, p0, Ll/l4;->a:Ll/wpq0;

    .line 45
    .line 46
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 53
    .line 54
    const-string p0, "IMMEDIATE"

    .line 55
    .line 56
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/Priority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/Priority;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    move-object v8, p3

    .line 61
    move-object v9, p4

    .line 62
    invoke-virtual/range {v2 .. v9}, Ll/w5;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/Priority;Ll/w8e;Ll/e4d0;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return v1
.end method
