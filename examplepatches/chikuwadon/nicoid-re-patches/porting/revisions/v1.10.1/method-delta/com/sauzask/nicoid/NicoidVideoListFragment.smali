.class public Lcom/sauzask/nicoid/NicoidVideoListFragment;
.super Landroidx/fragment/app/Fragment;
.source ""

# interfaces
.implements Le/e/a/l3/k;
.implements Le/e/a/l3/l;


# instance fields
.field public A0:Landroid/view/View;

.field public Y:Landroid/os/Handler;

.field public Z:Landroid/view/View;

.field public a0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation
.end field

.field public b0:Landroid/widget/ListView;

.field public c0:Le/e/a/e0;

.field public d0:Ljava/lang/String;

.field public e0:Ljava/lang/String;

.field public f0:Ljava/lang/String;

.field public g0:I

.field public h0:I

.field public i0:I

.field public j0:I

.field public k0:Z

.field public l0:Z

.field public m0:Z

.field public n0:Z

.field public o0:Landroid/app/Activity;

.field public p0:Le/e/a/b0;

.field public q0:Le/e/a/i2;

.field public r0:Le/e/a/b1;

.field public s0:Le/e/a/y0;

.field public selectionCount:Landroid/widget/TextView;

.field public t0:Landroid/view/LayoutInflater;

.field public u0:Z

.field public v0:Le/e/a/l3/g;

.field public w0:I

.field public x0:Landroid/content/SharedPreferences;

.field public y0:Landroid/widget/LinearLayout;

.field public z0:Landroid/view/View;


