.class public Ll/d0j0$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d0j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/d0j0;


# direct methods
.method public constructor <init>(Ll/d0j0;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d0j0$a;->a:Ll/d0j0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/d0j0$a;->a:Ll/d0j0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/d0j0;->m(Ll/d0j0;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/d0j0$a;->a:Ll/d0j0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/d0j0;->m(Ll/d0j0;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, -0x64

    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/d0j0;->n(Ll/d0j0;I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/d0j0$a;->a:Ll/d0j0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/d0j0;->x()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p1, p0, Ll/d0j0$a;->a:Ll/d0j0;

    .line 29
    .line 30
    invoke-static {p1}, Ll/d0j0;->m(Ll/d0j0;)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/d0j0$a;->a:Ll/d0j0;

    .line 37
    .line 38
    invoke-static {p1}, Ll/d0j0;->k(Ll/d0j0;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/d0j0$a;->a:Ll/d0j0;

    .line 45
    .line 46
    invoke-static {p0}, Ll/d0j0;->l(Ll/d0j0;)Landroid/os/Handler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/4 p1, 0x0

    .line 51
    const-wide/16 v0, 0x1388

    .line 52
    .line 53
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method
