.class public final synthetic Ll/r680;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r680;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r680;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    invoke-static {p0, p1}, Ll/s680;->R3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
