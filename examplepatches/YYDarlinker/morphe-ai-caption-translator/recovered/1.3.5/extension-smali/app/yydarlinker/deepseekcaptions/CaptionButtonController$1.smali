.class Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$1;
.super Ljava/lang/Object;
.source "CaptionButtonController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 93
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 94
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$sfgetnativeMenuUntilMs()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-gtz v2, :cond_59

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$sfgetnativeMenuSelectionArmed()Z

    move-result v2

    if-nez v2, :cond_19

    .line 95
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$smisNativeTrackSelectedForCurrentVideo()Z

    move-result v2

    if-nez v2, :cond_19

    goto :goto_59

    .line 98
    :cond_19
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$sfgettransitionQuietUntilMs()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-ltz v2, :cond_38

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$sfgetignoreUiStateUntilMs()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_38

    .line 99
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$smresolveCaptionButtonForNativeMenu()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_38

    .line 100
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_38

    .line 101
    :try_start_35
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$smsyncNativeCaptionState(Landroid/view/View;)V
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_38

    .line 104
    :catchall_38
    :cond_38
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$sfgetnativeMenuUntilMs()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_59

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$sfgetnativeMenuSelectionArmed()Z

    move-result v0

    if-nez v0, :cond_50

    .line 105
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$smisNativeTrackSelectedForCurrentVideo()Z

    move-result v0

    if-eqz v0, :cond_59

    .line 106
    :cond_50
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->-$$Nest$sfgetMAIN()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0xa0

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_59
    :goto_59
    return-void
.end method
