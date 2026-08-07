.class public final synthetic Ll/fvv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mvv;

.field public final synthetic b:Ll/bkg;


# direct methods
.method public synthetic constructor <init>(Ll/mvv;Ll/bkg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fvv;->a:Ll/mvv;

    iput-object p2, p0, Ll/fvv;->b:Ll/bkg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fvv;->a:Ll/mvv;

    iget-object p0, p0, Ll/fvv;->b:Ll/bkg;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    invoke-static {v0, p0, p1}, Ll/mvv;->I4(Ll/mvv;Ll/bkg;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V

    return-void
.end method
