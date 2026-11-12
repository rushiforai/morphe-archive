.class public final synthetic Lyt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcbk;Lhq8;IZLqpm;Ljava/lang/Runnable;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lyt3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyt3;->d:Ljava/lang/Object;

    iput-object p2, p0, Lyt3;->e:Ljava/lang/Object;

    iput p3, p0, Lyt3;->b:I

    iput-boolean p4, p0, Lyt3;->c:Z

    iput-object p5, p0, Lyt3;->f:Ljava/lang/Object;

    iput-object p6, p0, Lyt3;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ld7l;Landroid/widget/FrameLayout;Landroid/view/View;Lcom/opera/android/BrowserActivity;IZ)V
    .registers 8

    .line 19
    const/4 v0, 0x0

    iput-byte v0, p0, Lyt3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyt3;->d:Ljava/lang/Object;

    iput-object p2, p0, Lyt3;->e:Ljava/lang/Object;

    iput-object p3, p0, Lyt3;->f:Ljava/lang/Object;

    iput-object p4, p0, Lyt3;->g:Ljava/lang/Object;

    iput p5, p0, Lyt3;->b:I

    iput-boolean p6, p0, Lyt3;->c:Z

    return-void
.end method

.method public synthetic constructor <init>(Lqln;Ljava/lang/Integer;ZLjava/lang/String;ILcom/opera/api/Callback;)V
    .registers 8

    .line 20
    const/4 v0, 0x2

    iput-byte v0, p0, Lyt3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyt3;->d:Ljava/lang/Object;

    iput-object p2, p0, Lyt3;->e:Ljava/lang/Object;

    iput-boolean p3, p0, Lyt3;->c:Z

    iput-object p4, p0, Lyt3;->f:Ljava/lang/Object;

    iput p5, p0, Lyt3;->b:I

    iput-object p6, p0, Lyt3;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Lyt3;->a:B

    iget-object v2, v0, Lyt3;->g:Ljava/lang/Object;

    iget-object v3, v0, Lyt3;->f:Ljava/lang/Object;

    iget-object v4, v0, Lyt3;->e:Ljava/lang/Object;

    iget-object v5, v0, Lyt3;->d:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_bc

    move-object v7, v5

    check-cast v7, Lqln;

    move-object v8, v4

    check-cast v8, Ljava/lang/Integer;

    move-object v10, v3

    check-cast v10, Ljava/lang/String;

    move-object v12, v2

    check-cast v12, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Ldnn;

    new-instance v6, Lm59;

    iget-boolean v9, v0, Lyt3;->c:Z

    iget v11, v0, Lyt3;->b:I

    invoke-direct/range {v6 .. v12}, Lm59;-><init>(Lqln;Ljava/lang/Integer;ZLjava/lang/String;ILcom/opera/api/Callback;)V

    invoke-virtual {v1, v6}, Ldnn;->a(Lann;)V

    return-void

    :pswitch_2c
    check-cast v5, Lcbk;

    check-cast v4, Lhq8;

    move-object v14, v3

    check-cast v14, Lqpm;

    move-object v15, v2

    check-cast v15, Ljava/lang/Runnable;

    move-object/from16 v13, p1

    check-cast v13, Landroid/graphics/drawable/Drawable;

    iget-object v1, v5, Lcbk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    new-instance v6, Lfzj;

    iget-object v2, v5, Lcbk;->e:Ljava/lang/Object;

    check-cast v2, Llgf;

    iget-object v3, v2, Llgf;->c:Ljava/lang/Object;

    move-object v7, v3

    check-cast v7, Landroid/content/Context;

    iget-object v2, v2, Llgf;->e:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Lesk;

    invoke-virtual {v4}, Lhq8;->h()Ljava/lang/String;

    move-result-object v9

    sget-object v2, Lp6l;->a:Lp6l;

    invoke-virtual {v4, v2}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v10

    iget v11, v0, Lyt3;->b:I

    iget-boolean v12, v0, Lyt3;->c:Z

    invoke-direct/range {v6 .. v15}, Lfzj;-><init>(Landroid/content/Context;Lesk;Ljava/lang/String;Ljava/lang/String;IZLandroid/graphics/drawable/Drawable;Lqpm;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Lcbk;->b()V

    return-void

    :pswitch_66
    move-object v8, v5

    check-cast v8, Ld7l;

    move-object v9, v4

    check-cast v9, Landroid/widget/FrameLayout;

    move-object v10, v3

    check-cast v10, Landroid/view/View;

    check-cast v2, Lcom/opera/android/BrowserActivity;

    move-object/from16 v1, p1

    check-cast v1, Lyni;

    sget v3, Lcom/opera/android/BrowserActivity;->E1:I

    const/4 v3, 0x0

    if-eqz v1, :cond_7d

    iget-object v1, v1, Lyni;->a:Landroid/graphics/Bitmap;

    goto :goto_7e

    :cond_7d
    move-object v1, v3

    :goto_7e
    invoke-virtual {v2}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object v11

    iget-object v2, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v2, :cond_88

    move-object v12, v3

    goto :goto_89

    :cond_88
    move-object v12, v2

    :goto_89
    if-nez v1, :cond_90

    const/4 v0, 0x3

    invoke-virtual {v12, v8, v0}, Lk6l;->C(Lb2l;I)V

    goto :goto_bb

    :cond_90
    new-instance v7, Lxbf;

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v13, Lw3a;

    new-instance v14, Landroid/graphics/drawable/InsetDrawable;

    new-instance v15, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v15, v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v16, 0x0

    iget v1, v0, Lyt3;->b:I

    move/from16 v17, v1

    invoke-direct/range {v14 .. v19}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    const/16 v1, 0x30

    const/4 v2, 0x0

    invoke-direct {v13, v14, v1, v2}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    iget-boolean v14, v0, Lyt3;->c:Z

    invoke-direct/range {v7 .. v14}, Lxbf;-><init>(Ld7l;Landroid/widget/FrameLayout;Landroid/view/View;Lcom/opera/android/browser/chromium/ChromiumContainerView;Lk6l;Lw3a;Z)V

    :goto_bb
    return-void

    :pswitch_data_bc
    .packed-switch 0x0
        :pswitch_66
        :pswitch_2c
    .end packed-switch
.end method
