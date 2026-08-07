.class public final synthetic Ll/mwh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/VerificationToken;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mwh0;->a:Lcom/p1/mobile/putong/data/VerificationToken;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwh0;->a:Lcom/p1/mobile/putong/data/VerificationToken;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/wwh0;->e(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/VerificationToken;

    move-result-object p0

    return-object p0
.end method
