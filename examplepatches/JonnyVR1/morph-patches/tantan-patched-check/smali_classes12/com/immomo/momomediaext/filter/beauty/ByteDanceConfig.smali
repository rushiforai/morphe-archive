.class public Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig; = null

.field private static resourceRootPath:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static availableBeautyItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0

    .line 22
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public static availableBeautyPath()Ljava/lang/String;
    .locals 4

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 13
    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-gtz v0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v2, 0x0

    .line 62
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->getId()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    sget-object v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 111
    .line 112
    invoke-virtual {v3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getBeauty()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    check-cast v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;

    .line 125
    .line 126
    invoke-virtual {v2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->getId()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    const-string v3, "_"

    .line 131
    .line 132
    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    return-object v0

    .line 144
    :cond_3
    :goto_0
    return-object v1
.end method

.method public static availableMakeupItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeup()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeup()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;->getObjects()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0

    .line 22
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public static availableMakeupPath()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeup()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeup()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;->getFolder()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeup()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;->getFolder()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    return-object v0

    .line 68
    :cond_2
    :goto_0
    return-object v1
.end method

.method public static availableMakeupStyleItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeupStyle()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeupStyle()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;->getObjects()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0

    .line 22
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public static availableMakeupStylePath()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeupStyle()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeupStyle()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;->getFolder()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getMakeupStyle()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$MakeupConfig;->getFolder()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    return-object v0

    .line 46
    :cond_2
    :goto_0
    return-object v1
.end method

.method public static availableReshapeItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0

    .line 22
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public static availableReshapePath()Ljava/lang/String;
    .locals 4

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 13
    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-gtz v0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v2, 0x0

    .line 62
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->getId()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    sget-object v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 111
    .line 112
    invoke-virtual {v3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;->getReshape()Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$FolderConfig;->getObjects()Ljava/util/List;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    check-cast v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;

    .line 125
    .line 126
    invoke-virtual {v2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig$ItemConfig;->getId()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    const-string v3, "_"

    .line 131
    .line 132
    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    return-object v0

    .line 144
    :cond_3
    :goto_0
    return-object v1
.end method

.method public static parseBeautyConfig(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 114
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 115
    :cond_0
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 116
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 117
    :cond_1
    sput-object p1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 118
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "config.json"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 119
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 120
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 121
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    move-result-object p1

    const-class v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    invoke-virtual {p1, p0, v0}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    sput-object p1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 122
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "parse error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " jsonStr: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "ByteDaceConfig"

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ll/b7y;->g([Ljava/lang/Object;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public static parseBeautyConfig(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    sput-object p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->resourceRootPath:Ljava/lang/String;

    .line 21
    .line 22
    new-instance p0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, "config.json"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, p0}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-class v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 67
    .line 68
    invoke-virtual {v0, p0, v1}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;

    .line 73
    .line 74
    sput-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->configs:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    return-void

    .line 77
    :catch_0
    move-exception v0

    .line 78
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    new-instance v2, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v3, "parse error: "

    .line 85
    .line 86
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v0, " jsonStr: "

    .line 93
    .line 94
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const-string v0, "ByteDaceConfig"

    .line 105
    .line 106
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {v1, p0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    :cond_2
    :goto_0
    return-void
.end method
