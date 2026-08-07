.class public final synthetic Ll/vzy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vzy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    iput-object p2, p0, Ll/vzy;->b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vzy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    iget-object p0, p0, Ll/vzy;->b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->D(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method
