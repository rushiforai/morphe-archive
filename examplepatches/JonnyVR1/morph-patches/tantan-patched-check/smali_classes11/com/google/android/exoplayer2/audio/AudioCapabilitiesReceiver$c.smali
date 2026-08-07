.class public final Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver$c;
.super Landroid/media/AudioDeviceCallback;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x17
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver$c;->a:Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/AudioDeviceCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver$c;-><init>(Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;)V

    return-void
.end method


# virtual methods
.method public onAudioDevicesAdded([Landroid/media/AudioDeviceInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver$c;->a:Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;->b(Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/ha1;->c(Landroid/content/Context;)Ll/ha1;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;->a(Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;Ll/ha1;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onAudioDevicesRemoved([Landroid/media/AudioDeviceInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver$c;->a:Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;->b(Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/ha1;->c(Landroid/content/Context;)Ll/ha1;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;->a(Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;Ll/ha1;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
