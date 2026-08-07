.class public final synthetic Ll/ib80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ib80;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    iput-object p2, p0, Ll/ib80;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib80;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    iget-object p0, p0, Ll/ib80;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->k(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method
