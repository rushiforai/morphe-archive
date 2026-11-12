.class public final Ltu8;
.super Llx8;
.source "SourceFile"

# interfaces
.implements Lxa2;
.implements Lza2;


# instance fields
.field public final d:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

.field public final e:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 5

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0471

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iput-object v0, p0, Ltu8;->d:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v1, Lyk4;

    const/16 v2, 0x18

    invoke-direct {v1, p0, v2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0a0472

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Ltu8;->e:Landroid/widget/ImageView;

    new-instance v1, Le73;

    const/4 v2, 0x6

    invoke-direct {v1, p0, p1, v2}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final H()V
    .registers 2

    iget-object p0, p0, Ltu8;->d:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    return-void
.end method

.method public final J(Lwa2;)V
    .registers 2

    const/4 p0, 0x0

    iput-boolean p0, p1, Lwa2;->c:Z

    return-void
.end method

.method public final U()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public final V(Lja2;Z)V
    .registers 3

    check-cast p1, Luu8;

    iget-boolean p1, p1, Luu8;->d:Z

    iget-object p0, p0, Ltu8;->d:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    return-void
.end method
