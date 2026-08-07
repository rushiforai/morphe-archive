.class public final synthetic Ll/kiv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qiv;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/qiv;Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kiv;->a:Ll/qiv;

    iput-object p2, p0, Ll/kiv;->b:Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;

    iput-object p3, p0, Ll/kiv;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kiv;->a:Ll/qiv;

    iget-object v1, p0, Ll/kiv;->b:Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;

    iget-object p0, p0, Ll/kiv;->c:Ll/y20;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/qiv;->O3(Ll/qiv;Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;Ll/y20;Ljava/lang/String;)V

    return-void
.end method
