.class public final synthetic Ll/ql9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/rl9;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;


# direct methods
.method public synthetic constructor <init>(Ll/rl9;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ql9;->a:Ll/rl9;

    iput-object p2, p0, Ll/ql9;->b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ql9;->a:Ll/rl9;

    iget-object p0, p0, Ll/ql9;->b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    invoke-static {v0, p0}, Ll/rl9;->a3(Ll/rl9;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    return-void
.end method
