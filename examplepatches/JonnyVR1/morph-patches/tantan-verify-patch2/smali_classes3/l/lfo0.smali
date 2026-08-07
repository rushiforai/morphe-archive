.class public final synthetic Ll/lfo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qfo0;


# direct methods
.method public synthetic constructor <init>(Ll/qfo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lfo0;->a:Ll/qfo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfo0;->a:Ll/qfo0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {p0, p1}, Ll/qfo0;->L3(Ll/qfo0;Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;)V

    return-void
.end method
