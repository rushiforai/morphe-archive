.class public final Le/e/a/ScrollingComments267;
.super Ljava/lang/Object;
.source "ScrollingComments267.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ScrollingComments267$State;,
        Le/e/a/ScrollingComments267$Channel;
    }
.end annotation


# static fields
.field private static final CONTEXT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/ScrollingComments267$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ScrollingComments267;->STATES:Ljava/util/WeakHashMap;

    .line 20
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/ScrollingComments267;->CONTEXT:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;)Z
    .registers 1

    .line 17
    invoke-static {p0}, Le/e/a/ScrollingComments267;->isPopup(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static admit(Le/e/a/ScrollingComments267$State;Le/e/a/ScrollingComments267$Channel;Le/e/a/CommentSource280$Item;ZIIIFFIFF)V
    .registers 35

    .line 330
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v1, v1, Le/e/a/CommentSource280$Item;->comment:Le/e/a/q;

    .line 331
    iget-object v2, v0, Le/e/a/ScrollingComments267$State;->keys:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 332
    if-nez v2, :cond_1

    .line 333
    invoke-static {v1}, Le/e/a/CommentContinuity118;->key(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 334
    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 335
    :cond_0
    iget-object v3, v0, Le/e/a/ScrollingComments267$State;->keys:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    :cond_1
    iget-object v3, v0, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget-object v3, v3, Le/e/a/ScrollingTimeline267;->started:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    return-void

    .line 339
    :cond_2
    iget-object v2, v1, Le/e/a/q;->i:Ljava/lang/Integer;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Le/e/a/CommentSource280;->value(Ljava/lang/Integer;I)I

    move-result v2

    .line 340
    const/4 v4, 0x1

    if-ne v2, v4, :cond_3

    const v2, 0x3f2b851f    # 0.67f

    goto :goto_0

    :cond_3
    const/4 v5, 0x2

    if-ne v2, v5, :cond_4

    const v2, 0x3fb5c28f    # 1.42f

    goto :goto_0

    :cond_4
    const/high16 v2, 0x3f800000    # 1.0f

    :goto_0
    mul-float v13, p7, v2

    .line 341
    iget-object v2, v0, Le/e/a/ScrollingComments267$State;->fill:Landroid/graphics/Paint;

    invoke-virtual {v2, v13}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 342
    iget-object v2, v0, Le/e/a/ScrollingComments267$State;->fill:Landroid/graphics/Paint;

    iget-object v5, v0, Le/e/a/ScrollingComments267$State;->metrics:Landroid/graphics/Paint$FontMetrics;

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 343
    iget-object v2, v1, Le/e/a/q;->a:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 344
    const/16 v5, 0xa

    invoke-virtual {v2, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    const/4 v6, -0x1

    if-gez v5, :cond_5

    new-array v5, v4, [Ljava/lang/String;

    aput-object v2, v5, v3

    goto :goto_1

    :cond_5
    const-string v5, "\n"

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    :goto_1
    move-object v7, v5

    .line 345
    nop

    .line 346
    array-length v2, v7

    const/4 v5, 0x0

    move v12, v5

    :goto_2
    if-ge v3, v2, :cond_6

    aget-object v8, v7, v3

    iget-object v9, v0, Le/e/a/ScrollingComments267$State;->fill:Landroid/graphics/Paint;

    invoke-virtual {v9, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v8

    invoke-static {v12, v8}, Ljava/lang/Math;->max(FF)F

    move-result v12

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 347
    :cond_6
    iget-object v2, v0, Le/e/a/ScrollingComments267$State;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v2, v2, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget-object v3, v0, Le/e/a/ScrollingComments267$State;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float/2addr v2, v3

    array-length v3, v7

    sub-int/2addr v3, v4

    int-to-float v3, v3

    mul-float/2addr v3, v13

    const v4, 0x3f933333    # 1.15f

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    mul-float v3, v3, p8

    add-float v16, v2, v3

    .line 349
    move/from16 v2, p4

    int-to-float v2, v2

    add-float v9, v2, p8

    .line 350
    add-float v2, v9, v12

    add-float v2, v2, p8

    move/from16 v3, p9

    int-to-float v3, v3

    div-float v11, v2, v3

    .line 351
    if-eqz p3, :cond_7

    goto :goto_3

    :cond_7
    iget-object v14, v0, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    sub-float v2, p10, p11

    mul-float/2addr v2, v11

    sub-float v15, v9, v2

    move/from16 v22, p5

    move/from16 v21, p6

    move/from16 v19, p8

    move/from16 v20, p10

    move/from16 v17, v12

    move/from16 v18, v16

    move/from16 v16, v11

    invoke-virtual/range {v14 .. v22}, Le/e/a/ScrollingTimeline267;->top(FFFFFFII)F

    move-result v5

    move/from16 v16, v18

    :goto_3
    move v14, v5

    .line 353
    iget-object v1, v1, Le/e/a/q;->f:Ljava/lang/Integer;

    invoke-static {v1, v6}, Le/e/a/CommentSource280;->value(Ljava/lang/Integer;I)I

    move-result v1

    .line 354
    new-instance v5, Le/e/a/ScrollingTimeline267$Entry;

    .line 355
    if-nez v1, :cond_8

    move v8, v6

    goto :goto_4

    :cond_8
    move v8, v1

    :goto_4
    iget-object v1, v0, Le/e/a/ScrollingComments267$State;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float v15, v1, p8

    move-object/from16 v6, p1

    move/from16 v17, p8

    move/from16 v10, p11

    invoke-direct/range {v5 .. v17}, Le/e/a/ScrollingTimeline267$Entry;-><init>(Ljava/lang/Object;[Ljava/lang/String;IFFFFFFFFF)V

    .line 357
    if-eqz p3, :cond_9

    iget-object v0, v0, Le/e/a/ScrollingComments267$State;->waiting:Ljava/util/ArrayDeque;

    invoke-virtual {v0, v5}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    goto :goto_5

    .line 358
    :cond_9
    iget-object v0, v0, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget-object v0, v0, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 359
    :goto_5
    return-void
.end method

.method private static callerPath()Ljava/lang/String;
    .registers 8

    .line 300
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 301
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0xb4

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 302
    nop

    .line 303
    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v5, v0, v3

    .line 304
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v6

    .line 305
    const-string v7, "java.lang.Thread"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 306
    const-class v7, Le/e/a/ScrollingComments267;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_1

    .line 307
    :cond_0
    if-eqz v4, :cond_1

    const-string v7, " <- "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    :cond_1
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x7

    if-lt v4, v5, :cond_2

    goto :goto_2

    .line 303
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 311
    :cond_3
    :goto_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static draw(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;Z)Ljava/util/ArrayList;
    .registers 43
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/graphics/Canvas;",
            "Ljava/util/ArrayList<",
            "*>;Z)",
            "Ljava/util/ArrayList<",
            "*>;"
        }
    .end annotation

    .line 79
    move-object/from16 v1, p0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 81
    sget-object v2, Le/e/a/ScrollingComments267;->STATES:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 82
    :try_start_0
    sget-object v0, Le/e/a/ScrollingComments267;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ScrollingComments267$State;

    .line 83
    if-nez v0, :cond_0

    .line 84
    new-instance v0, Le/e/a/ScrollingComments267$State;

    invoke-direct {v0, v1}, Le/e/a/ScrollingComments267$State;-><init>(Ljava/lang/Object;)V

    .line 85
    sget-object v3, Le/e/a/ScrollingComments267;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v8, v0

    goto :goto_0

    .line 83
    :cond_0
    move-object v8, v0

    .line 87
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    move-object v0, v1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 89
    sget-object v0, Le/e/a/ScrollingComments267;->CONTEXT:Ljava/lang/ThreadLocal;

    iget-object v3, v8, Le/e/a/ScrollingComments267$State;->context:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 90
    invoke-static {v2}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v3, "comment_avoid_overlap"

    const/4 v5, 0x0

    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    .line 91
    const-string v0, "comment_duration_seconds"

    const/4 v3, 0x5

    const/4 v9, 0x1

    const/16 v10, 0x14

    invoke-static {v2, v0, v3, v9, v10}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result v0

    mul-int/lit8 v3, v0, 0x64

    .line 92
    iget-object v0, v8, Le/e/a/ScrollingComments267$State;->fill:Landroid/graphics/Paint;

    invoke-static {v0, v2}, Le/e/a/CommentStyle;->apply(Landroid/graphics/Paint;Landroid/content/Context;)Z

    .line 93
    iget-object v0, v8, Le/e/a/ScrollingComments267$State;->nativeOpacity:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_1

    .line 95
    :try_start_1
    iget-object v0, v8, Le/e/a/ScrollingComments267$State;->nativeOpacity:Ljava/lang/reflect/Field;

    const/16 v12, 0xff

    invoke-virtual {v0, v1, v12}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    .line 98
    goto :goto_1

    .line 96
    :catch_0
    move-exception v0

    .line 100
    :cond_1
    :goto_1
    invoke-static/range {p0 .. p1}, Le/e/a/CommentViewport190;->width(Ljava/lang/Object;Landroid/graphics/Canvas;)I

    move-result v12

    .line 101
    invoke-static/range {p0 .. p1}, Le/e/a/CommentViewport190;->height(Ljava/lang/Object;Landroid/graphics/Canvas;)I

    move-result v13

    .line 102
    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v15

    .line 103
    invoke-static {v1}, Le/e/a/CommentClock;->frameSample(Ljava/lang/Object;)Le/e/a/CommentClock$Sample;

    move-result-object v0

    .line 104
    iget v14, v0, Le/e/a/CommentClock$Sample;->position:I

    int-to-float v14, v14

    const/high16 v16, 0x41200000    # 10.0f

    div-float v22, v14, v16

    .line 105
    iget v14, v0, Le/e/a/CommentClock$Sample;->rate:F

    invoke-static {v14}, Ljava/lang/Float;->isFinite(F)Z

    move-result v14

    const/high16 v21, 0x3f800000    # 1.0f

    if-eqz v14, :cond_2

    iget v14, v0, Le/e/a/CommentClock$Sample;->rate:F

    const v16, 0x3dcccccd    # 0.1f

    cmpl-float v14, v14, v16

    if-ltz v14, :cond_2

    iget v0, v0, Le/e/a/CommentClock$Sample;->rate:F

    goto :goto_2

    :cond_2
    move/from16 v0, v21

    .line 106
    :goto_2
    move-wide/from16 v24, v6

    invoke-static {v1}, Le/e/a/CommentMotion;->generation(Ljava/lang/Object;)J

    move-result-wide v5

    .line 107
    iget-wide v9, v8, Le/e/a/ScrollingComments267$State;->generation:J

    cmp-long v9, v9, v5

    if-eqz v9, :cond_3

    .line 108
    iget-object v9, v8, Le/e/a/ScrollingComments267$State;->waiting:Ljava/util/ArrayDeque;

    invoke-virtual {v9}, Ljava/util/ArrayDeque;->clear()V

    .line 109
    iput-wide v5, v8, Le/e/a/ScrollingComments267$State;->generation:J

    .line 112
    :cond_3
    iget-object v9, v8, Le/e/a/ScrollingComments267$State;->frameBudget:Le/e/a/ScrollingTimeline267$FrameBudget;

    invoke-virtual {v9}, Le/e/a/ScrollingTimeline267$FrameBudget;->reset()V

    .line 113
    iget-object v10, v8, Le/e/a/ScrollingComments267$State;->channels:[Le/e/a/ScrollingComments267$Channel;

    aget-object v10, v10, p3

    .line 114
    iget-object v1, v10, Le/e/a/ScrollingComments267$Channel;->source:Le/e/a/CommentSource280;

    .line 115
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v26

    .line 116
    move-object/from16 v7, p2

    invoke-virtual {v1, v7}, Le/e/a/CommentSource280;->update(Ljava/util/ArrayList;)Z

    move-result v23

    .line 117
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    sub-long v28, v16, v26

    .line 118
    invoke-virtual {v1, v3}, Le/e/a/CommentSource280;->fixedDuration(I)V

    .line 119
    const-string v14, "comment_rows"

    move-object/from16 v30, v1

    const/16 v1, 0xa

    move-wide/from16 v18, v5

    const/4 v5, 0x1

    const/16 v6, 0x14

    invoke-static {v2, v14, v1, v5, v6}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result v1

    .line 120
    invoke-static {v2}, Le/e/a/ScrollingComments267;->shorts(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v6

    goto :goto_3

    :cond_4
    move v6, v13

    :goto_3
    int-to-float v6, v6

    const/high16 v14, 0x41600000    # 14.0f

    div-float/2addr v6, v14

    .line 121
    invoke-static {v2}, Le/e/a/CommentOptions;->size(Landroid/content/Context;)I

    move-result v14

    int-to-float v14, v14

    mul-float/2addr v6, v14

    const/high16 v31, 0x42c80000    # 100.0f

    div-float v6, v6, v31

    .line 122
    move/from16 v17, v13

    iget-object v13, v8, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget-object v14, v8, Le/e/a/ScrollingComments267$State;->waiting:Ljava/util/ArrayDeque;

    move/from16 v16, v12

    move-object/from16 v20, v14

    move-wide/from16 v37, v18

    move/from16 v18, v6

    move/from16 v19, v15

    move-wide/from16 v14, v37

    move/from16 v6, v22

    invoke-virtual/range {v13 .. v20}, Le/e/a/ScrollingTimeline267;->resizeViewport(JIIFFLjava/util/ArrayDeque;)V

    .line 123
    move/from16 p0, v1

    move/from16 v13, v17

    move/from16 v32, v18

    move-object v14, v2

    move-wide/from16 v1, v37

    move/from16 v15, v19

    iget-object v5, v8, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    invoke-virtual {v5, v1, v2, v6, v15}, Le/e/a/ScrollingTimeline267;->frame(JFF)V

    .line 124
    invoke-static {v14}, Le/e/a/CommentOptions;->opacity(Landroid/content/Context;)I

    move-result v5

    int-to-float v5, v5

    const/high16 v17, 0x437f0000    # 255.0f

    mul-float v5, v5, v17

    div-float v5, v5, v31

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 125
    invoke-static {v14}, Le/e/a/CommentOptions;->shadow(Landroid/content/Context;)F

    move-result v17

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->density:F

    mul-float v7, v7, v17

    .line 126
    invoke-static {v14}, Le/e/a/ScrollingComments267;->shadowMode(Landroid/content/Context;)I

    move-result v14

    .line 127
    if-nez v14, :cond_5

    const/high16 v17, 0x3f000000    # 0.5f

    mul-float v17, v17, v7

    add-float v17, v17, v21

    goto :goto_4

    :cond_5
    add-float v17, v7, v21

    :goto_4
    move/from16 v31, v17

    .line 129
    if-lez v12, :cond_17

    if-lez v13, :cond_17

    .line 130
    move/from16 v17, v11

    move/from16 v18, v12

    iget-wide v11, v10, Le/e/a/ScrollingComments267$Channel;->generation:J

    cmp-long v11, v11, v1

    if-eqz v11, :cond_6

    const/16 v19, 0x1

    goto :goto_5

    :cond_6
    const/16 v19, 0x0

    .line 131
    :goto_5
    if-eqz v19, :cond_7

    .line 132
    const/high16 v11, 0x7f800000    # Float.POSITIVE_INFINITY

    iput v11, v10, Le/e/a/ScrollingComments267$Channel;->previousVideo:F

    .line 133
    iget-object v11, v10, Le/e/a/ScrollingComments267$Channel;->hidden:Ljava/util/ArrayDeque;

    invoke-virtual {v11}, Ljava/util/ArrayDeque;->clear()V

    .line 134
    iget-object v11, v10, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    invoke-virtual {v11}, Ljava/util/ArrayDeque;->clear()V

    .line 135
    iput-wide v1, v10, Le/e/a/ScrollingComments267$Channel;->generation:J

    goto :goto_6

    .line 136
    :cond_7
    if-eqz v23, :cond_8

    .line 137
    iget-object v11, v10, Le/e/a/ScrollingComments267$Channel;->hidden:Ljava/util/ArrayDeque;

    invoke-virtual {v11}, Ljava/util/ArrayDeque;->clear()V

    .line 140
    iget-object v11, v10, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    invoke-virtual {v11}, Ljava/util/ArrayDeque;->clear()V

    .line 142
    :cond_8
    :goto_6
    iget-object v11, v8, Le/e/a/ScrollingComments267$State;->waiting:Ljava/util/ArrayDeque;

    invoke-virtual {v11}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_9

    .line 145
    move-object/from16 v16, v9

    const/4 v11, 0x1

    iget-object v9, v8, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    move-object v12, v10

    iget-object v10, v8, Le/e/a/ScrollingComments267$State;->waiting:Ljava/util/ArrayDeque;

    move-wide/from16 v20, v1

    move v1, v11

    move-object v2, v12

    move v4, v14

    move/from16 v11, v17

    move/from16 v12, v18

    move/from16 v14, p0

    invoke-virtual/range {v9 .. v16}, Le/e/a/ScrollingTimeline267;->showWaiting(Ljava/util/ArrayDeque;ZIIIFLe/e/a/ScrollingTimeline267$FrameBudget;)V

    move/from16 v33, v12

    move/from16 v34, v13

    move/from16 v36, v14

    move-object/from16 v35, v16

    goto :goto_7

    .line 142
    :cond_9
    move/from16 v36, p0

    move-wide/from16 v20, v1

    move-object/from16 v35, v9

    move-object v2, v10

    move/from16 v34, v13

    move v4, v14

    move/from16 v11, v17

    move/from16 v33, v18

    const/4 v1, 0x1

    .line 147
    :goto_7
    iget-object v9, v8, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget v9, v9, Le/e/a/ScrollingTimeline267;->origin:F

    int-to-float v10, v3

    mul-float v12, v10, v0

    sub-float v12, v6, v12

    invoke-static {v9, v12}, Ljava/lang/Math;->min(FF)F

    move-result v9

    .line 148
    iget-object v12, v2, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    invoke-virtual {v12}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v12

    .line 149
    xor-int/2addr v12, v1

    iget-object v13, v2, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    invoke-virtual {v13}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_e

    .line 150
    move/from16 v16, v19

    move-wide/from16 v18, v20

    move/from16 v20, v23

    invoke-virtual/range {v35 .. v35}, Le/e/a/ScrollingTimeline267$FrameBudget;->remaining()I

    move-result v23

    .line 151
    if-lez v23, :cond_a

    move v12, v1

    goto :goto_8

    :cond_a
    const/4 v12, 0x0

    .line 152
    :goto_8
    if-nez v16, :cond_b

    if-nez v20, :cond_b

    invoke-virtual/range {v30 .. v30}, Le/e/a/CommentSource280;->hasBatch()Z

    move-result v13

    if-nez v13, :cond_c

    .line 153
    :cond_b
    iput v6, v2, Le/e/a/ScrollingComments267$Channel;->batchVideo:F

    .line 154
    iput v15, v2, Le/e/a/ScrollingComments267$Channel;->batchVisual:F

    .line 155
    iget v13, v2, Le/e/a/ScrollingComments267$Channel;->previousVideo:F

    iput v13, v2, Le/e/a/ScrollingComments267$Channel;->batchPreviousVideo:F

    .line 156
    iput v0, v2, Le/e/a/ScrollingComments267$Channel;->batchRate:F

    .line 157
    iput v3, v2, Le/e/a/ScrollingComments267$Channel;->batchDuration:I

    .line 159
    :cond_c
    move/from16 v22, v6

    move/from16 v21, v9

    move-object/from16 v17, v30

    invoke-virtual/range {v17 .. v23}, Le/e/a/CommentSource280;->due(JZFFI)V

    .line 160
    move-object/from16 v9, v17

    const/4 v13, 0x0

    :goto_9
    iget-object v14, v9, Le/e/a/CommentSource280;->due:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-ge v13, v14, :cond_d

    .line 161
    iget-object v14, v2, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    iget-object v1, v9, Le/e/a/CommentSource280;->due:Ljava/util/ArrayList;

    invoke-virtual {v1, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CommentSource280$Item;

    invoke-virtual {v14, v1}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 160
    add-int/lit8 v13, v13, 0x1

    const/4 v1, 0x1

    goto :goto_9

    :cond_d
    move v1, v12

    goto :goto_a

    .line 149
    :cond_e
    move-object/from16 v9, v30

    move v1, v12

    .line 164
    :goto_a
    iget-object v12, v2, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    invoke-virtual {v12}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_12

    invoke-virtual/range {v35 .. v35}, Le/e/a/ScrollingTimeline267$FrameBudget;->take()Z

    move-result v12

    if-eqz v12, :cond_12

    .line 165
    iget-object v12, v2, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    invoke-virtual {v12}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Le/e/a/CommentSource280$Item;

    .line 168
    iget v13, v2, Le/e/a/ScrollingComments267$Channel;->batchVideo:F

    iget v14, v12, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float v14, v14

    sub-float/2addr v13, v14

    iget v14, v2, Le/e/a/ScrollingComments267$Channel;->batchRate:F

    div-float/2addr v13, v14

    iget v14, v2, Le/e/a/ScrollingComments267$Channel;->batchDuration:I

    int-to-float v14, v14

    cmpl-float v13, v13, v14

    if-ltz v13, :cond_f

    iget v13, v12, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float v13, v13

    iget-object v14, v8, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget v14, v14, Le/e/a/ScrollingTimeline267;->origin:F

    cmpg-float v13, v13, v14

    if-gez v13, :cond_f

    .line 169
    move/from16 v20, v0

    move/from16 v17, v3

    move-object v0, v9

    move/from16 v21, v10

    move/from16 v16, v31

    move/from16 v12, v33

    move/from16 v13, v34

    move/from16 v14, v36

    goto/16 :goto_b

    .line 170
    :cond_f
    iget-object v13, v12, Le/e/a/CommentSource280$Item;->comment:Le/e/a/q;

    iget-boolean v13, v13, Le/e/a/q;->o:Z

    if-eqz v13, :cond_11

    .line 171
    iget v13, v12, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float v13, v13

    sub-float v22, v6, v13

    div-float v22, v22, v0

    cmpg-float v13, v22, v10

    if-gez v13, :cond_10

    iget-object v13, v2, Le/e/a/ScrollingComments267$Channel;->hidden:Ljava/util/ArrayDeque;

    invoke-virtual {v13, v12}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    :cond_10
    move/from16 v20, v0

    move/from16 v17, v3

    move-object v0, v9

    move/from16 v21, v10

    move/from16 v16, v31

    move/from16 v12, v33

    move/from16 v13, v34

    move/from16 v14, v36

    goto :goto_b

    .line 174
    :cond_11
    iget v13, v12, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float v13, v13

    move/from16 v17, v11

    iget v11, v2, Le/e/a/ScrollingComments267$Channel;->batchPreviousVideo:F

    move-object v14, v12

    iget v12, v2, Le/e/a/ScrollingComments267$Channel;->batchVideo:F

    move/from16 v16, v10

    move v10, v13

    iget v13, v2, Le/e/a/ScrollingComments267$Channel;->batchVisual:F

    move/from16 v18, v15

    iget v15, v2, Le/e/a/ScrollingComments267$Channel;->batchRate:F

    move/from16 v20, v0

    iget v0, v2, Le/e/a/ScrollingComments267$Channel;->batchDuration:I

    int-to-float v0, v0

    move/from16 v21, v16

    move/from16 v16, v0

    move-object v0, v9

    move/from16 v9, v17

    move-object/from16 v17, v14

    move/from16 v14, v18

    invoke-static/range {v9 .. v16}, Le/e/a/ScrollingTimeline267;->admissionStart(ZFFFFFFF)F

    move-result v19

    .line 177
    move v11, v9

    move v15, v14

    move-object v9, v2

    move/from16 v18, v15

    move-object/from16 v10, v17

    move/from16 v16, v31

    move/from16 v15, v32

    move/from16 v12, v33

    move/from16 v13, v34

    move/from16 v14, v36

    move/from16 v17, v3

    invoke-static/range {v8 .. v19}, Le/e/a/ScrollingComments267;->admit(Le/e/a/ScrollingComments267$State;Le/e/a/ScrollingComments267$Channel;Le/e/a/CommentSource280$Item;ZIIIFFIFF)V

    .line 179
    move/from16 v15, v18

    .line 164
    :goto_b
    move-object v9, v0

    move/from16 v33, v12

    move/from16 v34, v13

    move/from16 v36, v14

    move/from16 v31, v16

    move/from16 v3, v17

    move/from16 v0, v20

    move/from16 v10, v21

    goto/16 :goto_a

    :cond_12
    move/from16 v20, v0

    move/from16 v17, v3

    move-object v0, v9

    move/from16 v21, v10

    move/from16 v16, v31

    move/from16 v12, v33

    move/from16 v13, v34

    move/from16 v14, v36

    .line 181
    iget-object v3, v2, Le/e/a/ScrollingComments267$Channel;->hidden:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    const/16 v9, 0x10

    invoke-virtual/range {v35 .. v35}, Le/e/a/ScrollingTimeline267$FrameBudget;->remaining()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v3, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 182
    const/4 v9, 0x0

    :goto_c
    if-ge v9, v3, :cond_15

    invoke-virtual/range {v35 .. v35}, Le/e/a/ScrollingTimeline267$FrameBudget;->take()Z

    move-result v10

    if-eqz v10, :cond_15

    .line 183
    iget-object v10, v2, Le/e/a/ScrollingComments267$Channel;->hidden:Ljava/util/ArrayDeque;

    invoke-virtual {v10}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Le/e/a/CommentSource280$Item;

    .line 184
    move/from16 v22, v1

    iget v1, v10, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float v1, v1

    sub-float v1, v6, v1

    div-float v1, v1, v20

    cmpl-float v1, v1, v21

    if-ltz v1, :cond_13

    move v1, v9

    goto :goto_d

    .line 185
    :cond_13
    iget-object v1, v10, Le/e/a/CommentSource280$Item;->comment:Le/e/a/q;

    iget-boolean v1, v1, Le/e/a/q;->o:Z

    if-eqz v1, :cond_14

    iget-object v1, v2, Le/e/a/ScrollingComments267$Channel;->hidden:Ljava/util/ArrayDeque;

    invoke-virtual {v1, v10}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    move v1, v9

    goto :goto_d

    .line 186
    :cond_14
    move/from16 v19, v15

    move v1, v9

    move/from16 v18, v15

    move/from16 v15, v32

    move-object v9, v2

    invoke-static/range {v8 .. v19}, Le/e/a/ScrollingComments267;->admit(Le/e/a/ScrollingComments267$State;Le/e/a/ScrollingComments267$Channel;Le/e/a/CommentSource280$Item;ZIIIFFIFF)V

    move/from16 v15, v18

    .line 182
    :goto_d
    add-int/lit8 v9, v1, 0x1

    move/from16 v1, v22

    goto :goto_c

    :cond_15
    move/from16 v22, v1

    .line 189
    iget-object v9, v8, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget-object v10, v8, Le/e/a/ScrollingComments267$State;->waiting:Ljava/util/ArrayDeque;

    move-object/from16 v16, v35

    invoke-virtual/range {v9 .. v16}, Le/e/a/ScrollingTimeline267;->showWaiting(Ljava/util/ArrayDeque;ZIIIFLe/e/a/ScrollingTimeline267$FrameBudget;)V

    .line 190
    move v3, v11

    move v1, v12

    if-eqz v22, :cond_18

    iget-object v6, v2, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    invoke-virtual {v6}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_18

    invoke-virtual {v0}, Le/e/a/CommentSource280;->hasBatch()Z

    move-result v6

    if-nez v6, :cond_18

    .line 191
    iget v6, v2, Le/e/a/ScrollingComments267$Channel;->previousVideo:F

    invoke-static {v6}, Ljava/lang/Float;->isFinite(F)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 192
    iget v6, v2, Le/e/a/ScrollingComments267$Channel;->previousVideo:F

    goto :goto_e

    :cond_16
    iget v6, v2, Le/e/a/ScrollingComments267$Channel;->batchVideo:F

    .line 193
    :goto_e
    iget v9, v2, Le/e/a/ScrollingComments267$Channel;->batchVideo:F

    invoke-static {v6, v9}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, v2, Le/e/a/ScrollingComments267$Channel;->previousVideo:F

    goto :goto_f

    .line 129
    :cond_17
    move-object v2, v10

    move v3, v11

    move v1, v12

    move v4, v14

    move-object/from16 v0, v30

    .line 197
    :cond_18
    :goto_f
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v9

    add-long v26, v26, v28

    sub-long v16, v9, v26

    .line 198
    iget-object v6, v8, Le/e/a/ScrollingComments267$State;->fill:Landroid/graphics/Paint;

    .line 199
    const/high16 v9, -0x1000000

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-ne v4, v11, :cond_19

    cmpl-float v12, v7, v10

    if-lez v12, :cond_19

    invoke-virtual {v6, v7, v10, v10, v9}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_10

    .line 200
    :cond_19
    invoke-virtual {v6}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 201
    :goto_10
    if-nez v4, :cond_1a

    cmpl-float v4, v7, v10

    if-lez v4, :cond_1a

    move v13, v11

    goto :goto_11

    :cond_1a
    const/4 v13, 0x0

    .line 202
    :goto_11
    if-eqz v13, :cond_1b

    .line 203
    iget-object v4, v8, Le/e/a/ScrollingComments267$State;->outline:Landroid/graphics/Paint;

    .line 204
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 205
    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 206
    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 207
    invoke-virtual {v4, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 208
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 210
    :cond_1b
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v18

    .line 211
    iget-object v4, v8, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget-object v4, v4, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    .line 212
    const/4 v6, 0x0

    :goto_12
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v6, v9, :cond_1d

    .line 213
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object v10, v9

    check-cast v10, Le/e/a/ScrollingTimeline267$Entry;

    .line 214
    invoke-virtual {v10, v15}, Le/e/a/ScrollingTimeline267$Entry;->left(F)F

    move-result v11

    .line 215
    iget-object v9, v10, Le/e/a/ScrollingTimeline267$Entry;->channel:Ljava/lang/Object;

    if-ne v9, v2, :cond_1c

    iget v9, v10, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    sub-float v9, v11, v9

    int-to-float v12, v1

    cmpg-float v9, v9, v12

    if-gez v9, :cond_1c

    .line 216
    move-object/from16 v9, p1

    move v12, v5

    invoke-static/range {v8 .. v13}, Le/e/a/ScrollingComments267;->drawEntry(Le/e/a/ScrollingComments267$State;Landroid/graphics/Canvas;Le/e/a/ScrollingTimeline267$Entry;FIZ)V

    goto :goto_13

    .line 215
    :cond_1c
    move v12, v5

    .line 212
    :goto_13
    add-int/lit8 v6, v6, 0x1

    move v5, v12

    goto :goto_12

    .line 219
    :cond_1d
    const/high16 v1, 0x40000000    # 2.0f

    add-float/2addr v7, v1

    move-object/from16 v9, p1

    move/from16 v4, p3

    invoke-static {v9, v3, v4, v15, v7}, Le/e/a/FixedCommentCollision;->begin(Landroid/graphics/Canvas;ZZFF)V

    .line 220
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 221
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    sub-long v12, v6, v18

    .line 220
    move-object v1, v8

    move-wide/from16 v10, v16

    move-wide/from16 v6, v24

    move-wide/from16 v8, v28

    invoke-static/range {v1 .. v13}, Le/e/a/ScrollingComments267;->recordFrame(Le/e/a/ScrollingComments267$State;Le/e/a/ScrollingComments267$Channel;ZZIJJJJ)V

    .line 222
    iget-object v0, v0, Le/e/a/CommentSource280;->fixed:Ljava/util/ArrayList;

    return-object v0

    .line 87
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method private static drawEntry(Le/e/a/ScrollingComments267$State;Landroid/graphics/Canvas;Le/e/a/ScrollingTimeline267$Entry;FIZ)V
    .registers 13

    .line 388
    iget v0, p2, Le/e/a/ScrollingTimeline267$Entry;->baseline:F

    .line 389
    iget-object v6, p0, Le/e/a/ScrollingComments267$State;->fill:Landroid/graphics/Paint;

    .line 390
    iget v1, p2, Le/e/a/ScrollingTimeline267$Entry;->size:F

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 391
    iget v1, p2, Le/e/a/ScrollingTimeline267$Entry;->color:I

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 392
    invoke-virtual {v6, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 393
    iget-object v5, p0, Le/e/a/ScrollingComments267$State;->outline:Landroid/graphics/Paint;

    .line 394
    if-eqz p5, :cond_0

    iget p0, p2, Le/e/a/ScrollingTimeline267$Entry;->size:F

    invoke-virtual {v5, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 395
    :cond_0
    iget-object p0, p2, Le/e/a/ScrollingTimeline267$Entry;->lines:[Ljava/lang/String;

    array-length p4, p0

    const/4 v1, 0x0

    move v4, v0

    move v0, v1

    :goto_0
    if-ge v0, p4, :cond_2

    aget-object v2, p0, v0

    .line 396
    if-eqz p5, :cond_1

    move-object v1, p1

    move v3, p3

    invoke-static/range {v1 .. v6}, Le/e/a/CommentOutlineOpacity;->drawLive(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/graphics/Paint;)V

    goto :goto_1

    .line 397
    :cond_1
    move-object v1, p1

    move v3, p3

    invoke-virtual {v1, v2, v3, v4, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 398
    :goto_1
    iget p1, p2, Le/e/a/ScrollingTimeline267$Entry;->size:F

    const p3, 0x3f933333    # 1.15f

    mul-float/2addr p1, p3

    add-float/2addr v4, p1

    .line 395
    add-int/lit8 v0, v0, 0x1

    move-object p1, v1

    move p3, v3

    goto :goto_0

    .line 400
    :cond_2
    return-void
.end method

.method public static fixedContext(Ljava/lang/ThreadLocal;)Landroid/content/Context;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ThreadLocal<",
            "*>;)",
            "Landroid/content/Context;"
        }
    .end annotation

    .line 71
    sget-object p0, Le/e/a/ScrollingComments267;->CONTEXT:Ljava/lang/ThreadLocal;

    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p0

    .line 72
    instance-of v0, p0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 73
    :cond_0
    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    .line 74
    instance-of v0, p0, Landroid/content/Context;

    if-eqz v0, :cond_1

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    :cond_1
    return-object v1
.end method

.method private static isPopup(Ljava/lang/Object;)Z
    .registers 2

    .line 383
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "u"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static percentile([IF)I
    .registers 11

    .line 315
    nop

    .line 316
    array-length v0, p0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    move-wide v5, v1

    move v4, v3

    :goto_0
    if-ge v4, v0, :cond_0

    aget v7, p0, v4

    int-to-long v7, v7

    add-long/2addr v5, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 317
    :cond_0
    cmp-long v0, v5, v1

    if-nez v0, :cond_1

    return v3

    .line 318
    :cond_1
    long-to-float v0, v5

    mul-float/2addr v0, p1

    float-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-long v4, v4

    .line 319
    nop

    .line 320
    nop

    :goto_1
    array-length p1, p0

    if-ge v3, p1, :cond_3

    .line 321
    aget p1, p0, v3

    int-to-long v6, p1

    add-long/2addr v1, v6

    .line 322
    cmp-long p1, v1, v4

    if-ltz p1, :cond_2

    return v3

    .line 320
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 324
    :cond_3
    array-length p0, p0

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method private static recordFrame(Le/e/a/ScrollingComments267$State;Le/e/a/ScrollingComments267$Channel;ZZIJJJJ)V
    .registers 39

    .line 230
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, p5

    move-wide/from16 v4, p7

    move-wide/from16 v6, p9

    move-wide/from16 v8, p11

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    .line 231
    iget-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->windowStartedNs:J

    const-wide/16 v14, 0x0

    cmp-long v12, v12, v14

    if-nez v12, :cond_0

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->windowStartedNs:J

    .line 232
    :cond_0
    iget-boolean v12, v1, Le/e/a/ScrollingComments267$Channel;->tracedCaller:Z

    const-string v13, "secondary"

    const-string v16, "primary"

    move-wide/from16 v17, v14

    const-string v14, "nicoid-comment-perf"

    const/4 v15, 0x1

    if-nez v12, :cond_2

    .line 233
    iput-boolean v15, v1, Le/e/a/ScrollingComments267$Channel;->tracedCaller:Z

    .line 234
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v19, v15

    const-string v15, "callback-path thread="

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 235
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v15, " channel="

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 236
    if-eqz p3, :cond_1

    move-object v15, v13

    goto :goto_0

    :cond_1
    move-object/from16 v15, v16

    :goto_0
    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v15, " stack="

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {}, Le/e/a/ScrollingComments267;->callerPath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 234
    invoke-static {v14, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 232
    :cond_2
    move/from16 v19, v15

    .line 238
    :goto_1
    move-object v15, v13

    iget-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->lastDrawEndNs:J

    cmp-long v12, v12, v17

    move/from16 v20, v12

    if-eqz v20, :cond_4

    const-wide/16 v20, 0x1

    iget-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->lastDrawEndNs:J

    cmp-long v12, v2, v12

    if-ltz v12, :cond_3

    .line 239
    iget-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->lastDrawEndNs:J

    sub-long v12, v2, v12

    .line 240
    move-object/from16 v22, v14

    move-object/from16 v23, v15

    iget-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->outsideNs:J

    add-long/2addr v14, v12

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->outsideNs:J

    .line 241
    iget-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->outsideMaxNs:J

    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    iput-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->outsideMaxNs:J

    .line 242
    iget-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->outsideSamples:J

    add-long v12, v12, v20

    iput-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->outsideSamples:J

    goto :goto_2

    .line 238
    :cond_3
    move-object/from16 v22, v14

    move-object/from16 v23, v15

    goto :goto_2

    :cond_4
    move-object/from16 v22, v14

    move-object/from16 v23, v15

    const-wide/16 v20, 0x1

    .line 244
    :goto_2
    iget-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->lastFrameNs:J

    cmp-long v12, v12, v17

    if-lez v12, :cond_5

    .line 245
    iget-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->lastFrameNs:J

    sub-long v12, v2, v12

    move-wide/from16 v14, v17

    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    .line 246
    const-wide/32 v14, 0xf4240

    div-long v14, v12, v14

    move-wide/from16 v24, v10

    const-wide/16 v10, 0x64

    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    long-to-int v10, v10

    .line 247
    iget-object v11, v1, Le/e/a/ScrollingComments267$Channel;->intervalMs:[I

    aget v14, v11, v10

    add-int/lit8 v14, v14, 0x1

    aput v14, v11, v10

    .line 248
    iget-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->longestGapNs:J

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    iput-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->longestGapNs:J

    .line 249
    const-wide/32 v10, 0x2faf080

    cmp-long v10, v12, v10

    if-lez v10, :cond_6

    iget-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->longGaps:J

    add-long v10, v10, v20

    iput-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->longGaps:J

    goto :goto_3

    .line 244
    :cond_5
    move-wide/from16 v24, v10

    .line 251
    :cond_6
    :goto_3
    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->lastFrameNs:J

    .line 252
    iget-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->frames:J

    add-long v10, v10, v20

    iput-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->frames:J

    .line 253
    sub-long v10, v24, v2

    const-wide/16 v14, 0x0

    invoke-static {v14, v15, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 254
    iget-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->renderNs:J

    add-long/2addr v10, v2

    iput-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->renderNs:J

    .line 255
    iget-wide v10, v1, Le/e/a/ScrollingComments267$Channel;->renderMaxNs:J

    invoke-static {v10, v11, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->renderMaxNs:J

    .line 256
    iget-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->scanNs:J

    add-long/2addr v2, v4

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->scanNs:J

    .line 257
    iget-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->scanMaxNs:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->scanMaxNs:J

    .line 258
    iget-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->admitNs:J

    add-long/2addr v2, v6

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->admitNs:J

    .line 259
    iget-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->admitMaxNs:J

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->admitMaxNs:J

    .line 260
    iget-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->glyphNs:J

    add-long/2addr v2, v8

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->glyphNs:J

    .line 261
    iget-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->glyphMaxNs:J

    invoke-static {v2, v3, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->glyphMaxNs:J

    .line 262
    move-wide/from16 v2, v24

    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->lastDrawEndNs:J

    .line 263
    iget-wide v4, v1, Le/e/a/ScrollingComments267$Channel;->windowStartedNs:J

    sub-long v10, v2, v4

    const-wide v4, 0x2540be400L

    cmp-long v4, v10, v4

    if-gez v4, :cond_7

    return-void

    .line 264
    :cond_7
    iget-wide v4, v1, Le/e/a/ScrollingComments267$Channel;->frames:J

    move-wide/from16 v6, v20

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 265
    iget-wide v6, v1, Le/e/a/ScrollingComments267$Channel;->windowStartedNs:J

    sub-long v10, v2, v6

    long-to-float v6, v10

    const v7, 0x4e6e6b28    # 1.0E9f

    div-float/2addr v6, v7

    const v7, 0x3a83126f    # 0.001f

    invoke-static {v7, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 266
    iget-object v7, v0, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget-wide v7, v7, Le/e/a/ScrollingTimeline267;->skippedByOverlap:J

    .line 267
    iget-object v9, v0, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget-wide v9, v9, Le/e/a/ScrollingTimeline267;->shownFromWaiting:J

    .line 268
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "draw-callback fps="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-wide v12, v1, Le/e/a/ScrollingComments267$Channel;->frames:J

    long-to-float v12, v12

    div-float/2addr v12, v6

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " mode="

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 269
    if-eqz p3, :cond_8

    move-object/from16 v13, v23

    goto :goto_4

    :cond_8
    move-object/from16 v13, v16

    :goto_4
    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " overlap="

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v11, p2

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " source="

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v11, p4

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " active="

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v11, v0, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    iget-object v11, v11, Le/e/a/ScrollingTimeline267;->active:Ljava/util/ArrayList;

    .line 271
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " pending="

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v11, v1, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    .line 272
    invoke-virtual {v11}, Ljava/util/ArrayDeque;->size()I

    move-result v11

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " waiting="

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v11, v0, Le/e/a/ScrollingComments267$State;->waiting:Ljava/util/ArrayDeque;

    invoke-virtual {v11}, Ljava/util/ArrayDeque;->size()I

    move-result v11

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " outsideAvgMs="

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->outsideNs:J

    iget-wide v13, v1, Le/e/a/ScrollingComments267$Channel;->outsideSamples:J

    .line 273
    move-wide/from16 p5, v4

    const-wide/16 v4, 0x1

    invoke-static {v4, v5, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    div-long/2addr v11, v4

    long-to-float v4, v11

    const v5, 0x49742400    # 1000000.0f

    div-float/2addr v4, v5

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " outsideMaxMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->outsideMaxNs:J

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " admitAvgMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->admitNs:J

    div-long v11, v11, p5

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " admitMaxMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->admitMaxNs:J

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " glyphAvgMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->glyphNs:J

    div-long v11, v11, p5

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " glyphMaxMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->glyphMaxNs:J

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " scanAvgMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->scanNs:J

    div-long v11, v11, p5

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " scanMaxMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->scanMaxNs:J

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " drawAvgMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->renderNs:J

    div-long v11, v11, p5

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " drawMaxMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->renderMaxNs:J

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " intervalP95Ms="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Le/e/a/ScrollingComments267$Channel;->intervalMs:[I

    .line 283
    const v11, 0x3f733333    # 0.95f

    invoke-static {v6, v11}, Le/e/a/ScrollingComments267;->percentile([IF)I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " intervalP99Ms="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Le/e/a/ScrollingComments267$Channel;->intervalMs:[I

    .line 284
    const v11, 0x3f7d70a4    # 0.99f

    invoke-static {v6, v11}, Le/e/a/ScrollingComments267;->percentile([IF)I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " gapMaxMs="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v11, v1, Le/e/a/ScrollingComments267$Channel;->longestGapNs:J

    long-to-float v6, v11

    div-float/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " gapsOver50ms="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v1, Le/e/a/ScrollingComments267$Channel;->longGaps:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " skippedOverlapRendererDelta="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v0, Le/e/a/ScrollingComments267$State;->previousSkipped:J

    sub-long v5, v7, v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " startedFromWaiting="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v0, Le/e/a/ScrollingComments267$State;->previousShown:J

    sub-long v5, v9, v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 268
    move-object/from16 v5, v22

    invoke-static {v5, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    iput-wide v7, v0, Le/e/a/ScrollingComments267$State;->previousSkipped:J

    .line 290
    iput-wide v9, v0, Le/e/a/ScrollingComments267$State;->previousShown:J

    .line 291
    iput-wide v2, v1, Le/e/a/ScrollingComments267$Channel;->windowStartedNs:J

    .line 292
    const-wide/16 v14, 0x0

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->scanNs:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->renderMaxNs:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->renderNs:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->frames:J

    .line 293
    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->longGaps:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->longestGapNs:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->scanMaxNs:J

    .line 294
    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->outsideSamples:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->outsideMaxNs:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->outsideNs:J

    .line 295
    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->glyphMaxNs:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->glyphNs:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->admitMaxNs:J

    iput-wide v14, v1, Le/e/a/ScrollingComments267$Channel;->admitNs:J

    .line 296
    iget-object v0, v1, Le/e/a/ScrollingComments267$Channel;->intervalMs:[I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 297
    return-void
.end method

.method private static shadowMode(Landroid/content/Context;)I
    .registers 3

    .line 363
    :try_start_0
    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "comment_shadow"

    const-string v1, "0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 364
    :catch_0
    move-exception p0

    .line 365
    const/4 p0, 0x0

    return p0
.end method

.method private static shorts(Landroid/content/Context;)Z
    .registers 3

    .line 370
    nop

    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 371
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 372
    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    .line 373
    if-eqz p0, :cond_0

    const-string v0, "nicoid_re_shorts"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 375
    :cond_1
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 376
    if-ne v0, p0, :cond_2

    goto :goto_1

    .line 377
    :cond_2
    nop

    .line 378
    move-object p0, v0

    goto :goto_0

    .line 379
    :cond_3
    :goto_1
    return v1
.end method
