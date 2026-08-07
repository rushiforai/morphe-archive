.class public final synthetic Ll/v0n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/a1n0;


# direct methods
.method public synthetic constructor <init>(Ll/a1n0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v0n0;->a:Ll/a1n0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v0n0;->a:Ll/a1n0;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;

    invoke-static {p0, p1}, Ll/a1n0;->K3(Ll/a1n0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
