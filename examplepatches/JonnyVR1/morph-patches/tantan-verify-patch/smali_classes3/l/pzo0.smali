.class public final synthetic Ll/pzo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rzo0;


# direct methods
.method public synthetic constructor <init>(Ll/rzo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pzo0;->a:Ll/rzo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzo0;->a:Ll/rzo0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {p0, p1}, Ll/rzo0;->T3(Ll/rzo0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V

    return-void
.end method
