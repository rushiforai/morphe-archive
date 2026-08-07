.class public final synthetic Ll/tzy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

.field public final synthetic c:D


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tzy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    iput-object p2, p0, Ll/tzy;->b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    iput-wide p3, p0, Ll/tzy;->c:D

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tzy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    iget-object v1, p0, Ll/tzy;->b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    iget-wide v2, p0, Ll/tzy;->c:D

    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->n(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    return-void
.end method
