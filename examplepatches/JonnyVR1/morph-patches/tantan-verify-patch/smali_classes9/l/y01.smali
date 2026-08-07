.class public Ll/y01;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/e11;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VLinear;

.field public f:Ll/e11;

.field public g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


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

.method public static synthetic a(Ll/y01;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y01;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/y01;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y01;->k(Landroid/view/View;)V

    return-void
.end method

.method private i()V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/y01;->f:Ll/e11;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/e11;->N3()Landroid/view/ViewGroup;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v0, v1}, Ll/y01;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/c0s;

    .line 20
    .line 21
    iget-object v2, p0, Ll/y01;->f:Ll/e11;

    .line 22
    .line 23
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/y01;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/y01;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y01;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y01;->b:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/w01;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/w01;-><init>(Ll/y01;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y01;->f:Ll/e11;

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

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/z01;->b(Ll/y01;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/e11;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y01;->f:Ll/e11;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y01;->e:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveClarity;)Lv/VText;
    .locals 3

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y01;->f:Ll/e11;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/cyr;->C0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->text:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget v1, Ll/obc0;->v6:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    const/16 v1, 0x11

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/n9c0;->d1:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    const/4 v1, 0x2

    .line 44
    const/high16 v2, 0x41400000    # 12.0f

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 47
    .line 48
    .line 49
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->selected:Z

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 52
    .line 53
    .line 54
    new-instance p1, Ll/x01;

    .line 55
    .line 56
    invoke-direct {p1, p0}, Ll/x01;-><init>(Ll/y01;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y01;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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
    iget-object v0, p0, Ll/y01;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/y01;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/e11;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y01;->d(Ll/e11;)V

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

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y01;->f:Ll/e11;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/e11;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveClarity;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final m(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveClarity;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/y01;->f:Ll/e11;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Ll/y01;->e:Lv/VLinear;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/y01;->e(Lcom/p1/mobile/putong/live/base/data/BLiveClarity;)Lv/VText;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 38
    .line 39
    sget v2, Ll/qa00;->H:I

    .line 40
    .line 41
    sget v3, Ll/qa00;->y:I

    .line 42
    .line 43
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    sget v2, Ll/qa00;->o:I

    .line 47
    .line 48
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 49
    .line 50
    iget-object v2, p0, Ll/y01;->e:Lv/VLinear;

    .line 51
    .line 52
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    return-void

    .line 57
    :cond_2
    :goto_1
    invoke-virtual {p0}, Ll/y01;->f()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveClarity;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/y01;->i()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/y01;->l()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/y01;->m(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
