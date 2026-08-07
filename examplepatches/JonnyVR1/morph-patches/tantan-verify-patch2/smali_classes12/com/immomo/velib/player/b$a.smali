.class Lcom/immomo/velib/player/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/velib/player/b;->e(Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/velib/anim/model/VideoEffectModel;

.field final synthetic b:Ll/dam;

.field final synthetic c:Lcom/immomo/velib/player/b;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/b$a;->c:Lcom/immomo/velib/player/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/velib/player/b$a;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/velib/player/b$a;->b:Ll/dam;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/b$a;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getElements()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    const/16 v2, 0x10

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 12
    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/immomo/velib/player/b$a;->c:Lcom/immomo/velib/player/b;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/immomo/velib/player/b$a;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 25
    .line 26
    invoke-static {v1, v2, v0}, Lcom/immomo/velib/player/b;->a(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    :cond_0
    iget-object p0, p0, Lcom/immomo/velib/player/b$a;->b:Ll/dam;

    .line 31
    .line 32
    invoke-interface {p0, v1}, Ll/dam;->onEffectElementComplete(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
