.class public Ll/iev;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cfv;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroid/view/View;

.field public c:Landroidx/cardview/widget/CardView;

.field public d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

.field public e:Lv/VImage;

.field public f:Ll/cfv;

.field public g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public h:Ljava/lang/String;

.field public i:I

.field public final j:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x11

    .line 5
    .line 6
    iput v0, p0, Ll/iev;->i:I

    .line 7
    .line 8
    const/high16 v0, 0x41200000    # 10.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ll/iev;->j:I

    .line 15
    .line 16
    return-void
.end method

.method private A(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v0, "://"

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Ll/iev;->h:Ljava/lang/String;

    .line 41
    .line 42
    return-void
.end method

.method private C()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iev;->c:Landroidx/cardview/widget/CardView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 14
    .line 15
    iput v0, p0, Ll/iev;->i:I

    .line 16
    .line 17
    const/16 v1, 0x11

    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    sget v0, Ll/jgc0;->f:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget v0, Ll/jgc0;->h:I

    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c0(I)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public static synthetic a(Ll/iev;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iev;->v(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/iev;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/iev;->u()V

    return-void
.end method

.method public static synthetic c(Ll/iev;Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/iev;->w(Ll/x20;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic d(Ll/iev;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iev;->s(Landroid/view/View;)V

    return-void
.end method

.method public static f(Ll/iev;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/iev;->a:Lv/VFrame;

    .line 3
    .line 4
    iput-object v0, p0, Ll/iev;->b:Landroid/view/View;

    .line 5
    .line 6
    iput-object v0, p0, Ll/iev;->c:Landroidx/cardview/widget/CardView;

    .line 7
    .line 8
    iput-object v0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 9
    .line 10
    iput-object v0, p0, Ll/iev;->e:Lv/VImage;

    .line 11
    .line 12
    return-void
.end method

.method private k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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
    iget-object v0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->v()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/iev;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic u()V
    .locals 2

    .line 1
    const-string v0, "about:blank"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/iev;->z(Ljava/lang/String;Ljava/util/Map;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic v(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/iev;->i:I

    .line 2
    .line 3
    const/16 v0, 0x11

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/iev;->f:Ll/cfv;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cfv;->C4()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private synthetic w(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p1, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->v()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->p()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/iev;->f:Ll/cfv;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/cfv;->B4()V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Ll/iev;->f(Ll/iev;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b()Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Ll/iev;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->e(Landroid/content/Context;)I

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    iput-object p1, p0, Ll/iev;->f:Ll/cfv;

    .line 41
    .line 42
    iput-object p1, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public B([IZIIZ)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->e0(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    aget v1, p1, v0

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aget p1, p1, v2

    .line 13
    .line 14
    const/16 v3, 0x50

    .line 15
    .line 16
    if-ne p3, v3, :cond_1

    .line 17
    .line 18
    move v3, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    move v3, v0

    .line 21
    :goto_0
    iget-object v4, p0, Ll/iev;->c:Landroidx/cardview/widget/CardView;

    .line 22
    .line 23
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 28
    .line 29
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 30
    .line 31
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 32
    .line 33
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 34
    .line 35
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 36
    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    const/4 p1, -0x1

    .line 40
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 41
    .line 42
    if-eqz p5, :cond_3

    .line 43
    .line 44
    invoke-static {}, Ll/bnl0;->F0()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 52
    .line 53
    :cond_3
    :goto_1
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 54
    .line 55
    if-eqz v3, :cond_4

    .line 56
    .line 57
    iget p1, p0, Ll/iev;->j:I

    .line 58
    .line 59
    neg-int p1, p1

    .line 60
    goto :goto_2

    .line 61
    :cond_4
    move p1, v0

    .line 62
    :goto_2
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 63
    .line 64
    or-int/lit8 p1, p3, 0x1

    .line 65
    .line 66
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 67
    .line 68
    iget-object p1, p0, Ll/iev;->c:Landroidx/cardview/widget/CardView;

    .line 69
    .line 70
    invoke-virtual {p1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/iev;->c:Landroidx/cardview/widget/CardView;

    .line 74
    .line 75
    if-eqz v3, :cond_5

    .line 76
    .line 77
    iget p2, p0, Ll/iev;->j:I

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_5
    move p2, v0

    .line 81
    :goto_3
    invoke-virtual {p1, v0, v0, v0, p2}, Landroidx/cardview/widget/CardView;->setContentPadding(IIII)V

    .line 82
    .line 83
    .line 84
    int-to-float p1, p4

    .line 85
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v9

    .line 89
    iget-object v4, p0, Ll/iev;->c:Landroidx/cardview/widget/CardView;

    .line 90
    .line 91
    if-eqz v3, :cond_6

    .line 92
    .line 93
    const/4 v7, 0x0

    .line 94
    neg-int v8, v9

    .line 95
    const/4 v5, 0x0

    .line 96
    const/4 v6, 0x0

    .line 97
    invoke-static/range {v4 .. v9}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_6
    invoke-static {v4, v9}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iev;->f:Ll/cfv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iev;->e:Lv/VImage;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setWebViewMarginTop(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public F(Ljava/lang/String;ZZLl/x20;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 9
    .line 10
    sget v1, Ll/mdc0;->e8:I

    .line 11
    .line 12
    iget-object v2, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->z(ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Ll/iev;->C()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Ll/iev;->A(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 29
    .line 30
    new-instance v0, Ll/eev;

    .line 31
    .line 32
    invoke-direct {v0, p0, p4}, Ll/eev;-><init>(Ll/iev;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/iev;->e:Lv/VImage;

    .line 39
    .line 40
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/iev;->b:Landroid/view/View;

    .line 44
    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget p2, Ll/n9c0;->N:I

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    const/4 p1, 0x0

    .line 64
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iev;->f:Ll/cfv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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
    iget-object v0, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->B()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->v()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dfv;->b(Ll/iev;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/cfv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iev;->f:Ll/cfv;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cfv;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iev;->i(Ll/cfv;)V

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

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public j()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/iev;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->getWebViewHashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public m(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/iev;->n(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/iev;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    iget-object v1, p0, Ll/iev;->f:Ll/cfv;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/iev;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-virtual {p0, v2, v3}, Ll/iev;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/16 v3, 0x11

    .line 26
    .line 27
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Ll/xzs;Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 31
    .line 32
    iget-object v0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 33
    .line 34
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->y(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 38
    .line 39
    sget-object p3, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 40
    .line 41
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 42
    .line 43
    .line 44
    new-instance p1, Ll/fev;

    .line 45
    .line 46
    invoke-direct {p1, p0}, Ll/fev;-><init>(Ll/iev;)V

    .line 47
    .line 48
    .line 49
    iget-object p3, p0, Ll/iev;->b:Landroid/view/View;

    .line 50
    .line 51
    invoke-static {p3, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    iget-object p3, p0, Ll/iev;->e:Lv/VImage;

    .line 55
    .line 56
    invoke-static {p3, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 60
    .line 61
    const/4 p3, 0x1

    .line 62
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setOnCheckIsTextEditorFlag(Z)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 66
    .line 67
    new-instance p3, Ll/gev;

    .line 68
    .line 69
    invoke-direct {p3, p0}, Ll/gev;-><init>(Ll/iev;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->f0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/iev;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 76
    .line 77
    new-instance p3, Ll/hev;

    .line 78
    .line 79
    invoke-direct {p3, p0}, Ll/hev;-><init>(Ll/iev;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 83
    .line 84
    .line 85
    invoke-static {p2}, Ll/aro;->a(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_1

    .line 90
    .line 91
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 92
    .line 93
    const-string p2, "octopus_game_loading"

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->t()V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 104
    .line 105
    new-instance p1, Ll/aro;

    .line 106
    .line 107
    invoke-direct {p1}, Ll/aro;-><init>()V

    .line 108
    .line 109
    .line 110
    const-string p2, "app"

    .line 111
    .line 112
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->m(Ll/wqo;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_1
    :goto_0
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iev;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/iev;->h:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "?"

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0

    .line 37
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public x(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->w(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/iev;->f:Ll/cfv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/iev;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->l(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public z(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/iev;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->x(Ljava/lang/String;Ljava/util/Map;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
