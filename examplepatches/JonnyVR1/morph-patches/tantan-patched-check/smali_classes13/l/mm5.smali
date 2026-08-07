.class public final synthetic Ll/mm5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/account_core/request_data/ApplyData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/account_core/request_data/ApplyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mm5;->a:Lcom/p1/mobile/account_core/request_data/ApplyData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mm5;->a:Lcom/p1/mobile/account_core/request_data/ApplyData;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    invoke-static {p0, p1}, Ll/cn5;->m(Lcom/p1/mobile/account_core/request_data/ApplyData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V

    return-void
.end method
