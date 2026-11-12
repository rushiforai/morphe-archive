.class public final Lsoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:[Lkag;

.field public final synthetic b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final synthetic c:Ltoj;


# direct methods
.method public constructor <init>(Ltoj;[Lkag;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lsoj;->a:[Lkag;

    iput-object p3, p0, Lsoj;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p1, p0, Lsoj;->c:Ltoj;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 5

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    iget-object v0, p0, Lsoj;->a:[Lkag;

    aget-object p1, v0, p1

    sget-object v0, Ls9g;->h:Ls9g;

    iget-object v1, p0, Lsoj;->c:Ltoj;

    iget-object v1, v1, Ltoj;->c:Luoj;

    iget-object v2, v1, Luoj;->t:Llag;

    invoke-virtual {v0, v2, p1}, Ls9g;->p(Llag;Lkag;)V

    iget-object p0, p0, Lsoj;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, p0}, Luoj;->H0(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    const/4 p0, 0x1

    return p0
.end method
