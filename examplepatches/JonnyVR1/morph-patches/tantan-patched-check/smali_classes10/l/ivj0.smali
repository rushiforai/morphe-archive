.class public final synthetic Ll/ivj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jvj0;


# direct methods
.method public synthetic constructor <init>(Ll/jvj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ivj0;->a:Ll/jvj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivj0;->a:Ll/jvj0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    invoke-static {p0, p1}, Ll/jvj0;->W3(Ll/jvj0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V

    return-void
.end method
