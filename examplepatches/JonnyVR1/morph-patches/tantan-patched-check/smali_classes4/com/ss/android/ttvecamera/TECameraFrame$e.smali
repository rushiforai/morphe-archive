.class public Lcom/ss/android/ttvecamera/TECameraFrame$e;
.super Lcom/ss/android/ttvecamera/TECameraFrame$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/TECameraFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field private g:I

.field h:[F


# direct methods
.method public constructor <init>(IIJII[FLcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V
    .locals 6

    .line 1
    move-object v0, p0

    .line 2
    move v1, p1

    .line 3
    move v2, p2

    .line 4
    move-wide v3, p3

    .line 5
    move v5, p9

    .line 6
    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttvecamera/TECameraFrame$c;-><init>(IIJI)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    iput p0, v0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->c:I

    .line 11
    .line 12
    iput p5, v0, Lcom/ss/android/ttvecamera/TECameraFrame$e;->g:I

    .line 13
    .line 14
    iput p6, v0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->d:I

    .line 15
    .line 16
    iput-object p7, v0, Lcom/ss/android/ttvecamera/TECameraFrame$e;->h:[F

    .line 17
    .line 18
    iput-object p8, v0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$e;->g:I

    .line 2
    .line 3
    return p0
.end method
