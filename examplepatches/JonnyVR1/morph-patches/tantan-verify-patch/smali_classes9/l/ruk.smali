.class public final synthetic Ll/ruk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Ll/yuk;


# direct methods
.method public synthetic constructor <init>(Ll/yuk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ruk;->a:Ll/yuk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ruk;->a:Ll/yuk;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    invoke-static {p0, p1, p2}, Ll/yuk;->V3(Ll/yuk;Lcom/p1/mobile/putong/live/base/data/BLiveData;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ll/lsw;

    move-result-object p0

    return-object p0
.end method
