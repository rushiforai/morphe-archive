.class public Ll/rvp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xup;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/itp;

.field public b:Ll/mvp;

.field public c:Ll/btp;

.field public d:Ll/xup;

.field public e:Ll/ltp;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/rvp;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rvp;->e(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Ll/rvp;->c:Ll/btp;

    .line 22
    .line 23
    if-eqz p0, :cond_3

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public c(Ll/xup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rvp;->d:Ll/xup;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mvp;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ll/rvp;->c:Ll/btp;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rvp;->d:Ll/xup;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xup;->f4()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Ll/xup;->m4(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/mvp;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/rvp;->c:Ll/btp;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    new-instance v0, Ll/btp;

    .line 36
    .line 37
    iget-object v1, p0, Ll/rvp;->d:Ll/xup;

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ll/btp;-><init>(Ll/xup;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/rvp;->c:Ll/btp;

    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Ll/rvp;->c:Ll/btp;

    .line 45
    .line 46
    iget-object v1, p0, Ll/rvp;->d:Ll/xup;

    .line 47
    .line 48
    invoke-virtual {v0, v1, p1}, Ll/btp;->R0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/rvp;->c:Ll/btp;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_3

    .line 58
    .line 59
    iget-object p0, p0, Ll/rvp;->c:Ll/btp;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 62
    .line 63
    .line 64
    :cond_3
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rvp;->c:Ll/btp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/rvp;->c:Ll/btp;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/mvp;->dismiss()V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    new-instance v0, Ll/itp;

    .line 36
    .line 37
    iget-object v1, p0, Ll/rvp;->d:Ll/xup;

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ll/itp;-><init>(Ll/xup;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 45
    .line 46
    iget-object v1, p0, Ll/rvp;->d:Ll/xup;

    .line 47
    .line 48
    invoke-virtual {v0, v1, p1}, Ll/itp;->p0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/rvp;->a:Ll/itp;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_3

    .line 58
    .line 59
    iget-object p0, p0, Ll/rvp;->a:Ll/itp;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 62
    .line 63
    .line 64
    :cond_3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xup;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rvp;->c(Ll/xup;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rvp;->e:Ll/ltp;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ltp;

    .line 6
    .line 7
    iget-object v1, p0, Ll/rvp;->d:Ll/xup;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/ltp;-><init>(Ll/xup;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/rvp;->e:Ll/ltp;

    .line 13
    .line 14
    new-instance v1, Ll/qvp;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/qvp;-><init>(Ll/rvp;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/rvp;->e:Ll/ltp;

    .line 23
    .line 24
    iget-object v1, p0, Ll/rvp;->d:Ll/xup;

    .line 25
    .line 26
    invoke-virtual {v0, v1, p1}, Ll/ltp;->q0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/rvp;->e:Ll/ltp;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rvp;->c:Ll/btp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/rvp;->c:Ll/btp;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/rvp;->a:Ll/itp;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    new-instance v0, Ll/mvp;

    .line 36
    .line 37
    iget-object v1, p0, Ll/rvp;->d:Ll/xup;

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ll/mvp;-><init>(Ll/xup;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Ll/rvp;->b:Ll/mvp;

    .line 45
    .line 46
    iget-object v1, p0, Ll/rvp;->d:Ll/xup;

    .line 47
    .line 48
    invoke-virtual {v0, v1, p1}, Ll/mvp;->w0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/rvp;->b:Ll/mvp;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_3

    .line 58
    .line 59
    iget-object p0, p0, Ll/rvp;->b:Ll/mvp;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 62
    .line 63
    .line 64
    :cond_3
    return-void
.end method
