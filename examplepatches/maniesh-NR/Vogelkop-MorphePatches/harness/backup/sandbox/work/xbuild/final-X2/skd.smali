.class public final Lskd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrjg;


# instance fields
.field public final synthetic a:Lcom/opera/android/media/MediaPlayerActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/media/MediaPlayerActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lskd;->a:Lcom/opera/android/media/MediaPlayerActivity;

    return-void
.end method


# virtual methods
.method public final d(Lsjg;)V
    .registers 2

    iget-object p0, p0, Lskd;->a:Lcom/opera/android/media/MediaPlayerActivity;

    iget-boolean p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->r:Z

    if-eqz p1, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void
.end method
