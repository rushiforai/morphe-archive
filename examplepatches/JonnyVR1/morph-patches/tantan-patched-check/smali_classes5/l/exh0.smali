.class public final synthetic Ll/exh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ll/ktl;

.field public final synthetic d:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Landroid/content/Context;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/exh0;->a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    iput-object p2, p0, Ll/exh0;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/exh0;->c:Ll/ktl;

    iput-object p4, p0, Ll/exh0;->d:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    iput-object p5, p0, Ll/exh0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/exh0;->f:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/exh0;->a:Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    iget-object v1, p0, Ll/exh0;->b:Landroid/content/Context;

    iget-object v2, p0, Ll/exh0;->c:Ll/ktl;

    iget-object v3, p0, Ll/exh0;->d:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    iget-object v4, p0, Ll/exh0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/exh0;->f:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/VerificationToken;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->i(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Landroid/content/Context;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/data/VerificationToken;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
