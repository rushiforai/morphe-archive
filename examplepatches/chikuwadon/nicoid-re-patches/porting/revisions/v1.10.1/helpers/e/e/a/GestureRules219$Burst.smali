.class public final Le/e/a/GestureRules219$Burst;
.super Ljava/lang/Object;
.source "GestureRules219.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/GestureRules219;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Burst"
.end annotation


# instance fields
.field public lastBefore:J

.field public lastTarget:J

.field public lastTime:J

.field public side:I

.field public step:I

.field public total:J

.field public video:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;JJJII)J
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, p2

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move/from16 v8, p8

    move/from16 v9, p9

    .line 11
    iget-object v10, v0, Le/e/a/GestureRules219$Burst;->video:Ljava/lang/Object;

    if-eqz v10, :cond_30

    invoke-virtual {v10, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_30

    iget-wide v10, v0, Le/e/a/GestureRules219$Burst;->lastTime:J

    cmp-long v12, v2, v10

    if-ltz v12, :cond_30

    sub-long v10, v2, v10

    const-wide/16 v12, 0x5dc

    cmp-long v14, v10, v12

    if-gtz v14, :cond_30

    iget v10, v0, Le/e/a/GestureRules219$Burst;->side:I

    if-ne v10, v8, :cond_30

    iget v10, v0, Le/e/a/GestureRules219$Burst;->step:I

    if-ne v10, v9, :cond_30

    const/4 v10, 0x1

    goto :goto_31

    :cond_30
    const/4 v10, 0x0

    :goto_31
    sub-long v11, v6, v4

    if-eqz v10, :cond_53

    .line 13
    iget-wide v13, v0, Le/e/a/GestureRules219$Burst;->lastBefore:J

    cmp-long v15, v4, v13

    if-nez v15, :cond_53

    if-lez v8, :cond_48

    iget-wide v11, v0, Le/e/a/GestureRules219$Burst;->lastTarget:J

    sub-long v11, v6, v11

    const-wide/16 v13, 0x0

    invoke-static {v13, v14, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    goto :goto_55

    :cond_48
    const-wide/16 v13, 0x0

    iget-wide v11, v0, Le/e/a/GestureRules219$Burst;->lastTarget:J

    sub-long v11, v6, v11

    invoke-static {v13, v14, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v11

    goto :goto_55

    :cond_53
    const-wide/16 v13, 0x0

    :goto_55
    if-nez v10, :cond_59

    .line 14
    iput-wide v13, v0, Le/e/a/GestureRules219$Burst;->total:J

    .line 15
    :cond_59
    iget-wide v13, v0, Le/e/a/GestureRules219$Burst;->total:J

    add-long/2addr v13, v11

    iput-wide v13, v0, Le/e/a/GestureRules219$Burst;->total:J

    iput-object v1, v0, Le/e/a/GestureRules219$Burst;->video:Ljava/lang/Object;

    iput v8, v0, Le/e/a/GestureRules219$Burst;->side:I

    iput v9, v0, Le/e/a/GestureRules219$Burst;->step:I

    iput-wide v2, v0, Le/e/a/GestureRules219$Burst;->lastTime:J

    iput-wide v4, v0, Le/e/a/GestureRules219$Burst;->lastBefore:J

    iput-wide v6, v0, Le/e/a/GestureRules219$Burst;->lastTarget:J

    return-wide v13
.end method
