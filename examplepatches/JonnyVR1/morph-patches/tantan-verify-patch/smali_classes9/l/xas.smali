.class public final synthetic Ll/xas;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/zas;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;


# direct methods
.method public synthetic constructor <init>(Ll/zas;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xas;->a:Ll/zas;

    iput-object p2, p0, Ll/xas;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xas;->a:Ll/zas;

    iget-object p0, p0, Ll/xas;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    check-cast p1, Ll/udl0;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    invoke-static {v0, p0, p1, p2}, Ll/zas;->e(Ll/zas;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ll/udl0;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method
