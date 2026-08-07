.class public final synthetic Ll/pu70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pu70;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pu70;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;)V

    return-void
.end method
