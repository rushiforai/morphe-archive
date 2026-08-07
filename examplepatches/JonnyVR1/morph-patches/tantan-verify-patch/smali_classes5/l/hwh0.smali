.class public final synthetic Ll/hwh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hwh0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/hwh0;->b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hwh0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/hwh0;->b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    invoke-static {v0, p0}, Ll/wwh0;->l(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
