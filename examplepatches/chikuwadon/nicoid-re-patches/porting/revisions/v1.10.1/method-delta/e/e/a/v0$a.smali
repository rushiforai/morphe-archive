.class public final Le/e/a/v0$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/v0;->b(Landroid/content/Context;)Landroid/view/View$OnTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public a:Landroid/app/AlertDialog;

.field public b:[I

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:[Ljava/lang/String;

.field public final synthetic e:I

.field public final synthetic f:Landroid/content/res/Resources;

.field public final synthetic g:Landroid/widget/LinearLayout$LayoutParams;

.field public final synthetic i:[I

.field public final synthetic j:Landroid/widget/LinearLayout$LayoutParams;


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 23

    move-object/from16 v0, p0

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_c

    :goto_9
    const/4 v1, 0x1

    goto/16 :goto_367

    :cond_c
    iget-object v1, v0, Le/e/a/v0$a;->b:[I

    move-object/from16 v3, p1

    check-cast v3, Landroid/widget/EditText;

    new-instance v4, Landroid/widget/EditText;

    iget-object v5, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setInputType(I)V

    new-instance v5, Landroid/app/AlertDialog$Builder;

    iget-object v6, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v6, Le/e/a/v0$a$a;

    invoke-direct {v6, v0, v3, v4, v1}, Le/e/a/v0$a$a;-><init>(Le/e/a/v0$a;Landroid/widget/EditText;Landroid/widget/EditText;[I)V

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v6, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    const v7, 0x7f0f0052

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Le/e/a/v0$a$b;

    invoke-direct {v7, v0, v3, v4, v1}, Le/e/a/v0$a$b;-><init>(Le/e/a/v0$a;Landroid/widget/EditText;Landroid/widget/EditText;[I)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v3, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    const v6, 0x7f0f002d

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v6, Le/e/a/v0$a$c;

    invoke-direct {v6, v0}, Le/e/a/v0$a$c;-><init>(Le/e/a/v0$a;)V

    invoke-virtual {v5, v3, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const/4 v3, 0x3

    new-array v6, v3, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "ue"

    aput-object v8, v6, v7

    const/4 v8, 0x0

    aput-object v8, v6, v2

    const/4 v9, 0x2

    const-string v10, "shita"

    aput-object v10, v6, v9

    new-array v10, v3, [I

    fill-array-data v10, :array_368

    array-length v11, v6

    new-instance v12, Landroid/widget/SeekBar;

    iget-object v13, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    add-int/lit8 v13, v11, -0x1

    invoke-virtual {v12, v13}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v13, v0, Le/e/a/v0$a;->b:[I

    aget v13, v13, v7

    invoke-virtual {v12, v13}, Landroid/widget/SeekBar;->setProgress(I)V

    new-instance v13, Le/e/a/v0$a$d;

    invoke-direct {v13, v0, v1, v6, v4}, Le/e/a/v0$a$d;-><init>(Le/e/a/v0$a;[I[Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {v12, v13}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget v13, v0, Le/e/a/v0$a;->e:I

    div-int v14, v13, v11

    div-int/2addr v14, v9

    div-int/2addr v13, v11

    div-int/2addr v13, v9

    invoke-virtual {v12, v14, v7, v13, v7}, Landroid/widget/SeekBar;->setPadding(IIII)V

    new-instance v11, Landroid/graphics/drawable/ColorDrawable;

    invoke-static {v7}, Landroid/graphics/Color;->alpha(I)I

    move-result v13

    invoke-direct {v11, v13}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v12, v11}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v11, v0, Le/e/a/v0$a;->f:Landroid/content/res/Resources;

    const v13, 0x7f0b006a

    invoke-virtual {v11, v13}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v12, v11}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    iget-object v11, v0, Le/e/a/v0$a;->g:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v12, v11}, Landroid/widget/SeekBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v11, Landroid/widget/LinearLayout;

    iget-object v14, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v11, v14}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v14, -0x1

    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    iget v14, v0, Le/e/a/v0$a;->e:I

    iget-object v13, v0, Le/e/a/v0$a;->i:[I

    aget v13, v13, v2

    invoke-direct {v15, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v15}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v13, 0x0

    :goto_d0
    array-length v14, v6

    if-ge v13, v14, :cond_120

    new-instance v14, Landroid/widget/LinearLayout;

    iget-object v8, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v14, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v8, Landroid/widget/ImageView;

    iget-object v3, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v8, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    aget v3, v10, v13

    iget-object v9, v0, Le/e/a/v0$a;->i:[I

    aget v15, v9, v7

    aget v9, v9, v2

    iget-object v2, v0, Le/e/a/v0$a;->f:Landroid/content/res/Resources;

    invoke-static {v3, v15, v9, v2}, Le/e/a/v0;->a(IIILandroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, v0, Le/e/a/v0$a;->j:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v8, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v2, -0x1000000

    invoke-virtual {v8, v2}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    new-instance v2, Le/e/a/v0$a$e;

    invoke-direct {v2, v0, v12, v13}, Le/e/a/v0$a$e;-><init>(Le/e/a/v0$a;Landroid/widget/SeekBar;I)V

    invoke-virtual {v8, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    aget v2, v10, v13

    invoke-virtual {v14, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v2, v0, Le/e/a/v0$a;->j:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v14, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v2, 0x11

    invoke-virtual {v14, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v14, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v13, v13, 0x1

    const/4 v2, 0x1

    const/4 v3, 0x3

    const/4 v8, 0x0

    const/4 v9, 0x2

    goto :goto_d0

    :cond_120
    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/String;

    const-string v6, "big"

    aput-object v6, v3, v7

    const/4 v6, 0x0

    const/4 v8, 0x1

    aput-object v6, v3, v8

    const-string v6, "small"

    const/4 v8, 0x2

    aput-object v6, v3, v8

    new-array v6, v2, [I

    fill-array-data v6, :array_372

    array-length v2, v3

    new-instance v9, Landroid/widget/SeekBar;

    iget-object v13, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v9, v13}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    add-int/lit8 v13, v2, -0x1

    invoke-virtual {v9, v13}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v13, v0, Le/e/a/v0$a;->b:[I

    aget v13, v13, v8

    invoke-virtual {v9, v13}, Landroid/widget/SeekBar;->setProgress(I)V

    new-instance v13, Le/e/a/v0$a$f;

    invoke-direct {v13, v0, v1, v3, v4}, Le/e/a/v0$a$f;-><init>(Le/e/a/v0$a;[I[Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {v9, v13}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget v13, v0, Le/e/a/v0$a;->e:I

    div-int v14, v13, v2

    div-int/2addr v14, v8

    div-int/2addr v13, v2

    div-int/2addr v13, v8

    invoke-virtual {v9, v14, v7, v13, v7}, Landroid/widget/SeekBar;->setPadding(IIII)V

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-static {v7}, Landroid/graphics/Color;->alpha(I)I

    move-result v8

    invoke-direct {v2, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v9, v2}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, v0, Le/e/a/v0$a;->f:Landroid/content/res/Resources;

    const v8, 0x7f0b006a

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, v0, Le/e/a/v0$a;->g:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v9, v2}, Landroid/widget/SeekBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v8, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v2, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v8, -0x1

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget v13, v0, Le/e/a/v0$a;->e:I

    iget-object v14, v0, Le/e/a/v0$a;->i:[I

    const/4 v15, 0x1

    aget v14, v14, v15

    invoke-direct {v8, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v8, 0x0

    :goto_196
    array-length v13, v3

    if-ge v8, v13, :cond_1ed

    new-instance v13, Landroid/widget/LinearLayout;

    iget-object v14, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v13, v14}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v14, Landroid/widget/ImageView;

    iget-object v15, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v14, v15}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    aget v15, v6, v8

    move-object/from16 p1, v3

    iget-object v3, v0, Le/e/a/v0$a;->i:[I

    move-object/from16 v19, v6

    aget v6, v3, v7

    const/16 v18, 0x1

    aget v3, v3, v18

    iget-object v7, v0, Le/e/a/v0$a;->f:Landroid/content/res/Resources;

    invoke-static {v15, v6, v3, v7}, Le/e/a/v0;->a(IIILandroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v14, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v3, v0, Le/e/a/v0$a;->j:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v14, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v3, -0x1000000

    invoke-virtual {v14, v3}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    new-instance v6, Le/e/a/v0$a$g;

    invoke-direct {v6, v0, v9, v8}, Le/e/a/v0$a$g;-><init>(Le/e/a/v0$a;Landroid/widget/SeekBar;I)V

    invoke-virtual {v14, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    aget v6, v10, v8

    invoke-virtual {v13, v6}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v6, v0, Le/e/a/v0$a;->j:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v13, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v6, 0x11

    invoke-virtual {v13, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v13, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v3, p1

    move-object/from16 v6, v19

    const/4 v7, 0x0

    goto :goto_196

    :cond_1ed
    const/16 v3, 0xa

    new-array v6, v3, [Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x0

    aput-object v7, v6, v8

    const-string v7, "red"

    const/4 v8, 0x1

    aput-object v7, v6, v8

    const-string v7, "pink"

    const/4 v8, 0x2

    aput-object v7, v6, v8

    const-string v7, "orange"

    const/4 v8, 0x3

    aput-object v7, v6, v8

    const/4 v7, 0x4

    const-string v8, "yellow"

    aput-object v8, v6, v7

    const/4 v8, 0x5

    const-string v10, "green"

    aput-object v10, v6, v8

    const/4 v10, 0x6

    const-string v13, "cyan"

    aput-object v13, v6, v10

    const/4 v13, 0x7

    const-string v14, "blue"

    aput-object v14, v6, v13

    const/16 v14, 0x8

    const-string v15, "purple"

    aput-object v15, v6, v14

    const/16 v14, 0x9

    const-string v15, "black"

    aput-object v15, v6, v14

    new-array v14, v3, [I

    const/16 v15, 0xff

    invoke-static {v15, v15, v15}, Landroid/graphics/Color;->rgb(III)I

    move-result v16

    const/4 v3, 0x0

    aput v16, v14, v3

    invoke-static {v15, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v16

    const/16 v17, 0x1

    aput v16, v14, v17

    const/16 v13, 0x80

    const/16 v10, 0x80

    invoke-static {v15, v13, v10}, Landroid/graphics/Color;->rgb(III)I

    move-result v10

    const/4 v13, 0x2

    aput v10, v14, v13

    const/16 v10, 0xcc

    invoke-static {v15, v10, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v10

    const/4 v13, 0x3

    aput v10, v14, v13

    invoke-static {v15, v15, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v10

    aput v10, v14, v7

    invoke-static {v3, v15, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    aput v7, v14, v8

    invoke-static {v3, v15, v15}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    const/4 v8, 0x6

    aput v7, v14, v8

    invoke-static {v3, v3, v15}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    const/4 v8, 0x7

    aput v7, v14, v8

    const/16 v7, 0x8

    const/16 v8, 0xc0

    invoke-static {v8, v3, v15}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    aput v8, v14, v7

    const/16 v7, 0x9

    invoke-static {v3, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    aput v8, v14, v7

    array-length v3, v6

    new-instance v7, Landroid/widget/SeekBar;

    iget-object v8, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    add-int/lit8 v8, v3, -0x1

    invoke-virtual {v7, v8}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v8, v0, Le/e/a/v0$a;->b:[I

    const/4 v10, 0x1

    aget v8, v8, v10

    invoke-virtual {v7, v8}, Landroid/widget/SeekBar;->setProgress(I)V

    new-instance v8, Le/e/a/v0$a$h;

    invoke-direct {v8, v0, v1, v6, v4}, Le/e/a/v0$a$h;-><init>(Le/e/a/v0$a;[I[Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {v7, v8}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget v1, v0, Le/e/a/v0$a;->e:I

    div-int v8, v1, v3

    const/4 v10, 0x2

    div-int/2addr v8, v10

    div-int/2addr v1, v3

    div-int/2addr v1, v10

    const/4 v3, 0x0

    invoke-virtual {v7, v8, v3, v1, v3}, Landroid/widget/SeekBar;->setPadding(IIII)V

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-static {v3}, Landroid/graphics/Color;->alpha(I)I

    move-result v8

    invoke-direct {v1, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v7, v1}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v0, Le/e/a/v0$a;->f:Landroid/content/res/Resources;

    const v8, 0x7f0b006a

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v0, Le/e/a/v0$a;->g:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v7, v1}, Landroid/widget/SeekBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v8, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v1, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget v8, v0, Le/e/a/v0$a;->e:I

    iget-object v10, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    const/16 v13, 0xa

    invoke-static {v13, v10}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v10

    invoke-direct {v3, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v3, 0x0

    :goto_2da
    array-length v8, v6

    if-ge v3, v8, :cond_2fe

    new-instance v8, Landroid/widget/LinearLayout;

    iget-object v10, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v8, v10}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    aget v10, v14, v3

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v10, v0, Le/e/a/v0$a;->j:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v10, Landroid/widget/TextView;

    iget-object v13, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v10, v13}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2da

    :cond_2fe
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v6, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v3, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/ScrollView;

    iget-object v8, v0, Le/e/a/v0$a;->c:Landroid/content/Context;

    invoke-direct {v6, v8}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v8, 0x11

    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v3, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v6, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    const v1, 0x7f050088

    invoke-virtual {v6, v1}, Landroid/widget/ScrollView;->setBackgroundResource(I)V

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, v0, Le/e/a/v0$a;->a:Landroid/app/AlertDialog;

    iget-object v1, v0, Le/e/a/v0$a;->a:Landroid/app/AlertDialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    iget-object v1, v0, Le/e/a/v0$a;->a:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/view/Window;->setSoftInputMode(I)V

    iget-object v1, v0, Le/e/a/v0$a;->a:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Landroid/view/Window;->setFlags(II)V

    iget-object v1, v0, Le/e/a/v0$a;->a:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x50

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    iget-object v1, v0, Le/e/a/v0$a;->a:Landroid/app/AlertDialog;

    invoke-static {v1}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    goto/16 :goto_9

    :goto_367
    return v1

    :array_368
    .array-data 4
        0x7f07008b
        0x7f070088
        0x7f070089
    .end array-data

    :array_372
    .array-data 4
        0x7f070070
        0x7f070071
        0x7f07008a
    .end array-data
.end method
