.class public final synthetic Ll/g2q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g2q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

    iput-wide p2, p0, Ll/g2q;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g2q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

    iget-wide v1, p0, Ll/g2q;->b:J

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;JLcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
