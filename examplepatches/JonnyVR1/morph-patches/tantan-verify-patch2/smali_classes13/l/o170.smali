.class public final synthetic Ll/o170;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/account_phone/data/PhoneSignupData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/account_phone/data/PhoneSignupData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o170;->a:Lcom/p1/mobile/account_phone/data/PhoneSignupData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o170;->a:Lcom/p1/mobile/account_phone/data/PhoneSignupData;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    invoke-static {p0, p1}, Ll/b270;->L(Lcom/p1/mobile/account_phone/data/PhoneSignupData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V

    return-void
.end method
