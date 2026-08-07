.class public final synthetic Ll/wc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/api/a;

.field public final synthetic b:Ll/pcj;

.field public final synthetic c:Lcom/p1/mobile/putong/data/VerifyData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/api/a;Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wc;->a:Lcom/p1/mobile/putong/account/api/a;

    iput-object p2, p0, Ll/wc;->b:Ll/pcj;

    iput-object p3, p0, Ll/wc;->c:Lcom/p1/mobile/putong/data/VerifyData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wc;->a:Lcom/p1/mobile/putong/account/api/a;

    iget-object v1, p0, Ll/wc;->b:Ll/pcj;

    iget-object p0, p0, Ll/wc;->c:Lcom/p1/mobile/putong/data/VerifyData;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/account/api/a;->H(Lcom/p1/mobile/putong/account/api/a;Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
