.class public final synthetic Ll/cm10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dm10;


# direct methods
.method public synthetic constructor <init>(Ll/dm10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cm10;->a:Ll/dm10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cm10;->a:Ll/dm10;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;

    invoke-static {p0, p1}, Ll/dm10;->O3(Ll/dm10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;)V

    return-void
.end method
