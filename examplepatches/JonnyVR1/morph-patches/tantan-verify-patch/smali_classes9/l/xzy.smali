.class public final synthetic Ll/xzy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xzy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    iput-object p2, p0, Ll/xzy;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/xzy;->c:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    iget-object v1, p0, Ll/xzy;->b:Landroid/content/Context;

    iget-object p0, p0, Ll/xzy;->c:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Landroid/view/View;)V

    return-void
.end method
