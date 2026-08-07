.class public final synthetic Ll/zur;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/avr;


# direct methods
.method public synthetic constructor <init>(Ll/avr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zur;->a:Ll/avr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zur;->a:Ll/avr;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {p0, p1}, Ll/avr;->S3(Ll/avr;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V

    return-void
.end method
