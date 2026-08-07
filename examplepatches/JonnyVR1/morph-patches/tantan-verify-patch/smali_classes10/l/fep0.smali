.class public final synthetic Ll/fep0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fep0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    iput-object p2, p0, Ll/fep0;->b:Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;

    iput-object p3, p0, Ll/fep0;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fep0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    iget-object v1, p0, Ll/fep0;->b:Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;

    iget-object p0, p0, Ll/fep0;->c:Landroid/view/View;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->b(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;Landroid/view/View;)V

    return-void
.end method
