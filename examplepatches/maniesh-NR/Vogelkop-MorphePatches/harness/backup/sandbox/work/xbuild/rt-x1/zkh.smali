.class public final Lzkh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroidx/recyclerview/widget/i;


# direct methods
.method public synthetic constructor <init>(Landroidx/recyclerview/widget/i;B)V
    .registers 3

    iput-byte p2, p0, Lzkh;->a:B

    iput-object p1, p0, Lzkh;->b:Landroidx/recyclerview/widget/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 8

    iget-byte v0, p0, Lzkh;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lzkh;->b:Landroidx/recyclerview/widget/i;

    packed-switch v0, :pswitch_data_9a

    check-cast p0, Luyk;

    iget-object p0, p0, Luyk;->e:Lvyk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v0, 0x7f0a0b24

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/sync/SyncedSessionTab;

    iget-object v2, v0, Lcom/opera/android/sync/SyncedSessionTab;->d:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_22

    iget-object v2, v0, Lcom/opera/android/sync/SyncedSessionTab;->c:Ljava/lang/String;

    :cond_22
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Leog;->i0(Landroid/content/Context;)Lpyc;

    move-result-object p0

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    iget-object v4, p0, Ltim;->a:Luim;

    check-cast v4, Leog;

    new-instance v5, Ltyk;

    invoke-direct {v5, v3, v2, p1}, Ltyk;-><init>(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Landroid/content/Context;)V

    iput-object v5, v4, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    iget-object v3, v4, Leog;->d:Lps5;

    new-instance v4, Landroid/view/MenuInflater;

    invoke-direct {v4, p1}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    const p1, 0x7f100024

    invoke-virtual {v4, p1, v3}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    invoke-virtual {v3, v2}, Lps5;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {v0, p0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return v1

    :pswitch_66
    check-cast p0, Lalh;

    iget-object p1, p0, Lalh;->l:Lblh;

    iget-object v0, p0, Lalh;->j:Lwkh;

    if-eqz v0, :cond_98

    iget-object v0, p1, Lblh;->b:Lzg7;

    invoke-virtual {v0}, Loy;->e()Z

    move-result v0

    if-nez v0, :cond_98

    iget-object v0, p1, Lblh;->g:Lxkh;

    iget v0, v0, Lxkh;->b:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_8a

    iget-object v0, p0, Lyzi;->b:Ltzi;

    invoke-virtual {v0}, Ltzi;->d()V

    iget-object p1, p1, Lblh;->k:Lvi7;

    iget-object p1, p1, Lvi7;->g:Lflb;

    invoke-virtual {p1, p0}, Lflb;->s(Landroidx/recyclerview/widget/i;)V

    goto :goto_95

    :cond_8a
    iget-object p1, p1, Lblh;->d:Le5d;

    iget-object v0, p0, Lalh;->j:Lwkh;

    iget-object v0, v0, Lwkh;->a:Lilh;

    iget-wide v2, v0, Lilh;->a:J

    invoke-virtual {p1, v2, v3}, Le5d;->d(J)V

    :goto_95
    invoke-virtual {p0}, Lalh;->h0()V

    :cond_98
    return v1

    nop

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_66
    .end packed-switch
.end method
