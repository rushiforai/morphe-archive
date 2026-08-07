.class public final synthetic Ll/et10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/st10;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;


# direct methods
.method public synthetic constructor <init>(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/et10;->a:Ll/st10;

    iput-object p2, p0, Ll/et10;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/et10;->a:Ll/st10;

    iget-object p0, p0, Ll/et10;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/st10;->P3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;Ljava/lang/Long;)V

    return-void
.end method
