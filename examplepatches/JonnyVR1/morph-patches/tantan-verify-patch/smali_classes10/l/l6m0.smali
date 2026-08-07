.class public final synthetic Ll/l6m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/w6m0;


# direct methods
.method public synthetic constructor <init>(Ll/w6m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l6m0;->a:Ll/w6m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l6m0;->a:Ll/w6m0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/w6m0;->z4(Ll/w6m0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
