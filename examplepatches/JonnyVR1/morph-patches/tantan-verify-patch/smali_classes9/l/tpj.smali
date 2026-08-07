.class public final synthetic Ll/tpj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vpj;


# direct methods
.method public synthetic constructor <init>(Ll/vpj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tpj;->a:Ll/vpj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tpj;->a:Ll/vpj;

    check-cast p1, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshGiftTabBalanceMsg;

    invoke-static {p0, p1}, Ll/vpj;->M3(Ll/vpj;Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshGiftTabBalanceMsg;)V

    return-void
.end method
