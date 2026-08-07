.class public final synthetic Ll/mln0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nln0;


# direct methods
.method public synthetic constructor <init>(Ll/nln0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mln0;->a:Ll/nln0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mln0;->a:Ll/nln0;

    check-cast p1, Ll/x8k;

    invoke-static {p0, p1}, Ll/nln0;->K3(Ll/nln0;Ll/x8k;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    move-result-object p0

    return-object p0
.end method
