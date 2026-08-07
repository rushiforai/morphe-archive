.class public final synthetic Ll/gep0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gep0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gep0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->i()V

    return-void
.end method
