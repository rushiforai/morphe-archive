.class public final synthetic Ll/zky;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bly;


# direct methods
.method public synthetic constructor <init>(Ll/bly;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zky;->a:Ll/bly;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zky;->a:Ll/bly;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;

    invoke-static {p0, p1}, Ll/bly;->b4(Ll/bly;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V

    return-void
.end method
