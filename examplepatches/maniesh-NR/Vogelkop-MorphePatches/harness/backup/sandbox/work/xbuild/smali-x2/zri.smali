.class public final Lzri;
.super Lfmj;
.source "SourceFile"


# instance fields
.field public final f:Z

.field public final g:Le3g;

.field public final h:I

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;I)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lfmj;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V

    iput-boolean p3, p0, Lzri;->f:Z

    new-instance p2, Le3g;

    const/4 p3, 0x2

    invoke-direct {p2, p1, p0, p3}, Le3g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lzri;->g:Le3g;

    const/high16 p2, 0x40800000    # 4.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-static {p2, p3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lzri;->h:I

    new-instance p2, Lyri;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lyri;-><init>(Lzri;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lyri;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lyri;-><init>(Lzri;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lkkf;

    const/16 p3, 0xe

    invoke-direct {p2, p0, p3}, Lkkf;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p0

    if-nez p0, :cond_3f

    return-void

    :cond_3f
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 7

    check-cast p1, Lfqk;

    iput-object p1, p0, Lfmj;->d:Lfqk;

    iget-object p2, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v0, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    iput-object p2, v0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p2, :cond_20

    iget-object v1, p2, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    new-instance v2, Lqxh;

    invoke-direct {v2, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object v1, p2, Lcom/opera/android/suggestion/Suggestion;->c:Ljava/lang/String;

    new-instance v2, Lqxh;

    invoke-direct {v2, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    :cond_20
    sget-object v1, Lyne;->b:Ldeg;

    iget-object v2, p0, Lzri;->g:Le3g;

    invoke-virtual {v1, v2}, Ldeg;->b(Lacl;)V

    iget-object v3, p2, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4d

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const v1, 0x7f0805e5

    invoke-static {v1, p2}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {p2}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    new-instance p2, Lmxh;

    invoke-direct {p2, v1}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lzri;->i:Z

    goto :goto_6e

    :cond_4d
    iget-object v0, p2, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object v0

    iget-object v1, v0, Ldwh;->b:Lgvh;

    iget v3, p0, Lfmj;->e:I

    invoke-virtual {v1, v3, v3}, Lgvh;->b(II)V

    iget v1, p0, Lzri;->h:I

    iget p2, p2, Lcom/opera/android/suggestion/Suggestion;->i:I

    invoke-static {v3, v1, p2}, Lj14;->E(III)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object p2

    invoke-virtual {v0, p2}, Ldwh;->k(Landroid/graphics/drawable/ShapeDrawable;)V

    invoke-virtual {v0}, Ldwh;->b()V

    invoke-virtual {v0, v2}, Ldwh;->f(Lacl;)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lzri;->i:Z

    :goto_6e
    iget-boolean p2, p0, Lzri;->f:Z

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p0, p2, p1}, Lfmj;->Z(ILcom/opera/android/suggestion/Suggestion;)V

    return-void
.end method

.method public final Y()V
    .registers 3

    sget-object v0, Lyne;->b:Ldeg;

    iget-object v1, p0, Lzri;->g:Le3g;

    invoke-virtual {v0, v1}, Ldeg;->b(Lacl;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lzri;->i:Z

    return-void
.end method
