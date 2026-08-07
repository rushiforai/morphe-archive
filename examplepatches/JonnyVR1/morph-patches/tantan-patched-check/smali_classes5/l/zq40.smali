.class public final synthetic Ll/zq40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/quickaudio/NewVoiceCallFloatView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/quickaudio/NewVoiceCallFloatView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zq40;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/NewVoiceCallFloatView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zq40;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/NewVoiceCallFloatView;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/NewVoiceCallFloatView;->B(Lcom/p1/mobile/putong/core/ui/quickaudio/NewVoiceCallFloatView;J)V

    return-void
.end method
