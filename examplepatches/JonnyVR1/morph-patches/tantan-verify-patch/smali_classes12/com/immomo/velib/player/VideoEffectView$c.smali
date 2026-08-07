.class Lcom/immomo/velib/player/VideoEffectView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/d$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/velib/player/VideoEffectView;->openVideo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/velib/player/VideoEffectView;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/player/VideoEffectView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/VideoEffectView$c;->a:Lcom/immomo/velib/player/VideoEffectView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(Lcom/immomo/velib/player/d;ILjava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView$c;->a:Lcom/immomo/velib/player/VideoEffectView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/velib/player/VideoEffectView;->onPlayerError(Lcom/immomo/velib/player/d;ILjava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
