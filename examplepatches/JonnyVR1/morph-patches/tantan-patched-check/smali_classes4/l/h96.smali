.class public final synthetic Ll/h96;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h96;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;

    iput-object p2, p0, Ll/h96;->b:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h96;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;

    iget-object p0, p0, Ll/h96;->b:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;Landroid/view/View;)V

    return-void
.end method
