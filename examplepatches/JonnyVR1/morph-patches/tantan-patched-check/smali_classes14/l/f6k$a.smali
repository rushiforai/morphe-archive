.class public Ll/f6k$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f6k;->b(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
        "Lcom/p1/mobile/account_core/reponse_data/Token;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/f6k;


# direct methods
.method public constructor <init>(Ll/f6k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f6k$a;->a:Ll/f6k;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 2
    .line 3
    invoke-static {p0}, Ll/awi0;->k(Lcom/p1/mobile/account_core/reponse_data/Data;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 9
    .line 10
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f6k$a;->a(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
