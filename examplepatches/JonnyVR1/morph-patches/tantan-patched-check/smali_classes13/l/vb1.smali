.class public final synthetic Ll/vb1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/AudioPlayer;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/media/AudioPlayer;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vb1;->a:Lcom/p1/mobile/android/media/AudioPlayer;

    iput-object p2, p0, Ll/vb1;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onError(Landroid/media/MediaPlayer;II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vb1;->a:Lcom/p1/mobile/android/media/AudioPlayer;

    iget-object p0, p0, Ll/vb1;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/android/media/AudioPlayer;->c(Lcom/p1/mobile/android/media/AudioPlayer;Ljava/lang/String;Landroid/media/MediaPlayer;II)Z

    move-result p0

    return p0
.end method
