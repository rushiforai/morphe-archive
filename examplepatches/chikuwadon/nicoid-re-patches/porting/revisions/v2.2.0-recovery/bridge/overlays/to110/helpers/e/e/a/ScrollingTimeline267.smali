.class final Le/e/a/ScrollingTimeline267;
.super Ljava/lang/Object;
.source "ScrollingTimeline267.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ScrollingTimeline267$Entry;,
        Le/e/a/ScrollingTimeline267$FrameBudget;
    }
.end annotation


# static fields
.field static final MAX_LANE_WAIT:F = 10.0f

.field static final MAX_LOOKAHEAD:I = 0x8


# instance fields
.field final active:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/ScrollingTimeline267$Entry;",
            ">;"
        }
    .end annotation
.end field

.field blockedChecks:J

.field private generation:J

.field origin:F

.field private final scores:[F

.field shownFromWaiting:J

.field skippedByOverlap:J

.field final started:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private viewportFont:F

.field private viewportHeight:I

.field private viewportWidth:I


# direct methods
.method constructor <init>()V
    .registers 3

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    .line 75
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingTimeline267;->started:Ljava/util/Set;

    .line 77
    const/16 v0, 0x14

    new-array v0, v0, [F

    iput-object v0, p0, Le/e/a/ScrollingTimeline267;->scores:[F

    .line 78
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Le/e/a/ScrollingTimeline267;->generation:J

    return-void
.end method

.method static admissionStart(ZFFFFFFF)F
    .registers 8

    .line 146
    if-nez p0, :cond_1

    cmpl-float p0, p5, p4

    if-eqz p0, :cond_0

    move p4, p5

    goto :goto_0

    .line 147
    :cond_0
    move p4, p5

    move p5, p6

    move p6, p7

    const/4 p7, 0x0

    invoke-static/range {p1 .. p7}, Le/e/a/ScrollingTimeline267;->start(FFFFFFZ)F

    move-result p0

    return p0

    .line 146
    :cond_1
    move p4, p5

    :goto_0
    return p4
.end method

.method private static resize(Le/e/a/ScrollingTimeline267$Entry;IIFFIF)V
    .registers 11

    .line 104
    int-to-float p1, p1

    iget v0, p0, Le/e/a/ScrollingTimeline267$Entry;->width:F

    add-float/2addr v0, p1

    iget v1, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    .line 105
    iget v1, p0, Le/e/a/ScrollingTimeline267$Entry;->width:F

    mul-float/2addr v1, p3

    iput v1, p0, Le/e/a/ScrollingTimeline267$Entry;->width:F

    .line 106
    iget v1, p0, Le/e/a/ScrollingTimeline267$Entry;->size:F

    mul-float/2addr v1, p3

    iput v1, p0, Le/e/a/ScrollingTimeline267$Entry;->size:F

    .line 107
    iget v1, p0, Le/e/a/ScrollingTimeline267$Entry;->ascent:F

    iget v3, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr v1, v3

    mul-float/2addr v1, p3

    iget v3, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    sub-float/2addr v1, v3

    iput v1, p0, Le/e/a/ScrollingTimeline267$Entry;->ascent:F

    .line 108
    iget v1, p0, Le/e/a/ScrollingTimeline267$Entry;->height:F

    iget v3, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    mul-float/2addr v3, v2

    sub-float/2addr v1, v3

    mul-float/2addr v1, p3

    iget p3, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    mul-float/2addr p3, v2

    add-float/2addr v1, p3

    iput v1, p0, Le/e/a/ScrollingTimeline267$Entry;->height:F

    .line 109
    int-to-float p2, p2

    iget p3, p0, Le/e/a/ScrollingTimeline267$Entry;->width:F

    add-float/2addr p3, p2

    iget v1, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    mul-float/2addr v1, v2

    add-float/2addr p3, v1

    .line 110
    div-float/2addr p3, v0

    .line 112
    iget v0, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr p2, v0

    iget v0, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr p1, v0

    invoke-virtual {p0, p6}, Le/e/a/ScrollingTimeline267$Entry;->left(F)F

    move-result v0

    sub-float/2addr p1, v0

    mul-float/2addr p1, p3

    sub-float/2addr p2, p1

    .line 113
    iget p1, p0, Le/e/a/ScrollingTimeline267$Entry;->top:F

    mul-float/2addr p1, p4

    int-to-float p4, p5

    iget p5, p0, Le/e/a/ScrollingTimeline267$Entry;->height:F

    sub-float/2addr p4, p5

    const/4 p5, 0x0

    invoke-static {p5, p4}, Ljava/lang/Math;->max(FF)F

    move-result p4

    invoke-static {p1, p4}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 114
    iget p4, p0, Le/e/a/ScrollingTimeline267$Entry;->speed:F

    mul-float/2addr p4, p3

    invoke-virtual {p0, p2, p6, p4, p1}, Le/e/a/ScrollingTimeline267$Entry;->place(FFFF)V

    .line 115
    return-void
.end method

.method static start(FFFFFFZ)F
    .registers 7

    .line 138
    if-nez p6, :cond_2

    cmpl-float p1, p0, p1

    if-ltz p1, :cond_0

    goto :goto_0

    .line 139
    :cond_0
    sub-float/2addr p2, p0

    div-float/2addr p2, p4

    .line 140
    cmpg-float p0, p2, p5

    if-gez p0, :cond_1

    sub-float/2addr p3, p2

    :cond_1
    return p3

    .line 138
    :cond_2
    :goto_0
    return p3
.end method


# virtual methods
.method frame(JFF)V
    .registers 8

    .line 118
    iget-wide v0, p0, Le/e/a/ScrollingTimeline267;->generation:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 119
    iput-wide p1, p0, Le/e/a/ScrollingTimeline267;->generation:J

    .line 120
    iput p3, p0, Le/e/a/ScrollingTimeline267;->origin:F

    .line 121
    iget-object p1, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 122
    iget-object p1, p0, Le/e/a/ScrollingTimeline267;->started:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 123
    return-void

    .line 125
    :cond_0
    nop

    .line 126
    iget-object p1, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    .line 127
    const/4 p2, 0x0

    move p3, p2

    :goto_0
    if-ge p2, p1, :cond_3

    .line 128
    iget-object v0, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ScrollingTimeline267$Entry;

    .line 129
    invoke-virtual {v0, p4}, Le/e/a/ScrollingTimeline267$Entry;->right(F)F

    move-result v1

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_1

    goto :goto_1

    .line 130
    :cond_1
    if-eq p3, p2, :cond_2

    iget-object v1, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {v1, p3, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 131
    :cond_2
    add-int/lit8 p3, p3, 0x1

    .line 127
    :goto_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 133
    :cond_3
    if-eq p3, p1, :cond_4

    iget-object p2, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {p2, p3, p1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 134
    :cond_4
    return-void
.end method

.method overlaps(FII)Z
    .registers 5

    .line 232
    iget-object v0, p0, Le/e/a/ScrollingTimeline267;->scores:[F

    int-to-float p3, p3

    int-to-float p2, p2

    div-float/2addr p3, p2

    div-float/2addr p1, p3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    aget p1, v0, p1

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method resizeViewport(JIIFFLjava/util/ArrayDeque;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JIIFF",
            "Ljava/util/ArrayDeque<",
            "Le/e/a/ScrollingTimeline267$Entry;",
            ">;)V"
        }
    .end annotation

    .line 85
    if-lez p3, :cond_5

    if-lez p4, :cond_5

    const/4 v0, 0x0

    cmpl-float v1, p5, v0

    if-lez v1, :cond_5

    invoke-static {p5}, Ljava/lang/Float;->isFinite(F)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 86
    :cond_0
    iget v1, p0, Le/e/a/ScrollingTimeline267;->viewportWidth:I

    if-ne p3, v1, :cond_1

    iget v1, p0, Le/e/a/ScrollingTimeline267;->viewportHeight:I

    if-ne p4, v1, :cond_1

    iget v1, p0, Le/e/a/ScrollingTimeline267;->viewportFont:F

    cmpl-float v1, p5, v1

    if-nez v1, :cond_1

    return-void

    .line 87
    :cond_1
    iget-wide v1, p0, Le/e/a/ScrollingTimeline267;->generation:J

    cmp-long p1, v1, p1

    if-nez p1, :cond_3

    iget p1, p0, Le/e/a/ScrollingTimeline267;->viewportFont:F

    cmpl-float p1, p1, v0

    if-lez p1, :cond_3

    .line 88
    iget p1, p0, Le/e/a/ScrollingTimeline267;->viewportFont:F

    div-float v3, p5, p1

    .line 89
    int-to-float p1, p4

    iget p2, p0, Le/e/a/ScrollingTimeline267;->viewportHeight:I

    int-to-float p2, p2

    div-float v4, p1, p2

    .line 90
    const/4 p1, 0x0

    :goto_0
    iget-object p2, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_2

    .line 91
    iget-object p2, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Le/e/a/ScrollingTimeline267$Entry;

    iget v1, p0, Le/e/a/ScrollingTimeline267;->viewportWidth:I

    move v2, p3

    move v5, p4

    move v6, p6

    invoke-static/range {v0 .. v6}, Le/e/a/ScrollingTimeline267;->resize(Le/e/a/ScrollingTimeline267$Entry;IIFFIF)V

    .line 90
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 93
    :cond_2
    move v2, p3

    move v5, p4

    move v6, p6

    invoke-virtual {p7}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Le/e/a/ScrollingTimeline267$Entry;

    .line 94
    iget v1, p0, Le/e/a/ScrollingTimeline267;->viewportWidth:I

    invoke-static/range {v0 .. v6}, Le/e/a/ScrollingTimeline267;->resize(Le/e/a/ScrollingTimeline267$Entry;IIFFIF)V

    .line 95
    goto :goto_1

    .line 87
    :cond_3
    move v2, p3

    move v5, p4

    .line 97
    :cond_4
    iput v2, p0, Le/e/a/ScrollingTimeline267;->viewportWidth:I

    .line 98
    iput v5, p0, Le/e/a/ScrollingTimeline267;->viewportHeight:I

    .line 99
    iput p5, p0, Le/e/a/ScrollingTimeline267;->viewportFont:F

    .line 100
    return-void

    .line 85
    :cond_5
    :goto_2
    return-void
.end method

.method showWaiting(Ljava/util/ArrayDeque;ZIIIF)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayDeque<",
            "Le/e/a/ScrollingTimeline267$Entry;",
            ">;ZIIIF)V"
        }
    .end annotation

    .line 196
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v7}, Le/e/a/ScrollingTimeline267;->showWaiting(Ljava/util/ArrayDeque;ZIIIFLe/e/a/ScrollingTimeline267$FrameBudget;)V

    .line 197
    return-void
.end method

.method showWaiting(Ljava/util/ArrayDeque;ZIIIFLe/e/a/ScrollingTimeline267$FrameBudget;)V
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayDeque<",
            "Le/e/a/ScrollingTimeline267$Entry;",
            ">;ZIIIF",
            "Le/e/a/ScrollingTimeline267$FrameBudget;",
            ")V"
        }
    .end annotation

    .line 203
    if-eqz p2, :cond_0

    const/16 v0, 0x8

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayDeque;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayDeque;->size()I

    move-result v0

    :goto_0
    move v9, v0

    .line 204
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .line 205
    const/4 v0, 0x0

    move v11, v0

    :goto_1
    if-ge v11, v9, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 206
    if-eqz p7, :cond_1

    invoke-virtual/range {p7 .. p7}, Le/e/a/ScrollingTimeline267$FrameBudget;->take()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 207
    :cond_1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Le/e/a/ScrollingTimeline267$Entry;

    .line 208
    move/from16 v13, p3

    int-to-float v0, v13

    iget v1, v12, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr v1, v0

    .line 209
    iget v0, v12, Le/e/a/ScrollingTimeline267$Entry;->leftAtStart:F

    iget v2, v12, Le/e/a/ScrollingTimeline267$Entry;->width:F

    add-float/2addr v0, v2

    iget v2, v12, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr v0, v2

    iget v2, v12, Le/e/a/ScrollingTimeline267$Entry;->speed:F

    div-float/2addr v0, v2

    .line 210
    iget v2, v12, Le/e/a/ScrollingTimeline267$Entry;->width:F

    add-float/2addr v2, v1

    iget v3, v12, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr v2, v3

    div-float/2addr v2, v0

    .line 211
    iget v3, v12, Le/e/a/ScrollingTimeline267$Entry;->width:F

    iget v4, v12, Le/e/a/ScrollingTimeline267$Entry;->height:F

    iget v5, v12, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    move-object v0, p0

    move/from16 v8, p4

    move/from16 v7, p5

    move/from16 v6, p6

    invoke-virtual/range {v0 .. v8}, Le/e/a/ScrollingTimeline267;->top(FFFFFFII)F

    move-result v3

    .line 212
    const-wide/16 v4, 0x1

    if-eqz p2, :cond_3

    move/from16 v8, p4

    move/from16 v7, p5

    invoke-virtual {p0, v3, v7, v8}, Le/e/a/ScrollingTimeline267;->overlaps(FII)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 215
    iget v1, v12, Le/e/a/ScrollingTimeline267$Entry;->waitOrigin:F

    sub-float v1, v6, v1

    const/high16 v2, 0x41200000    # 10.0f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2

    .line 216
    iget-wide v1, p0, Le/e/a/ScrollingTimeline267;->blockedChecks:J

    add-long/2addr v1, v4

    iput-wide v1, p0, Le/e/a/ScrollingTimeline267;->blockedChecks:J

    .line 217
    goto :goto_2

    .line 219
    :cond_2
    invoke-interface {v10}, Ljava/util/Iterator;->remove()V

    .line 220
    iget-wide v1, p0, Le/e/a/ScrollingTimeline267;->skippedByOverlap:J

    add-long/2addr v1, v4

    iput-wide v1, p0, Le/e/a/ScrollingTimeline267;->skippedByOverlap:J

    .line 221
    goto :goto_2

    .line 212
    :cond_3
    move/from16 v8, p4

    move/from16 v7, p5

    .line 223
    :cond_4
    invoke-interface {v10}, Ljava/util/Iterator;->remove()V

    .line 224
    invoke-virtual {v12, v1, v6, v2, v3}, Le/e/a/ScrollingTimeline267$Entry;->place(FFFF)V

    .line 225
    iget-object v1, p0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    iget-wide v1, p0, Le/e/a/ScrollingTimeline267;->shownFromWaiting:J

    add-long/2addr v1, v4

    iput-wide v1, p0, Le/e/a/ScrollingTimeline267;->shownFromWaiting:J

    .line 205
    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 228
    :cond_5
    return-void
.end method

.method top(FFFFFFII)F
    .registers 26

    .line 152
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p8

    int-to-float v2, v2

    move/from16 v3, p7

    int-to-float v3, v3

    div-float v3, v2, v3

    .line 153
    sub-float v2, v2, p4

    div-float/2addr v2, v3

    float-to-double v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v2, v4

    const/4 v4, 0x1

    add-int/2addr v2, v4

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 154
    iget-object v5, v0, Le/e/a/ScrollingTimeline267;->scores:[F

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static {v5, v6, v2, v7}, Ljava/util/Arrays;->fill([FIIF)V

    .line 155
    add-float v5, p1, v1

    add-float v5, v5, p5

    div-float v5, v5, p2

    .line 156
    move v8, v6

    :goto_0
    iget-object v9, v0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_7

    .line 157
    iget-object v9, v0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le/e/a/ScrollingTimeline267$Entry;

    .line 158
    iget v10, v9, Le/e/a/ScrollingTimeline267$Entry;->top:F

    iget v11, v9, Le/e/a/ScrollingTimeline267$Entry;->height:F

    add-float/2addr v10, v11

    .line 160
    iget v11, v9, Le/e/a/ScrollingTimeline267$Entry;->top:F

    sub-float v11, v11, p4

    div-float/2addr v11, v3

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->floor(D)D

    move-result-wide v11

    double-to-int v11, v11

    invoke-static {v6, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 161
    add-int/lit8 v12, v2, -0x1

    div-float v13, v10, v3

    float-to-double v13, v13

    invoke-static {v13, v14}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v13

    double-to-int v13, v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 162
    if-le v11, v12, :cond_0

    move/from16 v13, p6

    goto/16 :goto_3

    .line 163
    :cond_0
    move/from16 v13, p6

    invoke-virtual {v9, v13}, Le/e/a/ScrollingTimeline267$Entry;->left(F)F

    move-result v14

    .line 164
    iget v15, v9, Le/e/a/ScrollingTimeline267$Entry;->width:F

    add-float/2addr v15, v14

    iget v4, v9, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr v15, v4

    iget v4, v9, Le/e/a/ScrollingTimeline267$Entry;->speed:F

    div-float/2addr v15, v4

    .line 165
    invoke-static {v5, v15}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 166
    cmpg-float v15, v4, v7

    if-gtz v15, :cond_1

    goto :goto_3

    .line 167
    :cond_1
    iget v15, v9, Le/e/a/ScrollingTimeline267$Entry;->speed:F

    sub-float v15, p2, v15

    .line 168
    sub-float v14, p1, v14

    .line 169
    neg-float v6, v1

    sub-float v6, v6, p5

    move/from16 v16, v7

    iget v7, v9, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    sub-float/2addr v6, v7

    .line 170
    iget v7, v9, Le/e/a/ScrollingTimeline267$Entry;->width:F

    iget v1, v9, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr v7, v1

    add-float v7, v7, p5

    .line 172
    cmpl-float v1, v15, v16

    if-nez v1, :cond_3

    .line 173
    cmpg-float v1, v14, v6

    if-ltz v1, :cond_6

    cmpl-float v1, v14, v7

    if-lez v1, :cond_2

    goto :goto_3

    .line 174
    :cond_2
    goto :goto_1

    .line 176
    :cond_3
    sub-float v1, v14, v7

    div-float/2addr v1, v15

    .line 177
    sub-float/2addr v14, v6

    div-float/2addr v14, v15

    .line 178
    invoke-static {v1, v14}, Ljava/lang/Math;->max(FF)F

    move-result v6

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 179
    invoke-static {v1, v14}, Ljava/lang/Math;->min(FF)F

    move-result v1

    move/from16 v6, v16

    invoke-static {v6, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    sub-float/2addr v4, v1

    .line 180
    cmpg-float v1, v4, v6

    if-gtz v1, :cond_4

    goto :goto_3

    .line 182
    :cond_4
    :goto_1
    nop

    :goto_2
    if-gt v11, v12, :cond_6

    .line 183
    int-to-float v1, v11

    mul-float/2addr v1, v3

    .line 184
    add-float v6, v1, p4

    invoke-static {v6, v10}, Ljava/lang/Math;->min(FF)F

    move-result v6

    iget v7, v9, Le/e/a/ScrollingTimeline267$Entry;->top:F

    invoke-static {v1, v7}, Ljava/lang/Math;->max(FF)F

    move-result v1

    sub-float/2addr v6, v1

    .line 185
    const/16 v16, 0x0

    cmpl-float v1, v6, v16

    if-lez v1, :cond_5

    iget-object v1, v0, Le/e/a/ScrollingTimeline267;->scores:[F

    aget v7, v1, v11

    mul-float/2addr v6, v4

    add-float/2addr v7, v6

    aput v7, v1, v11

    .line 182
    :cond_5
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 156
    :cond_6
    :goto_3
    add-int/lit8 v8, v8, 0x1

    move/from16 v1, p3

    const/4 v4, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    goto/16 :goto_0

    .line 188
    :cond_7
    nop

    .line 189
    const/4 v4, 0x1

    const/4 v6, 0x0

    :goto_4
    if-ge v4, v2, :cond_9

    iget-object v1, v0, Le/e/a/ScrollingTimeline267;->scores:[F

    aget v1, v1, v6

    const/16 v16, 0x0

    cmpl-float v1, v1, v16

    if-lez v1, :cond_9

    .line 190
    iget-object v1, v0, Le/e/a/ScrollingTimeline267;->scores:[F

    aget v1, v1, v4

    iget-object v5, v0, Le/e/a/ScrollingTimeline267;->scores:[F

    aget v5, v5, v6

    cmpg-float v1, v1, v5

    if-gez v1, :cond_8

    move v6, v4

    .line 189
    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 192
    :cond_9
    int-to-float v1, v6

    mul-float/2addr v1, v3

    return v1
.end method
