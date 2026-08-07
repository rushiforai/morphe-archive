.class public Lcom/immomo/velib/anim/model/Element;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final IMAGE:I = 0x1

.field public static final TEXT:I = 0x2


# instance fields
.field private anim:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/ElementAnimation;",
            ">;"
        }
    .end annotation
.end field

.field private background:Ljava/lang/String;

.field private duration:I

.field private folder:Ljava/lang/String;

.field private fontPixel:I

.field private fontSize:I

.field private height:F

.field private id:Ljava/lang/String;

.field private maxLen:I

.field private new_anim:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/ElementNewAnimation;",
            ">;"
        }
    .end annotation
.end field

.field private text:Ljava/lang/String;

.field private textColor:Ljava/lang/String;

.field private type:I

.field private url:Ljava/lang/String;

.field public useCircle:Z

.field public vHeight:I

.field public vWidth:I

.field private width:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/velib/anim/model/Element;->fontPixel:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/immomo/velib/anim/model/Element;->useCircle:Z

    .line 8
    .line 9
    const/16 v0, 0x2d0

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/velib/anim/model/Element;->vWidth:I

    .line 12
    .line 13
    const/16 v0, 0x500

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/velib/anim/model/Element;->vHeight:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
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
    if-eqz p1, :cond_13

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
    goto/16 :goto_5

    .line 19
    .line 20
    :cond_1
    check-cast p1, Lcom/immomo/velib/anim/model/Element;

    .line 21
    .line 22
    iget v2, p1, Lcom/immomo/velib/anim/model/Element;->width:F

    .line 23
    .line 24
    iget v3, p0, Lcom/immomo/velib/anim/model/Element;->width:F

    .line 25
    .line 26
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    return v1

    .line 33
    :cond_2
    iget v2, p1, Lcom/immomo/velib/anim/model/Element;->height:F

    .line 34
    .line 35
    iget v3, p0, Lcom/immomo/velib/anim/model/Element;->height:F

    .line 36
    .line 37
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_3

    .line 42
    .line 43
    return v1

    .line 44
    :cond_3
    iget v2, p0, Lcom/immomo/velib/anim/model/Element;->fontSize:I

    .line 45
    .line 46
    iget v3, p1, Lcom/immomo/velib/anim/model/Element;->fontSize:I

    .line 47
    .line 48
    if-eq v2, v3, :cond_4

    .line 49
    .line 50
    return v1

    .line 51
    :cond_4
    iget v2, p0, Lcom/immomo/velib/anim/model/Element;->maxLen:I

    .line 52
    .line 53
    iget v3, p1, Lcom/immomo/velib/anim/model/Element;->maxLen:I

    .line 54
    .line 55
    if-eq v2, v3, :cond_5

    .line 56
    .line 57
    return v1

    .line 58
    :cond_5
    iget v2, p0, Lcom/immomo/velib/anim/model/Element;->vWidth:I

    .line 59
    .line 60
    iget v3, p1, Lcom/immomo/velib/anim/model/Element;->vWidth:I

    .line 61
    .line 62
    if-eq v2, v3, :cond_6

    .line 63
    .line 64
    return v1

    .line 65
    :cond_6
    iget v2, p0, Lcom/immomo/velib/anim/model/Element;->vHeight:I

    .line 66
    .line 67
    iget v3, p1, Lcom/immomo/velib/anim/model/Element;->vHeight:I

    .line 68
    .line 69
    if-eq v2, v3, :cond_7

    .line 70
    .line 71
    return v1

    .line 72
    :cond_7
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->text:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v3, p1, Lcom/immomo/velib/anim/model/Element;->text:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v2, :cond_8

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-nez v2, :cond_9

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_8
    if-eqz v3, :cond_9

    .line 86
    .line 87
    :goto_0
    return v1

    .line 88
    :cond_9
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->background:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v3, p1, Lcom/immomo/velib/anim/model/Element;->background:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz v2, :cond_a

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-nez v2, :cond_b

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_a
    if-eqz v3, :cond_b

    .line 102
    .line 103
    :goto_1
    return v1

    .line 104
    :cond_b
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->textColor:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v3, p1, Lcom/immomo/velib/anim/model/Element;->textColor:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v2, :cond_c

    .line 109
    .line 110
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-nez v2, :cond_d

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_c
    if-eqz v3, :cond_d

    .line 118
    .line 119
    :goto_2
    return v1

    .line 120
    :cond_d
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->new_anim:Ljava/util/List;

    .line 121
    .line 122
    iget-object v3, p1, Lcom/immomo/velib/anim/model/Element;->new_anim:Ljava/util/List;

    .line 123
    .line 124
    if-eqz v2, :cond_e

    .line 125
    .line 126
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-nez v2, :cond_f

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_e
    if-eqz v3, :cond_f

    .line 134
    .line 135
    :goto_3
    return v1

    .line 136
    :cond_f
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->anim:Ljava/util/List;

    .line 137
    .line 138
    iget-object v3, p1, Lcom/immomo/velib/anim/model/Element;->anim:Ljava/util/List;

    .line 139
    .line 140
    if-eqz v2, :cond_10

    .line 141
    .line 142
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-nez v2, :cond_11

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_10
    if-eqz v3, :cond_11

    .line 150
    .line 151
    :goto_4
    return v1

    .line 152
    :cond_11
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->folder:Ljava/lang/String;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/immomo/velib/anim/model/Element;->folder:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz p0, :cond_12

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    return p0

    .line 163
    :cond_12
    if-nez p1, :cond_13

    .line 164
    .line 165
    return v0

    .line 166
    :cond_13
    :goto_5
    return v1
