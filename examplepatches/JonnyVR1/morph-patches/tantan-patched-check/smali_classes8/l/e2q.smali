.class public final synthetic Ll/e2q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e2q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->d(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
