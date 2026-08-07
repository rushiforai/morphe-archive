.class public Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BefBrandInfo"
.end annotation


# instance fields
.field brandId:I

.field brandOcr:[I

.field private ocrTable:[Ljava/lang/String;

.field points:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefPointF;


# direct methods
.method public constructor <init>()V
    .locals 67

    .line 1
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v65, "\u9c81"

    .line 5
    .line 6
    const-string v66, "\u9ed1"

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    const-string v2, "0"

    .line 11
    .line 12
    const-string v3, "1"

    .line 13
    .line 14
    const-string v4, "2"

    .line 15
    .line 16
    const-string v5, "3"

    .line 17
    .line 18
    const-string v6, "4"

    .line 19
    .line 20
    const-string v7, "5"

    .line 21
    .line 22
    const-string v8, "6"

    .line 23
    .line 24
    const-string v9, "7"

    .line 25
    .line 26
    const-string v10, "8"

    .line 27
    .line 28
    const-string v11, "9"

    .line 29
    .line 30
    const-string v12, "A"

    .line 31
    .line 32
    const-string v13, "B"

    .line 33
    .line 34
    const-string v14, "C"

    .line 35
    .line 36
    const-string v15, "D"

    .line 37
    .line 38
    const-string v16, "E"

    .line 39
    .line 40
    const-string v17, "F"

    .line 41
    .line 42
    const-string v18, "G"

    .line 43
    .line 44
    const-string v19, "H"

    .line 45
    .line 46
    const-string v20, "J"

    .line 47
    .line 48
    const-string v21, "K"

    .line 49
    .line 50
    const-string v22, "L"

    .line 51
    .line 52
    const-string v23, "M"

    .line 53
    .line 54
    const-string v24, "N"

    .line 55
    .line 56
    const-string v25, "P"

    .line 57
    .line 58
    const-string v26, "Q"

    .line 59
    .line 60
    const-string v27, "R"

    .line 61
    .line 62
    const-string v28, "S"

    .line 63
    .line 64
    const-string v29, "T"

    .line 65
    .line 66
    const-string v30, "U"

    .line 67
    .line 68
    const-string v31, "V"

    .line 69
    .line 70
    const-string v32, "W"

    .line 71
    .line 72
    const-string v33, "X"

    .line 73
    .line 74
    const-string v34, "Y"

    .line 75
    .line 76
    const-string v35, "Z"

    .line 77
    .line 78
    const-string v36, "\u4e91"

    .line 79
    .line 80
    const-string v37, "\u4eac"

    .line 81
    .line 82
    const-string v38, "\u5180"

    .line 83
    .line 84
    const-string v39, "\u5409"

    .line 85
    .line 86
    const-string v40, "\u5b81"

    .line 87
    .line 88
    const-string v41, "\u5ddd"

    .line 89
    .line 90
    const-string v42, "\u65b0"

    .line 91
    .line 92
    const-string v43, "\u664b"

    .line 93
    .line 94
    const-string v44, "\u6842"

    .line 95
    .line 96
    const-string v45, "\u6caa"

    .line 97
    .line 98
    const-string v46, "\u6d25"

    .line 99
    .line 100
    const-string v47, "\u6d59"

    .line 101
    .line 102
    const-string v48, "\u6e1d"

    .line 103
    .line 104
    const-string v49, "\u6e58"

    .line 105
    .line 106
    const-string v50, "\u743c"

    .line 107
    .line 108
    const-string v51, "\u7518"

    .line 109
    .line 110
    const-string v52, "\u7696"

    .line 111
    .line 112
    const-string v53, "\u7ca4"

    .line 113
    .line 114
    const-string v54, "\u82cf"

    .line 115
    .line 116
    const-string v55, "\u8499"

    .line 117
    .line 118
    const-string v56, "\u85cf"

    .line 119
    .line 120
    const-string v57, "\u8c6b"

    .line 121
    .line 122
    const-string v58, "\u8d35"

    .line 123
    .line 124
    const-string v59, "\u8d63"

    .line 125
    .line 126
    const-string v60, "\u8fbd"

    .line 127
    .line 128
    const-string v61, "\u9102"

    .line 129
    .line 130
    const-string v62, "\u95fd"

    .line 131
    .line 132
    const-string v63, "\u9655"

    .line 133
    .line 134
    const-string v64, "\u9752"

    .line 135
    .line 136
    filled-new-array/range {v1 .. v66}, [Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    move-object/from16 v1, p0

    .line 141
    .line 142
    iput-object v0, v1, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;->ocrTable:[Ljava/lang/String;

    .line 143
    .line 144
    return-void
.end method


# virtual methods
.method public getBrandId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;->brandId:I

    .line 2
    .line 3
    return p0
.end method

.method public getBrandOcr()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;->brandOcr:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getBrandOcrString()Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;->brandOcr:[I

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    const/4 v3, 0x0

    .line 10
    :goto_0
    if-ge v3, v2, :cond_0

    .line 11
    .line 12
    aget v4, v1, v3

    .line 13
    .line 14
    iget-object v5, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;->ocrTable:[Ljava/lang/String;

    .line 15
    .line 16
    aget-object v4, v5, v4

    .line 17
    .line 18
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    add-int/lit8 v3, v3, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public getPoints()[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefPointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;->points:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefPointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public setBrandId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;->brandId:I

    .line 2
    .line 3
    return-void
.end method

.method public setPoints([Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefPointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;->points:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefPointF;

    .line 2
    .line 3
    return-void
.end method
