.class public final synthetic Ll/kxy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kxy;->a:Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kxy;->a:Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;

    check-cast p1, Lcom/p1/mobile/android/media/AudioPlayer$State;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->a(Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;Lcom/p1/mobile/android/media/AudioPlayer$State;)V

    return-void
.end method
