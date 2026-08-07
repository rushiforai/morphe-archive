.class public final synthetic Ll/go2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/oo2;


# direct methods
.method public synthetic constructor <init>(Ll/oo2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/go2;->a:Ll/oo2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/go2;->a:Ll/oo2;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;

    invoke-static {p0, p1}, Ll/oo2;->N(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
