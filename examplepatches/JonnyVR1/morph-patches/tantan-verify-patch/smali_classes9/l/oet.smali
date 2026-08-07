.class public final synthetic Ll/oet;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pf60;


# direct methods
.method public synthetic constructor <init>(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oet;->a:Ll/pf60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oet;->a:Ll/pf60;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    invoke-static {p0, p1}, Ll/bft;->R3(Ll/pf60;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
