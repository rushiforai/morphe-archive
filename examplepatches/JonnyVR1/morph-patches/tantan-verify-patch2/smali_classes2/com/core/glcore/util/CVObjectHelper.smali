.class public Lcom/core/glcore/util/CVObjectHelper;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static transObjectInfos([Lcom/momocv/MMBox;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/momocv/MMBox;",
            ")",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVObjectInfo;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-static {p0}, Lcom/core/glcore/util/XEEngineHelper;->setObjectInfo(Ljava/util/ArrayList;)V

    .line 5
    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    array-length v0, p0

    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    if-ge v3, v0, :cond_2

    .line 17
    .line 18
    aget-object v4, p0, v3

    .line 19
    .line 20
    if-nez v4, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    new-instance v5, Lcom/momo/xeengine/cv/bean/CVObjectInfo;

    .line 24
    .line 25
    invoke-direct {v5}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object v6, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v5, v6}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setType(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget v6, v4, Lcom/momocv/MMRect;->x_:I

    .line 34
    .line 35
    int-to-float v6, v6

    .line 36
    iget v7, v4, Lcom/momocv/MMRect;->y_:I

    .line 37
    .line 38
    int-to-float v7, v7

    .line 39
    iget v8, v4, Lcom/momocv/MMRect;->width_:I

    .line 40
    .line 41
    int-to-float v8, v8

    .line 42
    iget v4, v4, Lcom/momocv/MMRect;->height_:I

    .line 43
    .line 44
    int-to-float v4, v4

    .line 45
    const/4 v9, 0x4

    .line 46
    new-array v9, v9, [F

    .line 47
    .line 48
    aput v6, v9, v2

    .line 49
    .line 50
    const/4 v6, 0x1

    .line 51
    aput v7, v9, v6

    .line 52
    .line 53
    const/4 v6, 0x2

    .line 54
    aput v8, v9, v6

    .line 55
    .line 56
    const/4 v6, 0x3

    .line 57
    aput v4, v9, v6

    .line 58
    .line 59
    invoke-virtual {v5, v9}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setBounds([F)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->getScore()F

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    invoke-virtual {v5, v4}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setScore(F)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    invoke-static {v1}, Lcom/core/glcore/util/XEEngineHelper;->setObjectInfo(Ljava/util/ArrayList;)V

    .line 76
    .line 77
    .line 78
    return-object v1
.end method
