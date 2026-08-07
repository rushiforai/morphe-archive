.class public final synthetic Ll/ub1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/AudioPlayer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/media/AudioPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ub1;->a:Lcom/p1/mobile/android/media/AudioPlayer;

    return-void
.end method


# virtual methods
.method public final onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ub1;->a:Lcom/p1/mobile/android/media/AudioPlayer;

    invoke-static {p0, p1}, Lcom/p1/mobile/android/media/AudioPlayer;->b(Lcom/p1/mobile/android/media/AudioPlayer;Landroid/media/MediaPlayer;)V

    return-void
.end method
