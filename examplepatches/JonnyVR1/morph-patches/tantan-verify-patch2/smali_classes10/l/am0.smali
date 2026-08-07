.class public Ll/am0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Lcom/p1/mobile/android/app/Frag;

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

.field public e:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/am0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/am0;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/am0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/am0;->i(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bm0;->b(Ll/am0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/am0;->c:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/am0;->c:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/am0;->d()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v1, Ll/efv;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/am0;->c:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/am0;->d()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object p0, p0, Ll/am0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v2, "from_anchor_cover_dialog"

    .line 12
    .line 13
    invoke-static {v1, p0, v2}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 v1, 0x64

    .line 18
    .line 19
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/am0;->a:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/yl0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/yl0;-><init>(Ll/am0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/am0;->b:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/zl0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/zl0;-><init>(Ll/am0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final h()Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/am0;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Ll/am0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/am0;->e:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/am0;->e:Lcom/p1/mobile/android/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/am0;->f()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/am0;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/am0;->c:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    iput-object p2, p0, Ll/am0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/am0;->d()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Ll/am0;->h()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/am0;->e:Lcom/p1/mobile/android/app/Dialog;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/am0;->g()V

    .line 32
    .line 33
    .line 34
    return-void
.end method
