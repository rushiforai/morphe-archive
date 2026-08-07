.class public final synthetic Ll/ihv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ihv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ihv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;

    invoke-static {p0, p1}, Ll/aiv;->e0(Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
