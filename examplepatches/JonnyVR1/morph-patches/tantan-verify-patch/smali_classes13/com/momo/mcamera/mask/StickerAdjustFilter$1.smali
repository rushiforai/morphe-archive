.class Lcom/momo/mcamera/mask/StickerAdjustFilter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/StickerAdjustFilter;->startGestureDetect(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public gestureDetect(Lcom/core/glcore/cv/MMCVBoxes;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v0, v0

    .line 14
    if-lez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 17
    .line 18
    invoke-static {v0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$002(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/core/glcore/cv/MMCVBoxes;)Lcom/core/glcore/cv/MMCVBoxes;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    array-length v0, p1

    .line 26
    const/4 v1, 0x0

    .line 27
    :goto_0
    if-ge v1, v0, :cond_2

    .line 28
    .line 29
    aget-object v2, p1, v1

    .line 30
    .line 31
    iget-object v3, v2, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 32
    .line 33
    iget v2, v2, Lcom/momocv/MMBox;->class_index_:I

    .line 34
    .line 35
    if-lez v2, :cond_0

    .line 36
    .line 37
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_0

    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 44
    .line 45
    invoke-static {v2, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$100(Lcom/momo/mcamera/mask/StickerAdjustFilter;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$200(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$200(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-interface {v2, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;->gestureDetected(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    invoke-static {p1, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$002(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/core/glcore/cv/MMCVBoxes;)Lcom/core/glcore/cv/MMCVBoxes;

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 75
    .line 76
    invoke-static {p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$300(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    if-eqz p1, :cond_2

    .line 81
    .line 82
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 83
    .line 84
    invoke-static {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$300(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->gestureMiss()V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method
