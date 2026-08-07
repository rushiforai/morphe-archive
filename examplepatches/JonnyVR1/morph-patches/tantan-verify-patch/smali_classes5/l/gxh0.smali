.class public final synthetic Ll/gxh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

.field public final synthetic b:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

.field public final synthetic c:Lcom/p1/mobile/putong/data/VerificationToken;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gxh0;->a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    iput-object p2, p0, Ll/gxh0;->b:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    iput-object p3, p0, Ll/gxh0;->c:Lcom/p1/mobile/putong/data/VerificationToken;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gxh0;->a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    iget-object v1, p0, Ll/gxh0;->b:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    iget-object p0, p0, Ll/gxh0;->c:Lcom/p1/mobile/putong/data/VerificationToken;

    check-cast p1, Ll/jxf;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->c(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;Ll/jxf;)V

    return-void
.end method
