.class public final synthetic Ll/amj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/amj0;->a:Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/amj0;->a:Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    invoke-static {p0, p1}, Ll/gmj0;->Y(Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
