.class public final synthetic Ll/pzt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rtr;


# direct methods
.method public synthetic constructor <init>(Ll/rtr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pzt;->a:Ll/rtr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzt;->a:Ll/rtr;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-virtual {p0, p1}, Ll/rtr;->s(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/rtr;

    move-result-object p0

    return-object p0
.end method
