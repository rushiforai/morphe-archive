.class public Le/e/a/m0;
.super Landroid/widget/BaseAdapter;
.source ""


# instance fields
.field public a:Landroid/view/LayoutInflater;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public c:Le/e/a/y0;

.field public d:Landroid/app/Activity;

.field public e:I

.field public f:I

.field public g:I

.field public i:Z


# virtual methods
.method public a(Ljava/lang/String;)V
    .registers 5

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Le/e/a/m0;->d:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3a

    iget-object p1, p0, Le/e/a/m0;->d:Landroid/app/Activity;

    const v0, 0x7f0f0025

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Le/e/a/m0;->d:Landroid/app/Activity;

    .line 1
    invoke-static {p1, v1, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 2
    :cond_3a
    sget-object v0, Le/e/a/o2;->w:Ljava/lang/String;

    if-nez v0, :cond_40

    const-string v0, ""

    :cond_40
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    iget-object p1, p0, Le/e/a/m0;->d:Landroid/app/Activity;

    const v0, 0x7f0f0029

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Le/e/a/m0;->d:Landroid/app/Activity;

    .line 3
    invoke-static {p1, v1, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 4
    :cond_55
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le/e/a/m0;->d:Landroid/app/Activity;

    const-class v2, Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Le/e/a/m0;->d:Landroid/app/Activity;

    invoke-static {p1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 20

    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-object v2, v0, Le/e/a/m0;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    const-string v3, "time"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/text/Spanned;

    const-string v4, "mainurl"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "title"

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/text/Spanned;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-eqz p2, :cond_54

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_54

    return-object p2

    :cond_54
    iget-object v6, v0, Le/e/a/m0;->a:Landroid/view/LayoutInflater;

    const v7, 0x7f0b0050

    const/4 v8, 0x0

    move-object/from16 v9, p3

    invoke-virtual {v6, v7, v9, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    const v7, 0x7f0801b4

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    const v9, 0x7f0800eb

    invoke-virtual {v6, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    const v10, 0x7f0801b3

    invoke-virtual {v6, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    const v11, 0x7f0801b2

    invoke-virtual {v6, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ImageView;

    const v12, 0x7f0800c4

    invoke-virtual {v6, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/ImageView;

    const v13, 0x7f0800d4

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Lcom/sauzask/nicoid/NicoidListButton;

    const v14, 0x7f0801c1

    invoke-virtual {v6, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/LinearLayout;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const-string v14, "main"

    invoke-virtual {v2, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/text/Spanned;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v15, Le/e/a/j3;

    iget-object v8, v0, Le/e/a/m0;->d:Landroid/app/Activity;

    move-object/from16 p3, v6

    const/4 v6, 0x0

    invoke-direct {v15, v8, v6}, Le/e/a/j3;-><init>(Landroid/app/Activity;Le/e/a/l3/g;)V

    invoke-virtual {v7, v15}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v9, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v3, v1, 0x1

    const/4 v7, 0x4

    invoke-virtual {v11, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    const-string v8, "thumbnail"

    invoke-virtual {v2, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_ea

    const/4 v9, 0x0

    invoke-virtual {v11, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {v11, v6}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_fa

    :cond_ea
    invoke-virtual {v2, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v11, v8}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v8, v0, Le/e/a/m0;->c:Le/e/a/y0;

    invoke-virtual {v8, v11, v1}, Le/e/a/y0;->a(Landroid/widget/ImageView;I)V

    :goto_fa
    invoke-virtual {v12, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    const-string v1, "icon"

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v1, v0, Le/e/a/m0;->c:Le/e/a/y0;

    invoke-virtual {v1, v12, v3}, Le/e/a/y0;->a(Landroid/widget/ImageView;I)V

    const-string v1, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    invoke-virtual {v4, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12a

    const-string v2, "$1$2"

    invoke-virtual {v4, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v13, v2}, Landroid/widget/Button;->setVisibility(I)V

    new-instance v2, Le/e/a/m0$b;

    invoke-direct {v2, v0, v4, v5, v1}, Le/e/a/m0$b;-><init>(Le/e/a/m0;Ljava/lang/String;Landroid/text/Spanned;Ljava/lang/String;)V

    invoke-virtual {v13, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_138

    :cond_12a
    const-string v1, "^.*?/watch/lv([0-9]+).*?$"

    invoke-virtual {v4, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    const/16 v2, 0x8

    invoke-virtual {v13, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v13, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_138
    return-object p3
.end method
