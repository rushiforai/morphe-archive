.class public Lcom/sauzask/nicoid/intent/NicoidIntentSelect;
.super Landroid/app/Activity;
.source ""


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 15

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/nico.ms/"

    const-string v2, "/www.nicovideo.jp/watch/"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->a:Ljava/lang/String;

    iget-object v0, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->a:Ljava/lang/String;

    if-nez v0, :cond_20

    const-string v1, "sm9"

    goto :goto_28

    :cond_20
    const-string v1, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v2, "$1$2"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_28
    iput-object v1, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->b:Ljava/lang/String;

    iget-object v1, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_41

    const p1, 0x7f0f0058

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 1
    invoke-static {p1, v1, p0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_41
    const-string v0, "http://www.nicovideo.jp/watch/"

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->b:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->a:Ljava/lang/String;

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0xc8

    invoke-static {v4, p0}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, -0x1

    invoke-direct {v3, v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v4, 0x7f070057

    invoke-static {v3, v4}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v4, 0x41900000    # 18.0f

    const/4 v5, 0x2

    invoke-virtual {v3, v5, v4}, Landroid/widget/Button;->setTextSize(IF)V

    iget-object v4, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v4, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$a;

    invoke-direct {v4, p0}, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$a;-><init>(Lcom/sauzask/nicoid/intent/NicoidIntentSelect;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v6, 0x7f07005f

    invoke-static {v4, v6}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    const/high16 v7, 0x41600000    # 14.0f

    invoke-virtual {v4, v5, v7}, Landroid/widget/Button;->setTextSize(IF)V

    const v8, 0x7f0f00d9

    invoke-virtual {p0, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v8, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$b;

    invoke-direct {v8, p0}, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$b;-><init>(Lcom/sauzask/nicoid/intent/NicoidIntentSelect;)V

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v8, Landroid/widget/Button;

    invoke-direct {v8, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-static {v8, v6}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-virtual {v8, v5, v7}, Landroid/widget/Button;->setTextSize(IF)V

    const v9, 0x7f0f00d8

    invoke-virtual {p0, v9}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v9, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$c;

    invoke-direct {v9, p0}, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$c;-><init>(Lcom/sauzask/nicoid/intent/NicoidIntentSelect;)V

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v9, Landroid/widget/Button;

    invoke-direct {v9, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-static {v9, v6}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-virtual {v9, v5, v7}, Landroid/widget/Button;->setTextSize(IF)V

    const v10, 0x7f0f00d7

    invoke-virtual {p0, v10}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v10, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$d;

    invoke-direct {v10, p0}, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$d;-><init>(Lcom/sauzask/nicoid/intent/NicoidIntentSelect;)V

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v10, Landroid/widget/Button;

    invoke-direct {v10, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-static {v10, v6}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-virtual {v10, v5, v7}, Landroid/widget/Button;->setTextSize(IF)V

    const v5, 0x7f0f00d4

    invoke-virtual {p0, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v5, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$e;

    invoke-direct {v5, p0}, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$e;-><init>(Lcom/sauzask/nicoid/intent/NicoidIntentSelect;)V

    invoke-virtual {v10, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const v6, 0x7f0701a5

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x80

    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    invoke-static {v7, v11}, Le/e/a/v0;->a(ILandroid/util/DisplayMetrics;)I

    move-result v7

    const/16 v11, 0x28

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    invoke-static {v11, v12}, Le/e/a/v0;->a(ILandroid/util/DisplayMetrics;)I

    move-result v11

    .line 4
    invoke-direct {v6, v7, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v7, 0x14

    const/16 v11, 0xa

    invoke-virtual {v6, v1, v7, v1, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    return-void
.end method
