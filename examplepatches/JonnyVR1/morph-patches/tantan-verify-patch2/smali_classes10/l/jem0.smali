.class public final synthetic Ll/jem0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jem0;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jem0;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->g(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)Landroid/animation/AnimatorSet;

    move-result-object p0

    return-object p0
.end method
