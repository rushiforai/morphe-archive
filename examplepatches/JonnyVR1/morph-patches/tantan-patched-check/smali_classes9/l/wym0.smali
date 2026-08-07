.class public final synthetic Ll/wym0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:F

.field public final synthetic d:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wym0;->a:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    iput-object p2, p0, Ll/wym0;->b:Landroid/view/View;

    iput p3, p0, Ll/wym0;->c:F

    iput p4, p0, Ll/wym0;->d:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wym0;->a:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    iget-object v1, p0, Ll/wym0;->b:Landroid/view/View;

    iget v2, p0, Ll/wym0;->c:F

    iget p0, p0, Ll/wym0;->d:F

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->h(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Landroid/view/View;FF)V

    return-void
.end method
