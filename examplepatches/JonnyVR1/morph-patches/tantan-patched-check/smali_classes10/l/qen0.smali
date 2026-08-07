.class public final synthetic Ll/qen0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ten0;


# direct methods
.method public synthetic constructor <init>(Ll/ten0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qen0;->a:Ll/ten0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qen0;->a:Ll/ten0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;

    invoke-static {p0, p1}, Ll/ten0;->R3(Ll/ten0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V

    return-void
.end method
