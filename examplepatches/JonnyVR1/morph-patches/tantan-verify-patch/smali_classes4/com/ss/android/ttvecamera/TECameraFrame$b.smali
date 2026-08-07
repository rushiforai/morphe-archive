.class public Lcom/ss/android/ttvecamera/TECameraFrame$b;
.super Lcom/ss/android/ttvecamera/TECameraFrame$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/TECameraFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private g:I

.field private h:[B


# direct methods
.method public constructor <init>(IIJ[BILcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V
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
    move v5, p8

    .line 6
    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttvecamera/TECameraFrame$c;-><init>(IIJI)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    iput p0, v0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->c:I

    .line 11
    .line 12
    iput p6, v0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->d:I

    .line 13
    .line 14
    iput-object p7, v0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 15
    .line 16
    iput-object p5, v0, Lcom/ss/android/ttvecamera/TECameraFrame$b;->h:[B

    .line 17
    .line 18
    mul-int p1, v1, v2

    .line 19
    .line 20
    mul-int/lit8 p1, p1, 0x4

    .line 21
    .line 22
    iput p1, v0, Lcom/ss/android/ttvecamera/TECameraFrame$b;->g:I

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$b;->h:[B

    .line 2
    .line 3
    return-object p0
.end method
