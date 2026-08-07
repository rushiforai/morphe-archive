.class public final synthetic Ll/ho2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/oo2;

.field public final synthetic b:Ll/uxj;


# direct methods
.method public synthetic constructor <init>(Ll/oo2;Ll/uxj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ho2;->a:Ll/oo2;

    iput-object p2, p0, Ll/ho2;->b:Ll/uxj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ho2;->a:Ll/oo2;

    iget-object p0, p0, Ll/ho2;->b:Ll/uxj;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    invoke-static {v0, p0, p1}, Ll/oo2;->K(Ll/oo2;Ll/uxj;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;)Ll/xxj;

    move-result-object p0

    return-object p0
.end method
