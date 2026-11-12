.class public final Lf9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Llag;

.field public final synthetic c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lg9g;


# direct methods
.method public constructor <init>(Lg9g;Ljava/util/ArrayList;Llag;Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lf9g;->a:Ljava/util/ArrayList;

    iput-object p3, p0, Lf9g;->b:Llag;

    iput-object p4, p0, Lf9g;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p5, p0, Lf9g;->d:Ljava/lang/String;

    iput-object p1, p0, Lf9g;->e:Lg9g;

    return-void
.end method


# virtual methods
.method public final a(Lkag;)V
    .registers 9

    sget-object v0, Ls9g;->h:Ls9g;

    iget-object v6, p0, Lf9g;->e:Lg9g;

    iget-object v2, v6, Lg9g;->w:Ljava/lang/String;

    iget-object v3, p0, Lf9g;->b:Llag;

    const/4 v5, 0x1

    const/4 v1, 0x0

    move-object v4, p1

    invoke-virtual/range {v0 .. v5}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    invoke-virtual {v6}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lf9g;->d:Ljava/lang/String;

    iget-object v1, p0, Lf9g;->b:Llag;

    invoke-static {p1, v1, v4, v0}, Lui6;->R(Landroid/content/Context;Llag;Lkag;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lqxh;

    invoke-direct {v0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lf9g;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-static {v1, v4}, Lui6;->z(Llag;Lkag;)I

    move-result p1

    new-instance v0, Llxh;

    invoke-direct {v0, p1}, Llxh;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 7

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    iget-object v0, p0, Lf9g;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkag;

    iget-object v0, p0, Lf9g;->e:Lg9g;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.opera.android.permissions.PermissionHandlerService"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsz4;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lf9g;->b:Llag;

    sget-object v3, Llag;->b:Llag;

    if-ne v2, v3, :cond_3b

    sget-object v2, Lkag;->b:Lkag;

    if-ne p1, v2, :cond_3b

    invoke-static {v1}, Lyi4;->T(Lsz4;)Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-static {v0}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v2

    new-instance v3, Leof;

    const/4 v4, 0x7

    invoke-direct {v3, p0, p1, v4}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v1, v2, v3}, Lyi4;->R(Landroid/content/Context;Lsz4;Loi;Lcom/opera/api/Callback;)V

    goto :goto_3e

    :cond_3b
    invoke-virtual {p0, p1}, Lf9g;->a(Lkag;)V

    :goto_3e
    const/4 p0, 0x1

    return p0
.end method
