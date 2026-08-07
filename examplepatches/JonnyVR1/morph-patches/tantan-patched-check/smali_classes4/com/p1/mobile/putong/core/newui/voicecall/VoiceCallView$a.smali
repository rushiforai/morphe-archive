.class public Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;->a:Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;->a:Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->g(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;->a:Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method
