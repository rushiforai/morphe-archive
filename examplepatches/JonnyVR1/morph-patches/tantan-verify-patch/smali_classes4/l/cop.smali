.class public final synthetic Ll/cop;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cop;->a:Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cop;->a:Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;

    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->i0(Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;)V

    return-void
.end method
