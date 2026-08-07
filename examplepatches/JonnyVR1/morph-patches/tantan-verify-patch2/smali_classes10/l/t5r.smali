.class public final synthetic Ll/t5r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v5r;


# direct methods
.method public synthetic constructor <init>(Ll/v5r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5r;->a:Ll/v5r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t5r;->a:Ll/v5r;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/v5r;->K3(Ll/v5r;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
