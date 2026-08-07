.class Lcom/immomo/velib/player/c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/velib/player/c;->prepareAsync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/velib/player/c;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/player/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/c$a;->a:Lcom/immomo/velib/player/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/c$a;->a:Lcom/immomo/velib/player/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/velib/player/c;->v()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/velib/player/c$a;->a:Lcom/immomo/velib/player/c;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/immomo/velib/player/c;->o(Lcom/immomo/velib/player/c;)Lcom/immomo/velib/player/d$d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/immomo/velib/player/c$a;->a:Lcom/immomo/velib/player/c;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/immomo/velib/player/c;->o(Lcom/immomo/velib/player/c;)Lcom/immomo/velib/player/d$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Lcom/immomo/velib/player/d$d;->a()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
