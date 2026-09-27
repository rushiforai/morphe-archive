.class final Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;
.super Ljava/lang/Object;
.source "CaptionPlayerTransitionGuard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Probe"
.end annotation


# instance fields
.field final delayedOverlayRestore:Z

.field frames:I

.field previous:Landroid/graphics/Rect;

.field sawMotion:Z

.field stableFrames:I

.field final targetType:Ljava/lang/String;

.field final token:J


# direct methods
.method constructor <init>(JLjava/lang/String;Z)V
    .registers 5

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->token:J

    .line 201
    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->targetType:Ljava/lang/String;

    .line 202
    iput-boolean p4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->delayedOverlayRestore:Z

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 207
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->token:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->-$$Nest$sfgetgeneration()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_b

    return-void

    .line 208
    :cond_b
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->-$$Nest$sfgetactivityRef()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 209
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->-$$Nest$smdecor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v1

    if-eqz v0, :cond_73

    if-nez v1, :cond_1e

    goto :goto_73

    .line 215
    :cond_1e
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->-$$Nest$smreadPlayerRect(Landroid/app/Activity;)Landroid/graphics/Rect;

    move-result-object v0

    .line 216
    iget v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->frames:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->frames:I

    const/4 v2, 0x0

    if-eqz v0, :cond_40

    .line 217
    iget-object v4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->previous:Landroid/graphics/Rect;

    if-eqz v4, :cond_40

    .line 218
    invoke-static {v4, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->-$$Nest$smnearlySame(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 219
    iget v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->stableFrames:I

    add-int/2addr v2, v3

    iput v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->stableFrames:I

    goto :goto_42

    .line 221
    :cond_3b
    iput-boolean v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->sawMotion:Z

    .line 222
    iput v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->stableFrames:I

    goto :goto_42

    .line 225
    :cond_40
    iput v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->stableFrames:I

    :goto_42
    if-nez v0, :cond_46

    const/4 v0, 0x0

    goto :goto_4c

    .line 227
    :cond_46
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    move-object v0, v2

    :goto_4c
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->previous:Landroid/graphics/Rect;

    .line 229
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->frames:I

    const/4 v2, 0x6

    if-lt v0, v2, :cond_61

    .line 230
    iget v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->stableFrames:I

    const/4 v3, 0x4

    if-lt v2, v3, :cond_61

    iget-boolean v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->sawMotion:Z

    if-nez v2, :cond_65

    const/16 v2, 0xc

    if-lt v0, v2, :cond_61

    goto :goto_65

    :cond_61
    const/16 v2, 0x2a

    if-lt v0, v2, :cond_6f

    .line 233
    :cond_65
    :goto_65
    iget-wide v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->token:J

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->targetType:Ljava/lang/String;

    iget-boolean p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->delayedOverlayRestore:Z

    invoke-static {v1, v2, v3, p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->-$$Nest$smfinish(JLjava/lang/String;ZI)V

    return-void

    .line 236
    :cond_6f
    invoke-virtual {v1, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    .line 211
    :cond_73
    :goto_73
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->token:J

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->targetType:Ljava/lang/String;

    iget-boolean v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->delayedOverlayRestore:Z

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;->frames:I

    invoke-static {v0, v1, v2, v3, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->-$$Nest$smfinish(JLjava/lang/String;ZI)V

    return-void
.end method
