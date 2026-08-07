.class public Ll/in00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ym00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

.field public e:Ll/ym00;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MomentDetailAct"

    .line 5
    .line 6
    iput-object v0, p0, Ll/in00;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/in00;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/in00;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ln00;->b(Ll/in00;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/ym00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/in00;->e:Ll/ym00;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ym00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/in00;->b(Ll/ym00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/in00;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/in00;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 4
    .line 5
    new-instance v2, Ll/in00$a;

    .line 6
    .line 7
    invoke-direct {v2, v0}, Ll/in00$a;-><init>(Ll/in00;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, v0, Ll/in00;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, v0, Ll/in00;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 26
    .line 27
    iput-object v2, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    iget-object v2, v0, Ll/in00;->e:Ll/ym00;

    .line 32
    .line 33
    iget-object v3, v2, Ll/ym00;->b:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v4, v2, Ll/ym00;->c:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v5, v2, Ll/ym00;->d:Ljava/lang/String;

    .line 38
    .line 39
    iget v7, v2, Ll/ym00;->f:I

    .line 40
    .line 41
    iget-boolean v8, v2, Ll/ym00;->e:Z

    .line 42
    .line 43
    iget-object v9, v2, Ll/ym00;->g:Ljava/lang/String;

    .line 44
    .line 45
    iget-boolean v10, v2, Ll/ym00;->h:Z

    .line 46
    .line 47
    iget-boolean v11, v2, Ll/ym00;->m:Z

    .line 48
    .line 49
    iget-object v12, v2, Ll/ym00;->i:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v13, v2, Ll/ym00;->j:Ljava/lang/String;

    .line 52
    .line 53
    iget-boolean v14, v2, Ll/ym00;->k:Z

    .line 54
    .line 55
    iget-object v15, v2, Ll/ym00;->l:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 56
    .line 57
    iget-object v2, v2, Ll/ym00;->n:Ljava/lang/String;

    .line 58
    .line 59
    const/4 v6, 0x1

    .line 60
    move-object/from16 v16, v2

    .line 61
    .line 62
    invoke-static/range {v3 .. v16}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->N4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZLjava/lang/String;ZZLjava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/RawFeed;Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iput-object v2, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    sget v3, Ll/hdc0;->Q:I

    .line 73
    .line 74
    iget-object v4, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 75
    .line 76
    iget-object v5, v0, Ll/in00;->b:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v2, v3, v4, v5}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Landroidx/fragment/app/k;->j()I

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 85
    .line 86
    .line 87
    :cond_0
    iget-object v0, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->R4()V

    .line 90
    .line 91
    .line 92
    return-void
.end method
