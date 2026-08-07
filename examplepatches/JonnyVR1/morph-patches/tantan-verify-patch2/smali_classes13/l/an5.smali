.class public final synthetic Ll/an5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/an5;->a:Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/an5;->a:Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    invoke-static {p0, p1}, Ll/cn5;->e(Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V

    return-void
.end method
