.class public final synthetic Ll/rya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cza;


# direct methods
.method public synthetic constructor <init>(Ll/cza;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rya;->a:Ll/cza;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rya;->a:Ll/cza;

    check-cast p1, Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;

    invoke-static {p0, p1}, Ll/cza;->n3(Ll/cza;Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
