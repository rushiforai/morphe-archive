.class Lcom/immomo/momomediaext/MMLiveEngine$s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/f5m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/momo/piplineext/bean/MMLiveSubtitleState;Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Lcom/immomo/momomediaext/MMLiveEngine$s$b;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveEngine$s$b;-><init>(Lcom/immomo/momomediaext/MMLiveEngine$s;Lcom/momo/piplineext/bean/MMLiveSubtitleState;Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b(Ll/inw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Lcom/immomo/momomediaext/MMLiveEngine$s$a;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine$s$a;-><init>(Lcom/immomo/momomediaext/MMLiveEngine$s;Ll/inw;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method
