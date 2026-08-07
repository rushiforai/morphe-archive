.class public Lcom/core/glcore/util/ImageFrame$MMFormat;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/core/glcore/util/ImageFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MMFormat"
.end annotation


# static fields
.field public static final FMT_BGR:I = 0x18

.field public static final FMT_BGRA:I = 0x5

.field public static final FMT_NONE:I = 0x0

.field public static final FMT_NV12:I = 0x12

.field public static final FMT_NV21:I = 0x11

.field public static final FMT_RGB:I = 0x19

.field public static final FMT_RGBA:I = 0x4


# instance fields
.field final synthetic this$0:Lcom/core/glcore/util/ImageFrame;


# direct methods
.method public constructor <init>(Lcom/core/glcore/util/ImageFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/ImageFrame$MMFormat;->this$0:Lcom/core/glcore/util/ImageFrame;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
