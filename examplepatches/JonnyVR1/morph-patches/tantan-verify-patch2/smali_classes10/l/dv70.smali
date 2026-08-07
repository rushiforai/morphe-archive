.class public final synthetic Ll/dv70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/gv70;


# direct methods
.method public synthetic constructor <init>(Ll/gv70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dv70;->a:Ll/gv70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dv70;->a:Ll/gv70;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    invoke-static {p0, p1}, Ll/gv70;->J3(Ll/gv70;Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
