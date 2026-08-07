.class public final synthetic Ll/nxj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;

.field public final synthetic b:Ll/bnl0$g;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;Ll/bnl0$g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nxj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;

    iput-object p2, p0, Ll/nxj;->b:Ll/bnl0$g;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nxj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;

    iget-object p0, p0, Ll/nxj;->b:Ll/bnl0$g;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->s0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;Ll/bnl0$g;)V

    return-void
.end method
