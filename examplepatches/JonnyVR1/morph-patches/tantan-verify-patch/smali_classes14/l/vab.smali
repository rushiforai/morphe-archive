.class public final synthetic Ll/vab;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xab;


# direct methods
.method public synthetic constructor <init>(Ll/xab;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vab;->a:Ll/xab;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vab;->a:Ll/xab;

    check-cast p1, Lcom/p1/mobile/putong/data/OMSConfigEnvelope;

    invoke-static {p0, p1}, Ll/xab;->b3(Ll/xab;Lcom/p1/mobile/putong/data/OMSConfigEnvelope;)V

    return-void
.end method
