.class public final synthetic Ll/uld0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zld0;


# direct methods
.method public synthetic constructor <init>(Ll/zld0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uld0;->a:Ll/zld0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uld0;->a:Ll/zld0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;

    invoke-static {p0, p1}, Ll/zld0;->L3(Ll/zld0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)V

    return-void
.end method
