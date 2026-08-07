.class public Ll/a5j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/z4j0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VText;

.field public d:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public e:Ll/z4j0;

.field public final f:Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;

.field public g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a5j0;->f:Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;

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
    iget-object p0, p0, Ll/a5j0;->f:Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;

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

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/b5j0;->b(Ll/a5j0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/a5j0;->b()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/a5j0;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public c(Ll/z4j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a5j0;->e:Ll/z4j0;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/webkit/WebView;->reload()V

    .line 24
    .line 25
    .line 26
    :cond_0
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
    check-cast p1, Ll/z4j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a5j0;->c(Ll/z4j0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a5j0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/a5j0;->a:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v2, v1, [Landroid/view/View;

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aput-object v0, v2, v3

    .line 8
    .line 9
    invoke-static {v2}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/a5j0;->f:Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v2, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 23
    .line 24
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 28
    .line 29
    new-instance v2, Landroid/os/Bundle;

    .line 30
    .line 31
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->url:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-eqz v5, :cond_0

    .line 45
    .line 46
    const-string v4, "http://"

    .line 47
    .line 48
    :cond_0
    const-string v5, "url"

    .line 49
    .line 50
    invoke-virtual {v2, v5, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v4, p0, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 54
    .line 55
    invoke-virtual {v4, v2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 56
    .line 57
    .line 58
    sget v2, Ll/adc0;->yf:I

    .line 59
    .line 60
    iget-object v4, p0, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 61
    .line 62
    const-string v5, "TopItemWebFrag"

    .line 63
    .line 64
    invoke-virtual {v0, v2, v4, v5}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Landroidx/fragment/app/k;->j()I

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->rightItems:Ljava/util/List;

    .line 75
    .line 76
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_1

    .line 81
    .line 82
    invoke-static {}, Ll/v4j0;->d()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_1

    .line 87
    .line 88
    iget-object v0, p0, Ll/a5j0;->c:Lv/VText;

    .line 89
    .line 90
    const/4 v2, 0x3

    .line 91
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/a5j0;->c:Lv/VText;

    .line 99
    .line 100
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->rightItems:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    check-cast v1, Ljava/lang/CharSequence;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    :cond_1
    iget-object v0, p0, Ll/a5j0;->c:Lv/VText;

    .line 116
    .line 117
    new-instance v1, Ll/a5j0$a;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/a5j0$a;-><init>(Ll/a5j0;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method
