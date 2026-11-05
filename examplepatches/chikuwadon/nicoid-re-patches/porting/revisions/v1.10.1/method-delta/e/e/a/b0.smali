.class public Le/e/a/b0;
.super Landroid/widget/BaseAdapter;
.source ""


# instance fields
.field public a:Landroid/view/LayoutInflater;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation
.end field

.field public c:Le/e/a/y0;

.field public d:Landroid/app/Activity;

.field public e:I

.field public f:I

.field public g:I

.field public i:I

.field public j:Z

.field public k:Z

.field public l:Le/e/a/b1;


# virtual methods
.method public a(Ljava/lang/String;)V
    .registers 5

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Le/e/a/b0;->d:Landroid/app/Activity;

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

    iget-object p1, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    const v0, 0x7f0f0025

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    .line 2
    invoke-static {p1, v1, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 3
    :cond_3a
    sget-object v0, Le/e/a/o2;->w:Ljava/lang/String;

    if-nez v0, :cond_40

    const-string v0, ""

    :cond_40
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    iget-object p1, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    const v0, 0x7f0f0029

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    .line 4
    invoke-static {p1, v1, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 5
    :cond_55
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    const-class v2, Lcom/sauzask/nicoid/NicoidDownloadCache;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    invoke-static {p1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .registers 5

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    const v2, 0x7f0f00c4

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    const v2, 0x7f0f00c5

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/b0$b;

    invoke-direct {v2, p0, p1}, Le/e/a/b0$b;-><init>(Le/e/a/b0;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Le/e/a/b0;->d:Landroid/app/Activity;

    const v1, 0x7f0f002d

    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Le/e/a/b0$c;

    invoke-direct {v1, p0}, Le/e/a/b0$c;-><init>(Le/e/a/b0;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 20

    move-object/from16 v7, p0

    move/from16 v0, p1

    :try_start_4
    iget-object v1, v7, Le/e/a/b0;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Le/e/a/x1;

    const-string v1, "videourl"

    invoke-virtual {v8, v1}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    const-string v1, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v2, "$1$2"

    invoke-virtual {v3, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz p2, :cond_4a

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4a

    move-object/from16 v3, p2

    const-string v1, "isselect"

    invoke-virtual {v8, v1}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/lang/Boolean;

    if-eqz v2, :cond_45

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_45

    const v1, 0x6631c7b1

    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V

    return-object p2

    :cond_45
    const/4 v1, 0x0

    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V

    return-object p2

    :cond_4a
    iget-object v1, v7, Le/e/a/b0;->a:Landroid/view/LayoutInflater;

    const v2, 0x7f0b006f

    const/4 v9, 0x0

    move-object/from16 v4, p3

    invoke-virtual {v1, v2, v4, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v10
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_56} :catch_183

    const v1, 0x7f0801b4

    :try_start_59
    invoke-virtual {v10, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Landroid/widget/TextView;

    const v1, 0x7f0801d3

    invoke-virtual {v10, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Landroid/widget/TextView;

    const v1, 0x7f08015e

    invoke-virtual {v10, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f0800df

    invoke-virtual {v10, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const v4, 0x7f080165

    invoke-virtual {v10, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Landroid/widget/TextView;

    const v4, 0x7f0801b2

    invoke-virtual {v10, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const v5, 0x7f0800d4

    invoke-virtual {v10, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Lcom/sauzask/nicoid/NicoidListButton;

    invoke-virtual {v10, v6}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    const-string v5, "thumbnail"

    invoke-virtual {v8, v5}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v5, v7, Le/e/a/b0;->c:Le/e/a/y0;

    invoke-virtual {v5, v4, v0}, Le/e/a/y0;->a(Landroid/widget/ImageView;I)V

    const-string v4, "title"

    invoke-virtual {v8, v4}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "videoinfo"

    invoke-virtual {v8, v5}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/text/Spanned;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v15, "posttime"

    invoke-virtual {v8, v15}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/text/Spanned;

    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    const-string v9, "length"

    invoke-virtual {v8, v9}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/text/Spanned;

    invoke-virtual {v11, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v12, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0801e2

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v5, v8, Le/e/a/x1;->y:Ljava/lang/String;

    if-eqz v5, :cond_fe

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v15

    if-eqz v15, :cond_fe

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v15, 0x0

    invoke-virtual {v0, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_103

    :cond_fe
    const/16 v15, 0x8

    invoke-virtual {v0, v15}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_103
    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v9, Le/e/a/b0$a;

    move-object v1, v9

    move-object/from16 v2, p0

    move/from16 v5, p1

    invoke-direct/range {v1 .. v6}, Le/e/a/b0$a;-><init>(Le/e/a/b0;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v14, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x0

    invoke-static {v10}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {v10}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v0

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const v15, 0x7f08015e

    invoke-virtual {v10, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const v15, 0x7f0801e2

    invoke-virtual {v10, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const-string v0, "isselect"

    invoke-virtual {v8, v0}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_156

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_14f

    goto :goto_156

    :cond_14f
    const v0, 0x6631c7b1

    invoke-virtual {v10, v0}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_15e

    :cond_156
    :goto_156
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-virtual {v10, v1}, Landroid/view/View;->setBackgroundColor(I)V

    :goto_15e
    iget v0, v7, Le/e/a/b0;->e:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_16f

    iget v0, v7, Le/e/a/b0;->e:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_16f

    iget v0, v7, Le/e/a/b0;->e:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_189

    :cond_16f
    const-string v0, "rank"

    invoke-virtual {v8, v0}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const v1, -0x66827669

    invoke-virtual {v13, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_180
    .catch Ljava/lang/Exception; {:try_start_59 .. :try_end_180} :catch_181

    goto :goto_189

    :catch_181
    move-exception v0

    goto :goto_186

    :catch_183
    move-exception v0

    move-object/from16 v10, p2

    :goto_186
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_189
    :goto_189
    return-object v10
.end method
