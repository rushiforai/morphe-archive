.class public final synthetic Ll/tb1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/AudioPlayer;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/media/AudioPlayer;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tb1;->a:Lcom/p1/mobile/android/media/AudioPlayer;

    iput p2, p0, Ll/tb1;->b:I

    return-void
.end method


# virtual methods
.method public final onPrepared(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tb1;->a:Lcom/p1/mobile/android/media/AudioPlayer;

    iget p0, p0, Ll/tb1;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/android/media/AudioPlayer;->a(Lcom/p1/mobile/android/media/AudioPlayer;ILandroid/media/MediaPlayer;)V

    return-void
.end method
