.class public final Ldu;
.super Leu;
.source "SourceFile"

# interfaces
.implements Lh4a;


# instance fields
.field public final c:Ljt;

.field public final d:Lbs;

.field public e:Lhs;

.field public final f:I

.field public g:Lvmj;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lbs;)V
    .registers 5

    const v0, 0x7f0d0031

    const/4 v1, 0x0

    invoke-static {p1, v0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_35

    new-instance v0, Ljt;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ljt;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;B)V

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Ldu;->c:Ljt;

    iput-object p2, p0, Ldu;->d:Lbs;

    const/high16 p2, 0x42000000    # 32.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p2, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Ldu;->f:I

    new-instance p2, Lgf;

    const/4 v0, 0x7

    invoke-direct {p2, p0, v0}, Lgf;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lks8;

    const/4 v0, 0x2

    invoke-direct {p0, p2, v0}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_35
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final U(Ljs;)V
    .registers 7

    check-cast p1, Lhs;

    iget-object v0, p0, Ldu;->c:Ljt;

    iget-object v0, v0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p1, Lhs;->c:Ljava/lang/String;

    new-instance v2, Lqxh;

    invoke-direct {v2, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object v2, p0, Ldu;->g:Lvmj;

    if-eqz v2, :cond_32

    iget-object v2, p0, Ldu;->e:Lhs;

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    invoke-static {v1}, Llah;->h(Ljava/lang/String;)Lanj;

    move-result-object v4

    iget-object v2, v2, Lhs;->c:Ljava/lang/String;

    invoke-static {v2}, Llah;->h(Ljava/lang/String;)Lanj;

    move-result-object v2

    invoke-virtual {v4}, Lanj;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lanj;->a()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    xor-int/2addr v3, v2

    :cond_30
    if-eqz v3, :cond_52

    :cond_32
    sget v2, Lvmj;->g:I

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "https://"

    invoke-static {v3, v1}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object v3

    invoke-static {v3}, Lorg/chromium/url/GURL;->i(Lorg/chromium/url/GURL;)Z

    move-result v4

    if-nez v4, :cond_48

    invoke-virtual {v3}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v1

    :cond_48
    const/16 v3, 0x10

    iget v4, p0, Ldu;->f:I

    invoke-static {v2, v1, v4, v4, v3}, Ltmj;->j(Landroid/content/Context;Ljava/lang/String;III)Lvmj;

    move-result-object v1

    iput-object v1, p0, Ldu;->g:Lvmj;

    :cond_52
    iget-object v1, p0, Ldu;->g:Lvmj;

    new-instance v2, Lmxh;

    invoke-direct {v2, v1}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    iput-object p1, p0, Ldu;->e:Lhs;

    return-void
.end method

.method public final l(Landroid/graphics/Rect;)V
    .registers 2

    const/4 p0, 0x0

    invoke-virtual {p1, p0, p0, p0, p0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method
