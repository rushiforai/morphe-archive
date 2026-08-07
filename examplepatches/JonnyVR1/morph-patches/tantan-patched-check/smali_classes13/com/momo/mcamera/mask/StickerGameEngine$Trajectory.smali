.class Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/StickerGameEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Trajectory"
.end annotation


# instance fields
.field bindStickerGroup:I

.field coreNumber:I

.field duration:F

.field fixedFrames:I

.field isFixed:Z

.field isTriggered:Z

.field maxFixFrames:I

.field needRandomStickerGroup:Z

.field startTime:J

.field final synthetic this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

.field velocity:F

.field xPosition:F

.field yPosition:F

.field yPositionOffset:F


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/StickerGameEngine;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isFixed:Z

    .line 8
    .line 9
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->fixedFrames:I

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->maxFixFrames:I

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->needRandomStickerGroup:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isTriggered:Z

    .line 16
    .line 17
    invoke-static {p1}, Lcom/momo/mcamera/mask/StickerGameEngine;->access$008(Lcom/momo/mcamera/mask/StickerGameEngine;)I

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/momo/mcamera/mask/StickerGameEngine;->access$000(Lcom/momo/mcamera/mask/StickerGameEngine;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->coreNumber:I

    .line 25
    .line 26
    const v0, -0x41e66666    # -0.15f

    .line 27
    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    mul-float/2addr p1, v0

    .line 31
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPositionOffset:F

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public reset()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->needRandomStickerGroup:Z

    .line 2
    .line 3
    const-wide/high16 v1, 0x4024000000000000L    # 10.0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    mul-double/2addr v3, v1

    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerGameEngine;->access$100(Lcom/momo/mcamera/mask/StickerGameEngine;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-double v5, v0

    .line 19
    rem-double/2addr v3, v5

    .line 20
    double-to-int v0, v3

    .line 21
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->bindStickerGroup:I

    .line 22
    .line 23
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->coreNumber:I

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    add-int/2addr v0, v3

    .line 27
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->coreNumber:I

    .line 28
    .line 29
    const/4 v4, 0x5

    .line 30
    if-le v0, v4, :cond_1

    .line 31
    .line 32
    iput v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->coreNumber:I

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerItemList:Ljava/util/List;

    .line 37
    .line 38
    iget v4, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->bindStickerGroup:I

    .line 39
    .line 40
    mul-int/lit8 v4, v4, 0x2

    .line 41
    .line 42
    add-int/2addr v4, v3

    .line 43
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->maxFixFrames:I

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->fixedFrames:I

    .line 59
    .line 60
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isFixed:Z

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    iput v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->duration:F

    .line 64
    .line 65
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 66
    .line 67
    .line 68
    move-result-wide v3

    .line 69
    double-to-float v3, v3

    .line 70
    iput v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->xPosition:F

    .line 71
    .line 72
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 73
    .line 74
    invoke-static {v3}, Lcom/momo/mcamera/mask/StickerGameEngine;->access$200(Lcom/momo/mcamera/mask/StickerGameEngine;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-lez v3, :cond_2

    .line 83
    .line 84
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 85
    .line 86
    .line 87
    move-result-wide v3

    .line 88
    mul-double/2addr v3, v1

    .line 89
    double-to-int v1, v3

    .line 90
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 91
    .line 92
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerGameEngine;->access$200(Lcom/momo/mcamera/mask/StickerGameEngine;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    rem-int/2addr v1, v2

    .line 101
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 102
    .line 103
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerGameEngine;->access$200(Lcom/momo/mcamera/mask/StickerGameEngine;)Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Ljava/lang/Float;

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    iput v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->xPosition:F

    .line 118
    .line 119
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 120
    .line 121
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerGameEngine;->access$200(Lcom/momo/mcamera/mask/StickerGameEngine;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 129
    .line 130
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerGameEngine;->access$300(Lcom/momo/mcamera/mask/StickerGameEngine;)Ljava/util/List;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->this$0:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerItemList:Ljava/util/List;

    .line 140
    .line 141
    iget v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->bindStickerGroup:I

    .line 142
    .line 143
    mul-int/lit8 v2, v2, 0x2

    .line 144
    .line 145
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast v1, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 150
    .line 151
    iget v1, v1, Lcom/momo/mcamera/mask/StickerGameItem;->downVelocity:F

    .line 152
    .line 153
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->velocity:F

    .line 154
    .line 155
    iget-boolean v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isTriggered:Z

    .line 156
    .line 157
    if-eqz v2, :cond_3

    .line 158
    .line 159
    iget v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->coreNumber:I

    .line 160
    .line 161
    add-int/lit8 v3, v2, 0x1

    .line 162
    .line 163
    int-to-float v3, v3

    .line 164
    const v4, -0x42333333    # -0.1f

    .line 165
    .line 166
    .line 167
    mul-float/2addr v3, v4

    .line 168
    const/high16 v4, 0x40000000    # 2.0f

    .line 169
    .line 170
    div-float/2addr v3, v4

    .line 171
    iput v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPositionOffset:F

    .line 172
    .line 173
    float-to-double v3, v1

    .line 174
    const-wide v5, 0x3fa999999999999aL    # 0.05

    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    int-to-double v1, v2

    .line 180
    mul-double/2addr v1, v5

    .line 181
    sub-double/2addr v3, v1

    .line 182
    double-to-float v1, v3

    .line 183
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->velocity:F

    .line 184
    .line 185
    :cond_3
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isTriggered:Z

    .line 186
    .line 187
    iget v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPositionOffset:F

    .line 188
    .line 189
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPosition:F

    .line 190
    .line 191
    const-wide/16 v0, 0x0

    .line 192
    .line 193
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->startTime:J

    .line 194
    .line 195
    return-void
.end method
