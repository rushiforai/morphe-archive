.class public final synthetic Ll/fom;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Lcom/p1/mobile/putong/newui/main/base/TabName;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;


# direct methods
.method public synthetic constructor <init>(JLcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/fom;->a:J

    iput-object p3, p0, Ll/fom;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    iput-object p4, p0, Ll/fom;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/fom;->a:J

    iget-object v2, p0, Ll/fom;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    iget-object p0, p0, Ll/fom;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;->n(JLcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;Ljava/lang/Long;)V

    return-void
.end method
