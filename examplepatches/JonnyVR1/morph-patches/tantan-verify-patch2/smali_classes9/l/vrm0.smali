.class public final synthetic Ll/vrm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/csm0;

.field public final synthetic b:Ll/a5s;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;


# direct methods
.method public synthetic constructor <init>(Ll/csm0;Ll/a5s;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vrm0;->a:Ll/csm0;

    iput-object p2, p0, Ll/vrm0;->b:Ll/a5s;

    iput-object p3, p0, Ll/vrm0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vrm0;->a:Ll/csm0;

    iget-object v1, p0, Ll/vrm0;->b:Ll/a5s;

    iget-object p0, p0, Ll/vrm0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, v1, p0, p1}, Ll/csm0;->S4(Ll/csm0;Ll/a5s;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