# direct methods
.method public static synthetic b(Lcom/sauzask/nicoid/NicoidVideoListFragment;I)V
    .registers 7

    .line 1
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    if-gtz v1, :cond_1a

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v0, 0x7f0f020d

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 2
    invoke-static {p1, v2, p0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    goto :goto_7d

    :cond_1a
    const/4 v1, 0x1

    if-nez p1, :cond_70

    iget v3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const/16 v4, 0x8

    if-ne v3, v4, :cond_27

    invoke-static {p0}, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;->confirm(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    return-void

    .line 3
    :cond_27
    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {p1, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v4, 0x7f0f0210

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f022d

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/z1;

    invoke-direct {v2, p0, v0}, Le/e/a/z1;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;Ljava/util/ArrayList;)V

    invoke-virtual {p1, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v1, 0x7f0f00b3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/a2;

    invoke-direct {v1, p0}, Le/e/a/a2;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-static {p1}, Le/e/a/v0;->a(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    goto :goto_7d

    :cond_70
    if-ne p1, v1, :cond_73

    goto :goto_76

    :cond_73
    const/4 v1, 0x2

    if-ne p1, v1, :cond_7d

    .line 4
    :goto_76
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->q0:Le/e/a/i2;

    iget-object p0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d0:Ljava/lang/String;

    invoke-virtual {p1, v1, v0, p0}, Le/e/a/i2;->a(ILjava/util/ArrayList;Ljava/lang/String;)V

    :cond_7d
    :goto_7d
    return-void
.end method


# virtual methods
.method public Y()V
    .registers 4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    const v1, 0x7f0801be

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_19

    iput-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_fb

    :cond_19
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->y0:Landroid/widget/LinearLayout;

    if-nez v0, :cond_bf

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    const v1, 0x7f0801bd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->y0:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v1, 0x7f0f0050

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoListFragment$h;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$h;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->y0:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_84

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v1, 0x7f0f004b

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoListFragment$i;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$i;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->y0:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v1, 0x7f0f0081

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoListFragment$j;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$j;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->y0:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_84
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    const v1, 0x7f08019a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f001c

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoListFragment$a;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f001b

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoListFragment$b;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$b;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_bf
    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_fb

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->selectionCount:Landroid/widget/TextView;

    if-nez v0, :cond_f8

    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->selectionCount:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    invoke-static {v1}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    const v2, 0x7f0801be

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_f8
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->updateSelectionCount()V

    :cond_fb
    :goto_fb
    invoke-static/range {p0 .. p0}, Le/e/a/BulkSelection;->modeChanged(Ljava/lang/Object;)V

    return-void
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    :cond_b
    invoke-super {p0, p3}, Landroidx/fragment/app/Fragment;->c(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->k()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 2
    iget-object p2, p0, Landroidx/fragment/app/Fragment;->f:Landroid/os/Bundle;

    const-string p3, "url"

    .line 3
    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d0:Ljava/lang/String;

    const-string p3, "type"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const-string p3, "folderid"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->t0:Landroid/view/LayoutInflater;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->x0:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->x0:Landroid/content/SharedPreferences;

    const-string p3, "videolist_tap"

    const-string v0, "0"

    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->j0:I

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/v0;->d(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->m0:Z

    new-instance p1, Le/e/a/y0;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {p1, p3}, Le/e/a/y0;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->s0:Le/e/a/y0;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->t0:Landroid/view/LayoutInflater;

    const p3, 0x7f0b006e

    const/4 v0, 0x0

    invoke-virtual {p1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    invoke-static {p1}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d0:Ljava/lang/String;

    if-nez p1, :cond_6f

    const-string p1, "https://nvapi.nicovideo.jp/v2/users/me/watch/history?selectContentType=long&limit=100"

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d0:Ljava/lang/String;

    :cond_6f
    new-instance p1, Le/e/a/b0;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    iget v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->j0:I

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->s0:Le/e/a/y0;

    invoke-direct {p1, p3, v1, v2, v3}, Le/e/a/b0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;ILe/e/a/y0;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    new-instance p1, Le/e/a/i2;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {p1, p3, v1}, Le/e/a/i2;-><init>(Le/e/a/b0;Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->q0:Le/e/a/i2;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->q0:Le/e/a/i2;

    .line 4
    iput-object p0, p1, Le/e/a/i2;->d:Le/e/a/l3/k;

    .line 5
    new-instance p1, Le/e/a/b1;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {p1, p3}, Le/e/a/b1;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->r0:Le/e/a/b1;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->r0:Le/e/a/b1;

    .line 6
    iput-object p0, p1, Le/e/a/b1;->c:Le/e/a/l3/l;

    .line 7
    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const/4 p3, 0x6

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, p3, :cond_a3

    const/4 p1, 0x1

    goto :goto_a4

    :cond_a3
    const/4 p1, 0x0

    :goto_a4
    iget v3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const/16 v4, 0x9

    if-ne v3, v4, :cond_ac

    const/4 v3, 0x1

    goto :goto_ad

    :cond_ac
    const/4 v3, 0x0

    :goto_ad
    or-int/2addr p1, v3

    const-string v3, "subtitle"

    const-string v4, "name"

    if-eqz p1, :cond_c4

    invoke-virtual {p2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    if-ne p1, p3, :cond_c4

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->f0:Ljava/lang/String;

    :cond_c4
    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const/4 p3, 0x2

    if-ne p1, p3, :cond_cf

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->f0:Ljava/lang/String;

    :cond_cf
    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const/4 p3, 0x5

    if-ne p1, p3, :cond_e3

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d0:Ljava/lang/String;

    invoke-virtual {p2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 8
    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d0:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b(Ljava/lang/String;)V

    goto/16 :goto_154

    :cond_e3
    const/4 p3, 0x7

    if-ne p1, p3, :cond_e8

    goto/16 :goto_154

    :cond_e8
    const/16 p3, 0x8

    const v3, 0x7f0f020c

    if-ne p1, p3, :cond_111

    .line 9
    invoke-virtual {p2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    .line 10
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {p1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Le/e/a/y1;

    invoke-direct {p2, p0}, Le/e/a/y1;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto/16 :goto_154

    :cond_111
    const/16 p3, 0xb

    if-ne p1, p3, :cond_136

    .line 11
    invoke-virtual {p2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    .line 12
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {p1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Le/e/a/g2;

    invoke-direct {p2, p0}, Le/e/a/g2;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_154

    :cond_136
    const/16 p3, 0xc

    if-ne p1, p3, :cond_14f

    const-string p1, ""

    .line 13
    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    const-string p1, "playlistposition"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->w0:I

    invoke-static {p0}, Le/e/a/PlaybackQueue192;->initialize(Ljava/lang/Object;)V

    const-string p1, "http://"

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b(Ljava/lang/String;)V

    goto :goto_154

    .line 15
    :cond_14f
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d0:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b(Ljava/lang/String;)V

    :goto_154
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    return-object p1
.end method

.method public a(Landroid/view/KeyEvent;)Z
    .registers 7

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eq v0, v2, :cond_9

    goto :goto_7f

    :cond_9
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_7f

    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    const/4 v0, 0x1

    if-eqz p1, :cond_18

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Y()V

    return v0

    :cond_18
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->y0:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_7f

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_7f

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ""

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v4, 0x7f0f022a

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-array v4, v0, [Ljava/lang/Object;

    aput-object p1, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v1, 0x7f0f022d

    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Le/e/a/b2;

    invoke-direct {v1, p0}, Le/e/a/b2;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v2, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v1, 0x7f0f00b3

    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Le/e/a/c2;

    invoke-direct {v1, p0}, Le/e/a/c2;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v2, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return v0

    :cond_7f
    :goto_7f
    return v1
.end method

.method public final b(Ljava/lang/String;)V
    .registers 16

    .line 5
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->A:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    const/4 v1, 0x1

    :try_start_9
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const-string v4, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_26

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z
    :try_end_21
    .catch Ljava/lang/ClassNotFoundException; {:try_start_9 .. :try_end_21} :catch_22

    goto :goto_26

    :catch_22
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    :cond_26
    :goto_26
    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    const v3, 0x7f0801b7

    if-nez v2, :cond_38

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_38
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    iget-boolean v4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    .line 7
    iput-boolean v4, v2, Le/e/a/b0;->k:Z

    .line 8
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    const v4, 0x7f0800e5

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    iget v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    const/16 v4, 0xc

    const/16 v5, 0x8

    if-eq v2, v4, :cond_77

    const/16 v4, 0xb

    if-eq v2, v4, :cond_77

    const/4 v4, 0x7

    if-eq v2, v4, :cond_77

    if-eq v2, v5, :cond_77

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    .line 9
    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->z0:Landroid/view/View;

    if-nez v4, :cond_72

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const v6, 0x7f0b0038

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->z0:Landroid/view/View;

    :cond_72
    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->z0:Landroid/view/View;

    .line 10
    invoke-virtual {v2, v4}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    :cond_77
    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->l0:Z

    const/16 v4, 0xe

    const/16 v6, 0xd

    const/4 v7, 0x4

    const/4 v8, 0x3

    const/16 v9, 0xa

    const/4 v10, 0x2

    if-nez v2, :cond_1e2

    new-instance v2, Le/e/a/e0;

    iget-object v11, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {v2, v11}, Le/e/a/e0;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->c0:Le/e/a/e0;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->c0:Le/e/a/e0;

    .line 11
    iput-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    iput-object p1, v2, Le/e/a/e0;->b:Ljava/lang/String;

    .line 12
    iget-object p1, v2, Le/e/a/e0;->b:Ljava/lang/String;

    if-nez p1, :cond_99

    goto/16 :goto_1d8

    :cond_99
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    iget v11, v2, Le/e/a/e0;->g:I

    const/16 v12, 0x64

    if-nez v11, :cond_15b

    const-string v11, "https://nvapi.nicovideo.jp/v1/search/video.+?"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_dd

    iput v1, v2, Le/e/a/e0;->g:I

    const/16 p1, 0x19

    iput p1, v2, Le/e/a/e0;->i:I

    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https://nvapi.nicovideo.jp/v1/search/video\\?(tag|keyword)=([^&]+)&([^$]+)"

    const-string v13, "$2"

    invoke-virtual {p1, v11, v13}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Le/e/a/e0;->c:Ljava/lang/String;

    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    iget-object v11, v2, Le/e/a/e0;->p:Landroid/content/Context;

    invoke-static {p1, v11}, Le/e/a/v0;->b(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Le/e/a/e0;->d:Ljava/lang/String;

    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    iput-object p1, v2, Le/e/a/e0;->b:Ljava/lang/String;

    const-string p1, "loadurl\uff1a"

    invoke-static {p1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v11, v2, Le/e/a/e0;->a:Ljava/lang/String;

    invoke-virtual {p1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto/16 :goto_15b

    :cond_dd
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https?://flapi.nicovideo.jp/api/getrelation.+?"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_ee

    iput v10, v2, Le/e/a/e0;->g:I

    const/16 p1, 0xf

    iput p1, v2, Le/e/a/e0;->i:I

    goto :goto_15b

    :cond_ee
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https?://www.nicovideo.jp/mylist/.+?"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_108

    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https?://www.nicovideo.jp/mylist/([0-9]+).*?$"

    const-string v13, "https://nvapi.nicovideo.jp/v2/mylists/$1?pageSize=500"

    invoke-virtual {p1, v11, v13}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    iput-object p1, v2, Le/e/a/e0;->b:Ljava/lang/String;

    const/4 p1, 0x3

    goto :goto_13b

    :cond_108
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https?://nvapi.nicovideo.jp/v2/users/me/watch/history.+?"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_114

    const/4 p1, 0x4

    goto :goto_13b

    :cond_114
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "[0-9]+"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_12f

    iget-object p1, v2, Le/e/a/e0;->p:Landroid/content/Context;

    const v11, 0x7f0f01b6

    invoke-virtual {p1, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Le/e/a/e0;->d:Ljava/lang/String;

    const/4 p1, 0x5

    goto :goto_13b

    :cond_12f
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "deflist"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_13e

    const/16 p1, 0x9

    :goto_13b
    iput p1, v2, Le/e/a/e0;->g:I

    goto :goto_159

    :cond_13e
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "http://www.nicovideo.jp/ranking/[^/]+/[^/]+/all\\?rss=2.0"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_14d

    iput v12, v2, Le/e/a/e0;->g:I

    iput v12, v2, Le/e/a/e0;->i:I

    goto :goto_15b

    :cond_14d
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "http://www.nicovideo.jp/ranking/[^/]+/[^/]+/[^\\?]+\\?rss=2.0"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_15b

    iput v12, v2, Le/e/a/e0;->g:I

    :goto_159
    iput v0, v2, Le/e/a/e0;->i:I

    :cond_15b
    :goto_15b
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https://sp.nicovideo.jp/api/ranking/.+?"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    const/16 v11, 0xc8

    if-eqz p1, :cond_168

    goto :goto_172

    :cond_168
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v13, "https://sp.nicovideo.jp/ranking/.+?"

    invoke-virtual {p1, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_176

    :goto_172
    iput v11, v2, Le/e/a/e0;->g:I

    iput v0, v2, Le/e/a/e0;->i:I

    :cond_176
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https?://api.gadget.nicovideo.jp/video/videos/by_ranking.+?"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_188

    const/4 p1, -0x1

    iput p1, v2, Le/e/a/e0;->j:I

    const/4 p1, 0x6

    iput p1, v2, Le/e/a/e0;->g:I

    iput v0, v2, Le/e/a/e0;->i:I

    :cond_188
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https?://www.nicovideo.jp/user/[0-9]+.*?"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1a4

    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "http://www.nicovideo.jp/user/([0-9]+).*?$"

    const-string v13, "https://nvapi.nicovideo.jp/v2/users/$1/videos?sortKey=registeredAt&sortOrder=desc&pageSize=100"

    invoke-virtual {p1, v11, v13}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    iput-object p1, v2, Le/e/a/e0;->b:Ljava/lang/String;

    iput v9, v2, Le/e/a/e0;->g:I

    iput v12, v2, Le/e/a/e0;->i:I

    :cond_1a4
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v11, "https?://nvapi.nicovideo.jp/v1/recommend.*?"

    invoke-virtual {p1, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1b6

    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    iput-object p1, v2, Le/e/a/e0;->b:Ljava/lang/String;

    iput v6, v2, Le/e/a/e0;->g:I

    iput v0, v2, Le/e/a/e0;->i:I

    :cond_1b6
    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v0, "https?://www.nicovideo.jp/recommendations.*?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1ca

    iget-object p1, v2, Le/e/a/e0;->a:Ljava/lang/String;

    iput-object p1, v2, Le/e/a/e0;->b:Ljava/lang/String;

    iput v4, v2, Le/e/a/e0;->g:I

    const/16 p1, 0x12

    iput p1, v2, Le/e/a/e0;->i:I

    :cond_1ca
    const-string p1, "list type:"

    invoke-static {p1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, v2, Le/e/a/e0;->g:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 13
    :goto_1d8
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->c0:Le/e/a/e0;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    .line 14
    iput-object v0, p1, Le/e/a/e0;->k:Le/e/a/l3/d;

    goto :goto_23d

    .line 15
    :cond_1e2
    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    if-eqz p1, :cond_1f7

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    if-eqz p1, :cond_1f7

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_1f7

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;

    invoke-virtual {p1}, Lcom/sauzask/nicoid/NicoidVideoListActivity;->s()V

    :cond_1f7
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->c0:Le/e/a/e0;

    if-eqz p1, :cond_23d

    iget-boolean v0, p1, Le/e/a/e0;->o:Z

    if-eqz v0, :cond_23d

    iget v0, p1, Le/e/a/e0;->f:I

    if-gtz v0, :cond_231

    iget p1, p1, Le/e/a/e0;->g:I

    if-eq p1, v1, :cond_21d

    if-eq p1, v10, :cond_217

    if-eq p1, v9, :cond_211

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v0, 0x7f0f007b

    goto :goto_222

    :cond_211
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v0, 0x7f0f007d

    goto :goto_222

    :cond_217
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v0, 0x7f0f007c

    goto :goto_222

    :cond_21d
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v0, 0x7f0f007e

    :goto_222
    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    :cond_231
    :try_start_231
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->z0:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->removeFooterView(Landroid/view/View;)Z
    :try_end_238
    .catch Ljava/lang/Exception; {:try_start_231 .. :try_end_238} :catch_239

    goto :goto_23d

    :catch_239
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_23d
    :goto_23d
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->c0:Le/e/a/e0;

    if-eqz p1, :cond_25b

    iget v0, p1, Le/e/a/e0;->g:I

    iput v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->h0:I

    iget v0, p1, Le/e/a/e0;->i:I

    iput v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->i0:I

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    if-eqz v0, :cond_25f

    iget-object p1, p1, Le/e/a/e0;->d:Ljava/lang/String;

    if-eqz p1, :cond_25f

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    check-cast v0, Lcom/sauzask/nicoid/NicoidVideoListActivity;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidActivity;->t:Landroidx/appcompat/app/ActionBar;

    invoke-static {v0, p1, p0}, Le/e/a/TabChrome228;->subtitle(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/Object;)V

    goto :goto_25f

    :cond_25b
    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    iput p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->h0:I

    :cond_25f
    :goto_25f
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->h0:I

    .line 16
    iput v0, p1, Le/e/a/b0;->e:I

    if-ne v0, v1, :cond_277

    .line 17
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-nez p1, :cond_271

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->c0:Le/e/a/e0;

    iget-object p1, p1, Le/e/a/e0;->c:Ljava/lang/String;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    :cond_271
    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    if-nez p1, :cond_309

    goto/16 :goto_2fe

    :cond_277
    const-string p1, "\u95a2\u9023\u52d5\u753b"

    if-ne v0, v10, :cond_281

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-nez v0, :cond_2fe

    goto/16 :goto_2fc

    :cond_281
    if-ne v0, v8, :cond_297

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-nez p1, :cond_2bf

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v0, 0x7f0f020f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    goto :goto_2bf

    :cond_297
    if-ne v0, v7, :cond_2ad

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-nez p1, :cond_309

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v0, 0x7f0f01b5

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    goto :goto_309

    :cond_2ad
    const/4 v2, 0x5

    if-ne v0, v2, :cond_2b2

    const/4 v0, 0x1

    goto :goto_2b3

    :cond_2b2
    const/4 v0, 0x0

    :goto_2b3
    iget v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->h0:I

    const/16 v7, 0x9

    if-ne v2, v7, :cond_2bb

    const/4 v2, 0x1

    goto :goto_2bc

    :cond_2bb
    const/4 v2, 0x0

    :goto_2bc
    or-int/2addr v0, v2

    if-eqz v0, :cond_2cb

    :cond_2bf
    :goto_2bf
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->X()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->n0:Z

    goto :goto_309

    :cond_2cb
    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->h0:I

    if-ne v0, v9, :cond_2de

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-nez p1, :cond_2fe

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->d0:Ljava/lang/String;

    const-string v0, "https?://www.nicovideo.jp/user/([0-9]+).*?$"

    const-string v2, "user/$1"

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2fc

    :cond_2de
    const/16 v2, 0xc

    if-ne v0, v2, :cond_2e9

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-nez p1, :cond_2fe

    const-string p1, ""

    goto :goto_2fc

    :cond_2e9
    if-ne v0, v6, :cond_2f0

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-nez v0, :cond_2fe

    goto :goto_2fc

    :cond_2f0
    if-ne v0, v4, :cond_309

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-nez p1, :cond_2fe

    const-string p1, "\u3042\u306a\u305f\u306b\u30aa\u30b9\u30b9\u30e1\u306e\u52d5\u753b"

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_2fc
    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    :cond_2fe
    :goto_2fe
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_309
    :goto_309
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->f0:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoListFragment$g;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$g;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->l0:Z

    if-nez p1, :cond_339

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->c0:Le/e/a/e0;

    invoke-virtual {p1}, Le/e/a/e0;->a()V

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->l0:Z

    :cond_339
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    invoke-static {p0}, Le/e/a/RankingPeriod;->install(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/RankingCaption232;->refresh(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->h0:I

    const/16 v0, 0xc

    if-ne p1, v0, :cond_357

    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->w0:I

    sub-int/2addr p1, v1

    if-gez p1, :cond_352

    const/4 p1, 0x0

    :cond_352
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setSelection(I)V

    :cond_357
    invoke-static {p0}, Le/e/a/PullRefresh;->install(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-static {p0}, Le/e/a/ListActions;->historyLoaded(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    check-cast v0, Lcom/sauzask/nicoid/NicoidVideoListActivity;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidActivity;->t:Landroidx/appcompat/app/ActionBar;

    invoke-static {v0, p1, p0}, Le/e/a/TabChrome228;->title(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/Object;)V

    if-eqz p2, :cond_27

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidActivity;->t:Landroidx/appcompat/app/ActionBar;

    invoke-static {p1, p2, p0}, Le/e/a/TabChrome228;->subtitle(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/Object;)V

    goto :goto_27

    :cond_19
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    const v0, 0x7f080074

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_27
    :goto_27
    return-void
.end method

.method public c()V
    .registers 3

    invoke-static {p0}, Le/e/a/FeedbackFixes;->refreshed(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Z:Landroid/view/View;

    const v1, 0x7f0800e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method public final d(Ljava/lang/String;)Landroid/widget/Button;
    .registers 5

    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v1, 0x7f07006a

    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, -0x1000000

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p1, v1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->button(Landroid/widget/Button;)V

    return-object v0
.end method

.method public refreshTapAction()V
    .registers 4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->x0:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_12

    const-string v1, "videolist_tap"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->j0:I

    :cond_12
    return-void
.end method

.method public updateSelectionCount()V
    .registers 6

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->selectionCount:Landroid/widget/TextView;

    if-eqz v0, :cond_44

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    if-eqz v1, :cond_44

    const/4 v2, 0x0

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/x1;

    const-string v4, "isselect"

    invoke-virtual {v3, v4}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/lang/Boolean;

    if-eqz v4, :cond_d

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_d

    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_2e
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "\u9078\u629e\u4e2d: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\u4ef6"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_44
    return-void
.end method
