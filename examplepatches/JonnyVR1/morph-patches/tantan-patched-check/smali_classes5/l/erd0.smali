.class public final synthetic Ll/erd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ltl$b;


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerificationToken;

.field public final synthetic c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;


# direct methods
.method public synthetic constructor <init>(Ll/gcg0;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/erd0;->a:Ll/gcg0;

    iput-object p2, p0, Ll/erd0;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    iput-object p3, p0, Ll/erd0;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    return-void
.end method


# virtual methods
.method public final a(Ll/kxf;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/erd0;->a:Ll/gcg0;

    iget-object v1, p0, Ll/erd0;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    iget-object p0, p0, Ll/erd0;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/facertification/RxFacertification;->c(Ll/gcg0;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ll/kxf;)V

    return-void
.end method
