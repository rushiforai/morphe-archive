.class public final synthetic Ll/y9n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yql;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;


# direct methods
.method public synthetic constructor <init>(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y9n0;->a:Ll/yql;

    iput-object p2, p0, Ll/y9n0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    iput-object p3, p0, Ll/y9n0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y9n0;->a:Ll/yql;

    iget-object v1, p0, Ll/y9n0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    iget-object p0, p0, Ll/y9n0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->c(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V

    return-void
.end method
