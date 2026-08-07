.class public final synthetic Ll/yd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/api/a;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yd;->a:Lcom/p1/mobile/putong/account/api/a;

    iput-object p2, p0, Ll/yd;->b:Lcom/p1/mobile/putong/data/VerifyData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yd;->a:Lcom/p1/mobile/putong/account/api/a;

    iget-object p0, p0, Ll/yd;->b:Lcom/p1/mobile/putong/data/VerifyData;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/Token;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/api/a;->y(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
