.class public Ll/hg70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lf70;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/app/PutongAct;

.field public b:Ll/lf70;

.field public c:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hg70;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hg70;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/lf70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hg70;->b:Ll/lf70;

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
    check-cast p1, Ll/lf70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hg70;->a(Ll/lf70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6

    .line 1
    iget-object p1, p0, Ll/hg70;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const p2, 0x1020002

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Ll/hg70;->b:Ll/lf70;

    .line 17
    .line 18
    iget-object v0, p1, Ll/lf70;->b:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p1, Ll/lf70;->c:Ljava/lang/String;

    .line 21
    .line 22
    iget v2, p1, Ll/lf70;->d:I

    .line 23
    .line 24
    iget-object p1, p1, Ll/lf70;->e:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Ll/hg70;->b:Ll/lf70;

    .line 33
    .line 34
    iget-object p1, p1, Ll/lf70;->e:Ljava/lang/String;

    .line 35
    .line 36
    :goto_0
    move-object v3, p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    const-string p1, "-1"

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :goto_1
    iget-object p1, p0, Ll/hg70;->b:Ll/lf70;

    .line 42
    .line 43
    iget v4, p1, Ll/lf70;->f:I

    .line 44
    .line 45
    iget-boolean v5, p1, Ll/lf70;->h:Z

    .line 46
    .line 47
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Ll/hg70;->c:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 52
    .line 53
    iget-object p1, p0, Ll/hg70;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object v0, p0, Ll/hg70;->c:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 64
    .line 65
    invoke-virtual {p1, p2, v0}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/hg70;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 79
    .line 80
    .line 81
    :cond_1
    const/4 p0, 0x0

    .line 82
    return-object p0
.end method
