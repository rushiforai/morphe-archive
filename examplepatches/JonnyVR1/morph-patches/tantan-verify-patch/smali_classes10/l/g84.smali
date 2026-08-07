.class public final synthetic Ll/g84;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h84;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

.field public final synthetic c:Ll/qvd;


# direct methods
.method public synthetic constructor <init>(Ll/h84;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Ll/qvd;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g84;->a:Ll/h84;

    iput-object p2, p0, Ll/g84;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    iput-object p3, p0, Ll/g84;->c:Ll/qvd;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g84;->a:Ll/h84;

    iget-object v1, p0, Ll/g84;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    iget-object p0, p0, Ll/g84;->c:Ll/qvd;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {v0, v1, p0, p1}, Ll/h84;->M3(Ll/h84;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Ll/qvd;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method
