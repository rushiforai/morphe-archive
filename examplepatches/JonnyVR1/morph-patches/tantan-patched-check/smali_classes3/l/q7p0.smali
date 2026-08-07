.class public final synthetic Ll/q7p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/v7p0;


# direct methods
.method public synthetic constructor <init>(Ll/v7p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q7p0;->a:Ll/v7p0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7p0;->a:Ll/v7p0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;

    invoke-static {p0, p1}, Ll/v7p0;->s4(Ll/v7p0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
