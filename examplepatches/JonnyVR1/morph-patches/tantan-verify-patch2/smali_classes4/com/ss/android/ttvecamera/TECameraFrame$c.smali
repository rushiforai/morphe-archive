.class public Lcom/ss/android/ttvecamera/TECameraFrame$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/TECameraFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:Lcom/ss/android/ttvecamera/TEFrameSizei;

.field public b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

.field public c:I

.field public d:I

.field public e:J

.field public f:I


# direct methods
.method public constructor <init>(IIJ)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-wide v3, p3

    .line 19
    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttvecamera/TECameraFrame$c;-><init>(IIJI)V

    return-void
.end method

.method public constructor <init>(IIJI)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->c:I

    .line 6
    .line 7
    new-instance v0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 8
    .line 9
    invoke-direct {v0, p1, p2}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->a:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 13
    .line 14
    iput-wide p3, p0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->e:J

    .line 15
    .line 16
    iput p5, p0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->f:I

    .line 17
    .line 18
    return-void
.end method
