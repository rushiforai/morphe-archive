.class public final synthetic Ll/bxh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bxh0;->a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bxh0;->a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    check-cast p1, Lcom/p1/mobile/putong/data/VerificationToken;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->g(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;)V

    return-void
.end method
