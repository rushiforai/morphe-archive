.class public final synthetic Ll/oms;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nns;


# direct methods
.method public synthetic constructor <init>(Ll/nns;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oms;->a:Ll/nns;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oms;->a:Ll/nns;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-static {p0, p1}, Ll/nns;->X2(Ll/nns;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
