.class public final synthetic Ll/yya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cza;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/z20;


# direct methods
.method public synthetic constructor <init>(Ll/cza;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yya;->a:Ll/cza;

    iput-object p2, p0, Ll/yya;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/yya;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/yya;->d:Ll/z20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yya;->a:Ll/cza;

    iget-object v1, p0, Ll/yya;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/yya;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/yya;->d:Ll/z20;

    check-cast p1, Lcom/p1/mobile/putong/core/data/SpotLightForceMatchEnvelope;

    invoke-static {v0, v1, v2, p0, p1}, Ll/cza;->i3(Ll/cza;Ljava/lang/String;Ljava/lang/String;Ll/z20;Lcom/p1/mobile/putong/core/data/SpotLightForceMatchEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
