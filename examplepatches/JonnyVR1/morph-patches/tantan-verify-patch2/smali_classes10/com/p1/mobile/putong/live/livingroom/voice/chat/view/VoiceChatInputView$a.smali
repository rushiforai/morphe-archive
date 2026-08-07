.class public Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->p(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)Ll/k8n0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$a;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->p(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)Ll/k8n0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/k8n0;->c4()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
