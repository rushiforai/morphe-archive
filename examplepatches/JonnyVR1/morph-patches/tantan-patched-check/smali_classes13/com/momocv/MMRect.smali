.class public Lcom/momocv/MMRect;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public height_:I

.field public width_:I

.field public x_:I

.field public y_:I


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
    iput v0, p0, Lcom/momocv/MMRect;->x_:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/MMRect;->y_:I

    .line 8
    .line 9
    iput v0, p0, Lcom/momocv/MMRect;->width_:I

    .line 10
    .line 11
    iput v0, p0, Lcom/momocv/MMRect;->height_:I

    .line 12
    .line 13
    return-void
.end method
