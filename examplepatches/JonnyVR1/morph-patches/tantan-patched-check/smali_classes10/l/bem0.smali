.class public final synthetic Ll/bem0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualVoiceWindowView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualVoiceWindowView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bem0;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualVoiceWindowView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bem0;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualVoiceWindowView;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualVoiceWindowView;->f(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualVoiceWindowView;II)V

    return-void
.end method
