.class public final synthetic Lys2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroidx/recyclerview/widget/i;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroidx/recyclerview/widget/i;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lys2;->a:B

    iput-object p1, p0, Lys2;->b:Landroidx/recyclerview/widget/i;

    iput-object p2, p0, Lys2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 13

    iget-byte v0, p0, Lys2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object v5, p0, Lys2;->c:Ljava/lang/Object;

    iget-object p0, p0, Lys2;->b:Landroidx/recyclerview/widget/i;

    packed-switch v0, :pswitch_data_15c

    check-cast p0, Lxb9;

    check-cast v5, Lja2;

    invoke-virtual {p0, v5}, Lxb9;->f0(Lja2;)V

    return v4

    :pswitch_15
    check-cast p0, Lmz7;

    check-cast v5, Landroid/content/Context;

    new-instance v0, Lqy7;

    iget-object v6, p0, Lmz7;->g:Lnz7;

    if-eqz v6, :cond_20

    move-object v3, v6

    :cond_20
    new-instance v6, Ljf7;

    const/16 v7, 0x8

    invoke-direct {v6, p0, p1, v7}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v5, p1, v3, v6}, Lqy7;-><init>(Landroid/content/Context;Landroid/view/View;Lnz7;Ljf7;)V

    new-instance v3, Lua7;

    invoke-direct {v3, v5, v0, p1}, Lua7;-><init>(Landroid/content/Context;Lqy7;Landroid/view/View;)V

    iput-object v3, p0, Lmz7;->h:Lua7;

    iget-object p0, v3, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/PopupWindow;

    new-array v2, v2, [I

    invoke-virtual {p1, v2}, Landroid/view/View;->getLocationInWindow([I)V

    aget v3, v2, v1

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    add-float/2addr v6, v3

    iget-object v3, v0, Lqy7;->d:Ln1;

    invoke-virtual {v3}, Ln1;->m0()I

    move-result v8

    iget-object v9, v0, Lqy7;->a:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v10

    mul-int/2addr v10, v8

    iget-object v0, v0, Lqy7;->c:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingStart()I

    move-result v8

    add-int/2addr v8, v10

    invoke-virtual {v0}, Landroid/view/View;->getPaddingEnd()I

    move-result v10

    add-int/2addr v10, v8

    int-to-float v8, v10

    div-float/2addr v8, v7

    sub-float/2addr v6, v8

    aget v2, v2, v4

    invoke-virtual {v3}, Ln1;->n0()I

    move-result v3

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v7

    mul-int/2addr v7, v3

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    add-int/2addr v3, v7

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    add-int/2addr v0, v3

    sub-int/2addr v2, v0

    const v0, 0x7f080936

    invoke-virtual {v5, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v4}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    invoke-virtual {p0, v4}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    const v0, 0x7f1506b0

    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f0701d9

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setElevation(F)V

    :try_start_a1
    invoke-static {v6}, Lzed;->b(F)I

    move-result v0

    invoke-virtual {p0, p1, v1, v0, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_a8
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_a1 .. :try_end_a8} :catch_a9

    goto :goto_b2

    :catch_a9
    const-string p0, "Don\'t use EmojiPickerView inside a Popup"

    invoke-static {v5, p0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_b2
    return v4

    :pswitch_b3
    check-cast p0, Lxt5;

    check-cast v5, Lcv2;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v0, -0x1

    if-eq p0, v0, :cond_c3

    move-object v3, p1

    :cond_c3
    if-eqz v3, :cond_c8

    invoke-virtual {v5, v3}, Lcv2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c8
    return v4

    :pswitch_c9
    check-cast p0, Lzs2;

    check-cast v5, Lole;

    iget-object p0, p0, Lzs2;->d:Lru2;

    if-eqz p0, :cond_15b

    iget-object p1, p0, Lru2;->b:Ljava/lang/String;

    iget-object v0, v5, Lole;->a:Ljava/lang/Object;

    check-cast v0, Lbt2;

    iget-object v5, v0, Lbt2;->e:Lhp2;

    invoke-virtual {v5}, Lhp2;->a()Z

    move-result v5

    if-nez v5, :cond_15b

    iget-object v0, v0, Lbt2;->g:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :cond_e5
    :goto_e5
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_15b

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lss2;

    iget-object v5, v5, Lss2;->a:Lts2;

    iget v6, v5, Lts2;->b:I

    if-eqz v6, :cond_f9

    if-ne v6, v2, :cond_e5

    :cond_f9
    new-instance v7, Lq3;

    const/16 v8, 0x1c

    invoke-direct {v7, v5, p0, v8}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v8, 0x3

    if-ne v6, v8, :cond_10b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_10b

    move-object v6, p1

    goto :goto_10d

    :cond_10b
    iget-object v6, p0, Lru2;->c:Ljava/lang/String;

    :goto_10d
    new-instance v8, Lrxh;

    const v9, 0x7f1401b7

    invoke-direct {v8, v9}, Lrxh;-><init>(I)V

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    new-instance v9, Lsxh;

    const v10, 0x7f140283

    invoke-direct {v9, v10, v8}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v8, Lxj;

    const/16 v10, 0x10

    invoke-direct {v8, v7, p0, v10}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v7, Lgkj;

    invoke-direct {v7, v1, v1}, Lnz0;-><init>(ZZ)V

    iput-object v3, v7, Lgkj;->a:Ljava/lang/String;

    iput-object v3, v7, Lgkj;->b:Ljava/lang/String;

    iput-object v3, v7, Lgkj;->c:Ljava/lang/String;

    iput-object v6, v7, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v3, v7, Lgkj;->e:Lekj;

    iput-object v3, v7, Lgkj;->f:Lfkj;

    iput-object v3, v7, Lgkj;->g:Lqp2;

    iput-object v8, v7, Lgkj;->h:Ldkj;

    iput-object v3, v7, Lgkj;->i:Ldkj;

    iput-object v3, v7, Lgkj;->j:Lql;

    const v6, 0x7f140bbb

    iput v6, v7, Lgkj;->k:I

    const v6, 0x7f1403bf

    iput v6, v7, Lgkj;->l:I

    iput v1, v7, Lgkj;->m:I

    iput-boolean v4, v7, Lgkj;->n:Z

    iput-object v9, v7, Lgkj;->o:Lpxh;

    iget-object v5, v5, Lts2;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v5, v5, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-eqz v5, :cond_e5

    invoke-interface {v5, v7}, Lcom/opera/android/browser/dialog/DialogDelegate;->a(Lnz0;)V

    goto :goto_e5

    :cond_15b
    return v4

    :pswitch_data_15c
    .packed-switch 0x0
        :pswitch_c9
        :pswitch_b3
        :pswitch_15
    .end packed-switch
.end method
