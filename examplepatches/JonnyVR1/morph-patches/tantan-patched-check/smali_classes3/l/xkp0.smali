.class public final synthetic Ll/xkp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/clp0;


# direct methods
.method public synthetic constructor <init>(Ll/clp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xkp0;->a:Ll/clp0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xkp0;->a:Ll/clp0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$GiftWallRefresh;

    invoke-static {p0, p1}, Ll/clp0;->T3(Ll/clp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$GiftWallRefresh;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
