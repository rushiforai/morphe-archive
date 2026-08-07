.class public Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilterStore;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final PATH_SHADER:Ljava/lang/String; = "light_room_filters"


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

.method public static convertClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->convertClassName(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static generateFilter(Landroid/content/Context;Ljava/io/File;Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilter;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->generateFilter(Landroid/content/Context;Ljava/io/File;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static generateProcessFilters(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilter;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilterStore;->getFilterFolder(Landroid/content/Context;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v2, Ljava/io/File;

    .line 11
    .line 12
    new-instance v3, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, "/"

    .line 21
    .line 22
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    invoke-static {p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    array-length v1, p1

    .line 46
    const/4 v2, 0x0

    .line 47
    :goto_0
    if-ge v2, v1, :cond_2

    .line 48
    .line 49
    aget-object v3, p1, v2

    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {p0, v3}, Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilterStore;->getPresetFilterByFolder(Landroid/content/Context;Ljava/lang/String;)Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilter;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    if-eqz v3, :cond_1

    .line 60
    .line 61
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    :goto_1
    return-object v0
.end method

.method public static getBitmapWithPath(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->getBitmapWithPath(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static getDataFilterFolder(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->getDataFilterFolder(Landroid/content/Context;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static getFilterFolder(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->getFilterFolder(Landroid/content/Context;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static getPresetFilterByFolder(Landroid/content/Context;Ljava/lang/String;)Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilter;
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilter;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilter;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p1, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-static {p0, v0, p1}, Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilterStore;->generateFilter(Landroid/content/Context;Ljava/io/File;Lcom/tantanapp/media/ttmediaeffect/filtermanager/TTPresetFilter;)V

    .line 26
    .line 27
    .line 28
    return-object p1
.end method
