.class public final synthetic Ll/bb20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bb20;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bb20;->a:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;

    invoke-static {p0, p1}, Ll/cb20;->J(Ljava/util/List;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V

    return-void
.end method
