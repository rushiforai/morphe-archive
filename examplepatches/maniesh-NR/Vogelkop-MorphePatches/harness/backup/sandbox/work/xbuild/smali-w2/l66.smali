.class public final Ll66;
.super Llsk;
.source "SourceFile"


# instance fields
.field public final synthetic g:Lr9i;


# direct methods
.method public constructor <init>(Lr9i;Ldkf;)V
    .registers 3

    iput-object p1, p0, Ll66;->g:Lr9i;

    invoke-direct {p0, p2}, Llsk;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final inflate(ILandroid/view/Menu;)V
    .registers 6

    invoke-interface {p2}, Landroid/view/Menu;->size()I

    move-result v0

    invoke-super {p0, p1, p2}, Llsk;->inflate(ILandroid/view/Menu;)V

    iget-object p0, p0, Ll66;->g:Lr9i;

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Ldkf;

    invoke-interface {p2}, Landroid/view/Menu;->size()I

    move-result p1

    const/4 v1, 0x0

    sget-object v2, Lo66;->G:[I

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 v1, 0x0

    :try_start_19
    invoke-virtual {p0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1
    :try_end_1d
    .catchall {:try_start_19 .. :try_end_1d} :catchall_35

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz v1, :cond_34

    :goto_22
    if-ge v0, p1, :cond_34

    invoke-interface {p2, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object p0

    instance-of v2, p0, Lptd;

    if-eqz v2, :cond_31

    check-cast p0, Lptd;

    invoke-static {p0, v1}, Lo66;->l(Lptd;Landroid/content/res/ColorStateList;)V

    :cond_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    :cond_34
    return-void

    :catchall_35
    move-exception p1

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    throw p1
.end method
