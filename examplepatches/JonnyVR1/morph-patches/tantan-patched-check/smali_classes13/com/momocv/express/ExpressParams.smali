.class public Lcom/momocv/express/ExpressParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public eyes_switch_:Z

.field public head_switch_:Z

.field public mouth_switch_:Z

.field public neck_switch_:Z

.field public orig_face_rect_:[[F

.field public origin_landmarks96_:[[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/momocv/express/ExpressParams;->eyes_switch_:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momocv/express/ExpressParams;->mouth_switch_:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/momocv/express/ExpressParams;->head_switch_:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/momocv/express/ExpressParams;->neck_switch_:Z

    .line 12
    .line 13
    return-void
.end method
