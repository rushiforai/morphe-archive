.class public final synthetic Ll/b9n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;

.field public final synthetic b:Ll/yql;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b9n0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;

    iput-object p2, p0, Ll/b9n0;->b:Ll/yql;

    iput-object p3, p0, Ll/b9n0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b9n0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;

    iget-object v1, p0, Ll/b9n0;->b:Ll/yql;

    iget-object p0, p0, Ll/b9n0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->i0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
