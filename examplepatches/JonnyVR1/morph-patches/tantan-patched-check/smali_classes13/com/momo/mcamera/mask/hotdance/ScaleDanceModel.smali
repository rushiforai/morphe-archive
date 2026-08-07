.class public Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;
.super Lcom/momo/mcamera/mask/hotdance/DanceModel;
.source "SourceFile"


# instance fields
.field public repeatCount:I


# direct methods
.method public constructor <init>(FFFFFFIJ)V
    .locals 9

    .line 1
    move-object v0, p0

    .line 2
    move v1, p1

    .line 3
    move v2, p2

    .line 4
    move v3, p3

    .line 5
    move v4, p4

    .line 6
    move v5, p5

    .line 7
    move v6, p6

    .line 8
    move-wide/from16 v7, p8

    .line 9
    .line 10
    invoke-direct/range {v0 .. v8}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 11
    .line 12
    .line 13
    move/from16 p1, p7

    .line 14
    .line 15
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;->repeatCount:I

    .line 16
    .line 17
    return-void
.end method
