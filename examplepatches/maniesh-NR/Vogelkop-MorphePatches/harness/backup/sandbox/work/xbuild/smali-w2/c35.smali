.class public final Lc35;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lr25;

.field public final b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public c:Z

.field public d:I

.field public e:Z

.field public final synthetic f:Le35;


# direct methods
.method public constructor <init>(Le35;Lr25;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc35;->f:Le35;

    iput-object p2, p0, Lc35;->a:Lr25;

    iget-object v0, p1, Le35;->s:Landroid/view/LayoutInflater;

    iget-object v1, p1, Le35;->t:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    const v3, 0x7f0d0380

    invoke-virtual {v0, v3, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object v0, p0, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p0, p1, Le35;->t:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p0, p2, Lr25;->b:Lrxh;

    invoke-virtual {v0, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    new-instance p0, Lrxh;

    const v1, 0x7f140f98

    invoke-direct {p0, v1}, Lrxh;-><init>(I)V

    invoke-virtual {v0, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget p0, p2, Lr25;->d:I

    new-instance p2, Llxh;

    invoke-direct {p2, p0}, Llxh;-><init>(I)V

    invoke-virtual {v0, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    new-instance p0, Ljl4;

    const/16 p2, 0xb

    invoke-direct {p0, p1, p2}, Ljl4;-><init>(Ljava/lang/Object;B)V

    iput-object p0, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 3

    iget-boolean v0, p0, Lc35;->e:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object p0, p0, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    return-void
.end method
