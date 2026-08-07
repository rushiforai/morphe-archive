.class public final synthetic Ll/crd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/VerificationToken;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Landroid/content/Context;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/crd0;->a:Lcom/p1/mobile/putong/data/VerificationToken;

    iput-object p2, p0, Ll/crd0;->b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    iput-object p3, p0, Ll/crd0;->c:Landroid/content/Context;

    iput-object p4, p0, Ll/crd0;->d:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/crd0;->a:Lcom/p1/mobile/putong/data/VerificationToken;

    iget-object v1, p0, Ll/crd0;->b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    iget-object v2, p0, Ll/crd0;->c:Landroid/content/Context;

    iget-object p0, p0, Ll/crd0;->d:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/facertification/RxFacertification;->b(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Landroid/content/Context;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ll/gcg0;)V

    return-void
.end method
