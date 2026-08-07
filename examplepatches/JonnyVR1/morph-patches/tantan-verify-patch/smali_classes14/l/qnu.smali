.class public final synthetic Ll/qnu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uxj;


# direct methods
.method public synthetic constructor <init>(Ll/uxj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qnu;->a:Ll/uxj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qnu;->a:Ll/uxj;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    invoke-static {p0, p1}, Ll/xnu;->h(Ll/uxj;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;)Ll/xxj;

    move-result-object p0

    return-object p0
.end method
