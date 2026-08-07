.class public final synthetic Ll/z39;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/PushMessageCustom;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/PushMessageCustom;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z39;->a:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iput-boolean p2, p0, Ll/z39;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z39;->a:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-boolean p0, p0, Ll/z39;->b:Z

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/f49;->d3(Lcom/p1/mobile/putong/data/PushMessageCustom;ZLl/pf60;)Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    move-result-object p0

    return-object p0
.end method
