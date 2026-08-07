.class public final synthetic Ll/zwh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerificationToken;

.field public final synthetic c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zwh0;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/zwh0;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    iput-object p3, p0, Ll/zwh0;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zwh0;->a:Landroid/content/Context;

    iget-object v1, p0, Ll/zwh0;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    iget-object p0, p0, Ll/zwh0;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->e(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
