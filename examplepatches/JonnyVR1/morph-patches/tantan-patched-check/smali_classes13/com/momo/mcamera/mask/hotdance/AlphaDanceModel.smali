.class public Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;
.super Lcom/momo/mcamera/mask/hotdance/DanceModel;
.source "SourceFile"


# instance fields
.field public endAlpha:F

.field public flash:Z

.field public repeatCount:I

.field public startAlpha:F


# direct methods
.method public constructor <init>(FFFFFFFFZIJ)V
    .locals 9

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move-wide/from16 v7, p11

    .line 1
    invoke-direct/range {v0 .. v8}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    move/from16 p1, p7

    .line 2
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;->startAlpha:F

    move/from16 p1, p8

    .line 3
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;->endAlpha:F

    move/from16 p1, p9

    .line 4
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;->flash:Z

    move/from16 p1, p10

    .line 5
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;->repeatCount:I

    return-void
.end method
