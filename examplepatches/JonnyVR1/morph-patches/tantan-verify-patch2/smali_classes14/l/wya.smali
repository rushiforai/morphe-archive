.class public final synthetic Ll/wya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cza;

.field public final synthetic b:Z

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/cza;ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wya;->a:Ll/cza;

    iput-boolean p2, p0, Ll/wya;->b:Z

    iput-object p3, p0, Ll/wya;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wya;->a:Ll/cza;

    iget-boolean v1, p0, Ll/wya;->b:Z

    iget-object p0, p0, Ll/wya;->c:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;

    invoke-static {v0, v1, p0, p1}, Ll/cza;->e3(Ll/cza;ZLl/x20;Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
