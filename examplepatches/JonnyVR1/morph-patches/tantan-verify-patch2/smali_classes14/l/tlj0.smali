.class public final synthetic Ll/tlj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tlj0;->a:Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tlj0;->a:Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    invoke-static {p0, p1}, Ll/gmj0;->d0(Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
