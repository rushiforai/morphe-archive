.class final Lcom/momo/xeengine/gift/SVGAGiftDescriptor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;,
        Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;
    }
.end annotation


# instance fields
.field private loops:I

.field private svgaInfo:Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

.field private video:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createWithConfig(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/momo/xeengine/gift/SVGAGiftDescriptor;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "svga_info"

    .line 3
    .line 4
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    new-instance v2, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 12
    .line 13
    invoke-direct {v2, v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;-><init>(Lorg/json/JSONObject;)V

    .line 14
    .line 15
    .line 16
    const-string v3, "svgaName"

    .line 17
    .line 18
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-nez v3, :cond_2

    .line 27
    .line 28
    new-instance v3, Ljava/io/File;

    .line 29
    .line 30
    invoke-direct {v3, p0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v2, v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->access$902(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return-object v0

    .line 48
    :cond_2
    :goto_0
    new-instance v1, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 49
    .line 50
    invoke-direct {v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v2, v1, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->svgaInfo:Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 54
    .line 55
    const-string v2, "video"

    .line 56
    .line 57
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_3

    .line 66
    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p0, "/"

    .line 76
    .line 77
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance p1, Ljava/io/File;

    .line 88
    .line 89
    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    iput-object p0, v1, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->video:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    :cond_3
    return-object v1

    .line 101
    :catch_0
    return-object v0
.end method

.method public static createWithSpec(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/momo/xeengine/gift/SVGAGiftDescriptor;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p0}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->findFirstSVGAFile(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;-><init>(Lorg/json/JSONObject;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, v0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->svgaInfo:Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 22
    .line 23
    invoke-static {v1, p0}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->access$902(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :catch_0
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public static findFirstSVGAFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    new-instance v1, Ljava/io/File;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_4

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_2
    array-length v1, p0

    .line 31
    const/4 v2, 0x0

    .line 32
    :goto_0
    if-ge v2, v1, :cond_4

    .line 33
    .line 34
    aget-object v3, p0, v2

    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_3

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    const-string v5, ".svga"

    .line 51
    .line 52
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_3

    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    :goto_1
    return-object v0
.end method


# virtual methods
.method public getLoops()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->loops:I

    .line 2
    .line 3
    return p0
.end method

.method public getSvgaInfo()Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->svgaInfo:Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->video:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setLoops(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->loops:I

    .line 2
    .line 3
    return-void
.end method
