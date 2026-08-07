.class public final synthetic Ll/ge00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/account_mobile/data/MobileSignupData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/account_mobile/data/MobileSignupData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ge00;->a:Lcom/p1/mobile/account_mobile/data/MobileSignupData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ge00;->a:Lcom/p1/mobile/account_mobile/data/MobileSignupData;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    invoke-static {p0, p1}, Ll/ie00;->y(Lcom/p1/mobile/account_mobile/data/MobileSignupData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V

    return-void
.end method
