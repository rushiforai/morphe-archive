.class public Lz9k;
.super Leog;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Luim;-><init>()V

    return-void
.end method

.method public static l0(ILandroid/content/Context;)Ljava/lang/String;
    .registers 8

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_1f

    const/4 v0, 0x1

    if-eq p0, v0, :cond_17

    const/4 v0, 0x2

    if-eq p0, v0, :cond_f

    const-string p0, ""

    return-object p0

    :cond_f
    const p0, 0x7f1410ae

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_17
    const p0, 0x7f1410ad

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1f
    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    iget-wide v0, p0, Lwnh;->b:J

    const-wide/32 v2, 0x36ee80

    cmp-long p0, v0, v2

    if-gez p0, :cond_4f

    const-wide/32 v2, 0xea5f

    add-long/2addr v0, v2

    const-wide/32 v2, 0xea60

    div-long/2addr v0, v2

    long-to-int p0, v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f120031

    invoke-virtual {v0, v2, p0, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_68

    :cond_4f
    const-wide/32 v4, 0x36ee7f

    add-long/2addr v0, v4

    div-long/2addr v0, v2

    long-to-int p0, v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f120030

    invoke-virtual {v0, v2, p0, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_68
    const v0, 0x7f1410af

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 15

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lps5;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-direct {p1, v0}, Lbud;-><init>(Landroid/content/Context;)V

    iput-object p0, p1, Lbud;->c:Leog;

    iput-object p0, p1, Lps5;->e:Leog;

    const v0, 0x7f1410ac

    invoke-virtual {p1, v0}, Lps5;->setHeaderTitle(I)Landroid/view/ContextMenu;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->y()I

    move-result v1

    const/4 v2, 0x3

    invoke-static {v2}, Lvep;->B(I)[I

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_32
    const/4 v7, 0x1

    if-ge v6, v4, :cond_68

    aget v8, v3, v6

    if-ne v8, v7, :cond_4f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v9

    invoke-virtual {v9}, Lno7;->i()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lwnh;

    iget-wide v9, v9, Lwnh;->b:J

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-eqz v9, :cond_65

    :cond_4f
    invoke-static {v8}, Lvep;->A(I)I

    move-result v9

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v8, v10}, Lz9k;->l0(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1, v7, v9, v5, v10}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v9

    if-eq v8, v1, :cond_62

    move v7, v5

    :cond_62
    invoke-virtual {v9, v7}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    :cond_65
    add-int/lit8 v6, v6, 0x1

    goto :goto_32

    :cond_68
    new-instance v1, Laxe;

    invoke-direct {v1, v0, v2}, Laxe;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-virtual {p1, v7, v7, v7}, Lbud;->setGroupCheckable(IZZ)V

    iput-object p1, p0, Leog;->d:Lps5;

    return-void
.end method