.end method

.method public getAnim()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/ElementAnimation;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->anim:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackground()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->background:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackgroundPath()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/velib/anim/model/Element;->folder:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->background:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public getDuration()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Element;->duration:I

    .line 2
    .line 3
    return p0
.end method

.method public getFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFontPixel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Element;->fontPixel:I

    .line 2
    .line 3
    return p0
.end method

.method public getFontSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Element;->fontSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Element;->height:F

    .line 2
    .line 3
    return p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxLen()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Element;->maxLen:I

    .line 2
    .line 3
    return p0
.end method

.method public getNew_anim()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/ElementNewAnimation;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->new_anim:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->textColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Element;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Element;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Element;->width:F

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/anim/model/Element;->text:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 13
    .line 14
    iget v2, p0, Lcom/immomo/velib/anim/model/Element;->width:F

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    cmpl-float v4, v2, v3

    .line 18
    .line 19
    if-eqz v4, :cond_1

    .line 20
    .line 21
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v2, v1

    .line 27
    :goto_1
    add-int/2addr v0, v2

    .line 28
    mul-int/lit8 v0, v0, 0x1f

    .line 29
    .line 30
    iget v2, p0, Lcom/immomo/velib/anim/model/Element;->height:F

    .line 31
    .line 32
    cmpl-float v3, v2, v3

    .line 33
    .line 34
    if-eqz v3, :cond_2

    .line 35
    .line 36
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    goto :goto_2

    .line 41
    :cond_2
    move v2, v1

    .line 42
    :goto_2
    add-int/2addr v0, v2

    .line 43
    mul-int/lit8 v0, v0, 0x1f

    .line 44
    .line 45
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->background:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    goto :goto_3

    .line 54
    :cond_3
    move v2, v1

    .line 55
    :goto_3
    add-int/2addr v0, v2

    .line 56
    mul-int/lit8 v0, v0, 0x1f

    .line 57
    .line 58
    iget v2, p0, Lcom/immomo/velib/anim/model/Element;->fontSize:I

    .line 59
    .line 60
    add-int/2addr v0, v2

    .line 61
    mul-int/lit8 v0, v0, 0x1f

    .line 62
    .line 63
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->textColor:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz v2, :cond_4

    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    goto :goto_4

    .line 72
    :cond_4
    move v2, v1

    .line 73
    :goto_4
    add-int/2addr v0, v2

    .line 74
    mul-int/lit8 v0, v0, 0x1f

    .line 75
    .line 76
    iget v2, p0, Lcom/immomo/velib/anim/model/Element;->maxLen:I

    .line 77
    .line 78
    add-int/2addr v0, v2

    .line 79
    mul-int/lit8 v0, v0, 0x1f

    .line 80
    .line 81
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->new_anim:Ljava/util/List;

    .line 82
    .line 83
    if-eqz v2, :cond_5

    .line 84
    .line 85
    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    goto :goto_5

    .line 90
    :cond_5
    move v2, v1

    .line 91
    :goto_5
    add-int/2addr v0, v2

    .line 92
    mul-int/lit8 v0, v0, 0x1f

    .line 93
    .line 94
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->anim:Ljava/util/List;

    .line 95
    .line 96
    if-eqz v2, :cond_6

    .line 97
    .line 98
    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    goto :goto_6

    .line 103
    :cond_6
    move v2, v1

    .line 104
    :goto_6
    add-int/2addr v0, v2

    .line 105
    mul-int/lit8 v0, v0, 0x1f

    .line 106
    .line 107
    iget-object v2, p0, Lcom/immomo/velib/anim/model/Element;->folder:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz v2, :cond_7

    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    :cond_7
    add-int/2addr v0, v1

    .line 116
    mul-int/lit8 v0, v0, 0x1f

    .line 117
    .line 118
    iget v1, p0, Lcom/immomo/velib/anim/model/Element;->vWidth:I

    .line 119
    .line 120
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x1f

    .line 122
    .line 123
    iget p0, p0, Lcom/immomo/velib/anim/model/Element;->vHeight:I

    .line 124
    .line 125
    add-int/2addr v0, p0

    .line 126
    return v0
.end method

.method public setAnim(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/ElementAnimation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Element;->anim:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setBackground(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Element;->background:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Element;->duration:I

    .line 2
    .line 3
    return-void
.end method

.method public setFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Element;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFontPixel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Element;->fontPixel:I

    .line 2
    .line 3
    return-void
.end method

.method public setFontSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Element;->fontSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Element;->height:F

    .line 2
    .line 3
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Element;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMaxLen(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Element;->maxLen:I

    .line 2
    .line 3
    return-void
.end method

.method public setNew_anim(Ljava/util/List;)Lcom/immomo/velib/anim/model/Element;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/ElementNewAnimation;",
            ">;)",
            "Lcom/immomo/velib/anim/model/Element;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Element;->new_anim:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Element;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTextColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Element;->textColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Element;->type:I

    .line 2
    .line 3
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Element;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Element;->width:F

    .line 2
    .line 3
    return-void
.end method
