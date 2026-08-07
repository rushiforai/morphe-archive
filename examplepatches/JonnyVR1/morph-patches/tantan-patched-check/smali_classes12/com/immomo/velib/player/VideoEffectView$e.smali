.class Lcom/immomo/velib/player/VideoEffectView$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/d$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/velib/player/VideoEffectView;->openVideoAsync()V
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
    iput-object p1, p0, Lcom/immomo/velib/player/VideoEffectView$e;->a:Lcom/immomo/velib/player/VideoEffectView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView$e;->a:Lcom/immomo/velib/player/VideoEffectView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/velib/player/VideoEffectView;->access$000(Lcom/immomo/velib/player/VideoEffectView;)Lcom/immomo/velib/player/e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/immomo/velib/player/VideoEffectView$e;->a:Lcom/immomo/velib/player/VideoEffectView;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/e;->d(Lcom/immomo/velib/player/d;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView$e;->a:Lcom/immomo/velib/player/VideoEffectView;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/immomo/velib/player/VideoEffectView;->access$200(Lcom/immomo/velib/player/VideoEffectView;)Lcom/immomo/velib/player/b;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/immomo/velib/player/VideoEffectView$e;->a:Lcom/immomo/velib/player/VideoEffectView;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/immomo/velib/player/VideoEffectView;->access$100(Lcom/immomo/velib/player/VideoEffectView;)Lcom/immomo/velib/player/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView$e;->a:Lcom/immomo/velib/player/VideoEffectView;

    .line 27
    .line 28
    invoke-virtual {v0, v1, p0}, Lcom/immomo/velib/player/b;->g(Lcom/immomo/velib/player/a;Ll/dam;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method
