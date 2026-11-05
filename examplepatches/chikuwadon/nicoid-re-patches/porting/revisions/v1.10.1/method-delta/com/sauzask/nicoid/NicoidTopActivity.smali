.class public Lcom/sauzask/nicoid/NicoidTopActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source ""


# instance fields
.field public A:I

.field public B:Z

.field public t:Landroid/view/View;

.field public u:Landroid/app/Activity;

.field public v:Landroid/view/LayoutInflater;

.field public w:Landroid/content/SharedPreferences;

.field public x:Z

.field public y:Lcom/google/android/gms/ads/AdView;

.field public z:Landroid/os/Handler;


# direct methods
.method public static a(Landroid/content/Context;Landroid/widget/ListView;Z)Landroid/widget/ListView;
    .registers 20

    move-object/from16 v0, p0

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Le/e/a/x0;

    const/4 v9, 0x1

    invoke-direct {v8, v0, v7, v9}, Le/e/a/x0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    const-string v1, "http://www.nicovideo.jp/ranking/fav/daily/all?rss=2.0"

    invoke-static {v1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v10, "android.intent.action.VIEW"

    const-string v11, "com.sauzask.nicoid.hls"

    const-string v2, "com.sauzask.nicoid.NicoidRankingActivity"

    invoke-static {v10, v1, v11, v2}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const v1, 0x7f0f01d0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f0f01d1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v12, 0x0

    const/4 v6, 0x0

    move-object v1, v7

    move v2, v12

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    invoke-static {v0, v7}, Le/e/a/ModernShorts;->addMenu(Landroid/content/Context;Ljava/util/ArrayList;)V

    const v1, 0x7f0f01d4

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f0f01d5

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v13, 0x0

    const/4 v6, 0x1

    move-object v1, v7

    move-object v5, v13

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    const v1, 0x7f0f01ca

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f0f01ce

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x2

    move-object v1, v7

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    const v1, 0x7f0f01c7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v2, 0x1

    const-string v4, ""

    move-object v1, v7

    move v6, v12

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v13, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {v5, v11, v13}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v14, "type"

    const/16 v1, 0x8

    invoke-virtual {v5, v14, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const v1, 0x7f0f01c9

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v15, "name"

    invoke-virtual {v5, v15, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const v2, 0x7f0f01c8

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v16, 0x0

    move-object v1, v7

    move/from16 v2, v16

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {v5, v11, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const v1, 0x7f0f01c0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f0f01c1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object v1, v7

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    const v1, 0x7f0f01b1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v2, 0x1

    const-string v4, ""

    const/4 v5, 0x0

    move-object v1, v7

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    if-eqz p2, :cond_14c

    const/4 v1, 0x4

    invoke-virtual {v5, v14, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v5, v11, v13}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v12, 0x0

    const v1, 0x7f0f01b4

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f0f01b5

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v16, 0x0

    move-object v1, v7

    move v2, v12

    move/from16 v6, v16

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sauzask.nicoid.NicoidMylistGroupActivity"

    invoke-virtual {v5, v11, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const v1, 0x7f0f01b6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f0f01b7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object v1, v7

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    const-string v1, "deflist"

    invoke-static {v1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v10, v1, v11, v13}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const/16 v1, 0x9

    invoke-virtual {v5, v14, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const v1, 0x7f0f01bc

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v15, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f0f01bd

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object v1, v7

    move v2, v12

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.sauzask.nicoid.NicoidFavUserActivity"

    invoke-virtual {v1, v11, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const v2, 0x7f0f01b2

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0f01b3

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v5, v1

    goto :goto_166

    :cond_14c
    const-string v1, "com.sauzask.nicoid.NicoidSetting"

    invoke-virtual {v5, v11, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "login"

    invoke-virtual {v5, v1, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/4 v1, 0x0

    const v2, 0x7f0f016c

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0f016f

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    :goto_166
    move-object v4, v3

    const/4 v6, 0x0

    move-object v3, v2

    const/4 v2, 0x0

    move-object v1, v7

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    if-eqz p2, :cond_190

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.sauzask.nicoid.NicoidNicorepoActivity"

    invoke-virtual {v5, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "\u30cb\u30b3\u30ec\u30dd"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u65b0\u7740\u52d5\u753b"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v1, v7

    const/4 v2, 0x0

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    :cond_190
    const/4 v2, 0x1

    const-string v3, "\u8a2d\u5b9a"

    const-string v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v7

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sauzask.nicoid.NicoidSetting"

    invoke-virtual {v5, v11, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v2, 0x0

    const-string v3, "\u30a2\u30d7\u30ea\u8a2d\u5b9a"

    const-string v4, "\u4e00\u822c\u8a2d\u5b9a\u30fb\u518d\u751f\u8a2d\u5b9a"

    const/4 v6, 0x0

    move-object v1, v7

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    const/4 v2, 0x0

    const-string v3, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    const-string v4, "\u8a2d\u5b9a\u3092\u53cd\u6620\u3057\u3066\u6700\u521d\u304b\u3089\u958b\u304f"

    const/4 v5, 0x0

    const/4 v6, 0x4

    move-object v1, v7

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    const-string v3, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    const-string v4, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092\u9001\u308b"

    const/4 v6, 0x5

    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    invoke-static {v0, v7}, Le/e/a/AccountPage;->addMenu(Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-static {v0, v7}, Le/e/a/ModernShorts;->finishMenu(Landroid/content/Context;Ljava/util/ArrayList;)V

    if-nez p1, :cond_1d0

    new-instance v1, Lcom/sauzask/nicoid/NicoidListView;

    invoke-direct {v1, v0}, Lcom/sauzask/nicoid/NicoidListView;-><init>(Landroid/content/Context;)V

    goto :goto_1d2

    :cond_1d0
    move-object/from16 v1, p1

    :goto_1d2
    invoke-virtual {v1, v8}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const-string v3, "#cccccc"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDividerHeight(I)V

    new-instance v2, Lcom/sauzask/nicoid/NicoidTopActivity$b;

    invoke-direct {v2, v7, v0}, Lcom/sauzask/nicoid/NicoidTopActivity$b;-><init>(Ljava/util/ArrayList;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-object v1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Le/e/a/v0;->a()I

    const p1, 0x7f1000a2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->w:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->w:Landroid/content/SharedPreferences;

    const-string v0, "main_rotation"

    const-string v1, "1"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->w:Landroid/content/SharedPreferences;

    invoke-static {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->a(Landroid/app/Activity;Landroid/content/SharedPreferences;)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->u:Landroid/app/Activity;

    const-string p1, "layout_inflater"

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->v:Landroid/view/LayoutInflater;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->v:Landroid/view/LayoutInflater;

    const/4 v0, 0x0

    const v1, 0x7f0b006e

    invoke-virtual {p1, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->t:Landroid/view/View;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->t:Landroid/view/View;

    invoke-static {p1}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->w:Landroid/content/SharedPreferences;

    invoke-static {p1}, Le/e/a/v0;->a(Landroid/content/SharedPreferences;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->x:Z

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->u:Landroid/app/Activity;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->t:Landroid/view/View;

    const v2, 0x7f0800e5

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->x:Z

    invoke-static {p1, v1, v2}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Landroid/content/Context;Landroid/widget/ListView;Z)Landroid/widget/ListView;

    .line 1
    sget-object p1, Le/e/a/o;->a:[Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v0, p1, v1

    const/4 v2, 0x1

    aput-object v0, p1, v2

    .line 2
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->t:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(Landroid/view/View;)V

    .line 3
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-ge p1, v3, :cond_89

    goto/16 :goto_10c

    :cond_89
    new-instance p1, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Le/e/a/o;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/nicoid/history.json"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p1, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    new-instance v3, Le/e/a/CacheFile;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Le/e/a/o;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_c7

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_10c

    :cond_c7
    sget-object v4, Le/e/a/o;->a:[Ljava/lang/String;

    aput-object v0, v4, v1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "\u4ee5\u524d\u306e\u30c7\u30a3\u30ec\u30af\u30c8\u30ea\u306b\u30c7\u30fc\u30bf\u3092\u78ba\u8a8d\u3057\u307e\u3057\u305f"

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_e1

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v4, "\u73fe\u5728\u3001\u4fdd\u5b58\u306b\u4f7f\u7528\u3057\u3066\u3044\u308b\u672c\u4f53\u30e1\u30e2\u30ea\u5074\u306e\u30c7\u30a3\u30ec\u30af\u30c8\u30ea\u306fGooglePlay\u30dd\u30ea\u30b7\u30fc\u306e\u5909\u66f4\u3067\u4f7f\u7528\u3067\u304d\u306a\u304f\u306a\u308a\u307e\u3059\u3002\n\n\u304a\u624b\u6570\u3067\u3059\u304c\u300c\u30c7\u30fc\u30bf\u3092\u79fb\u52d5\u3059\u308b\u300d\u3092\u30bf\u30c3\u30d7\u3057\u3066\u3044\u305f\u3060\u304d\u79fb\u52d5\u3092\u3088\u308d\u3057\u304f\u304a\u9858\u3044\u3044\u305f\u3057\u307e\u3059\u3002\n\n\u307e\u305f\u3001\u79fb\u52d5\u3059\u308b\u3053\u3068\u306b\u3088\u308a\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u8aad\u307f\u66f8\u304d\u304c\u4f4e\u901f\u306b\u306a\u308b\u554f\u984c\u304c\u89e3\u6c7a\u3044\u305f\u3057\u307e\u3059\u3002\n\n\u203b\u672c\u4f53\u304b\u3089\u672c\u4f53\u3078\u306e\u79fb\u52d5\u3067\u3059\u3002SD\u30ab\u30fc\u30c9\u306e\u30c7\u30fc\u30bf\u306f\u79fb\u52d5\u3057\u307e\u305b\u3093\u3002\n\u203b\u79fb\u52d5\u3057\u306a\u3044\u30682021\u5e7411\u6708\u4ee5\u964d\u306e\u30a2\u30c3\u30d7\u30c7\u30fc\u30c8\u3067\u672c\u4f53\u30e1\u30e2\u30ea\u306b\u4fdd\u5b58\u3055\u308c\u3066\u3044\u308b\u30c7\u30fc\u30bf\u304c\u5229\u7528\u51fa\u6765\u306a\u304f\u306a\u308a\u307e\u3059\u3002\n\u203b\u79fb\u52d5\u5f8c\u306f\u30a2\u30d7\u30ea\u3092\u30a2\u30f3\u30a4\u30f3\u30b9\u30c8\u30fc\u30eb\u3059\u308b\u3068\u30c7\u30fc\u30bf\u3082\u524a\u9664\u3055\u308c\u307e\u3059\u3002"

    goto :goto_ee

    :cond_e1
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_f1

    const-string v4, "Android 11\u306e\u30c7\u30a3\u30ec\u30af\u30c8\u30ea\u306b\u3064\u3044\u3066"

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v4, "\u65e7\u30c7\u30a3\u30ec\u30af\u30c8\u30ea\u304b\u3089\u79fb\u884c\u3057\u3066\u3044\u305f\u3060\u304d\u3042\u308a\u304c\u3068\u3046\u3054\u3056\u3044\u307e\u3059\u3002\n\u79fb\u884c\u5f8c\u306e\u30c7\u30a3\u30ec\u30af\u30c8\u30ea\u304c\u5916\u90e8\u30a2\u30d7\u30ea\u304b\u3089\u53c2\u7167\u3067\u304d\u306a\u3044\u3053\u3068\u306b\u3064\u3044\u3066\u591a\u6570\u306e\u3054\u610f\u898b\u3092\u9802\u3044\u305f\u305f\u3081\u3001\u5916\u90e8\u30a2\u30d7\u30ea\u304b\u3089\u53c2\u7167\u3067\u304d\u308b\u30c7\u30a3\u30ec\u30af\u30c8\u30ea\u306b\u5909\u66f4\u3044\u305f\u3057\u307e\u3059\u3002\n\n\u5927\u5909\u304a\u624b\u6570\u304a\u304b\u3051\u3057\u307e\u3059\u304c\u3001\u300c\u30c7\u30fc\u30bf\u3092\u79fb\u52d5\u3059\u308b\u300d\u3092\u30bf\u30c3\u30d7\u3057\u3066\u3044\u305f\u3060\u304d\u518d\u5ea6\u79fb\u52d5\u3092\u3088\u308d\u3057\u304f\u304a\u9858\u3044\u3044\u305f\u3057\u307e\u3059\u3002"

    :goto_ee
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    :cond_f1
    new-instance v4, Le/e/a/f;

    invoke-direct {v4, p1, p0, v3}, Le/e/a/f;-><init>(Ljava/io/File;Landroid/app/Activity;Ljava/io/File;)V

    const-string p1, "\u30c7\u30fc\u30bf\u3092\u79fb\u52d5\u3059\u308b"

    invoke-virtual {v0, p1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    sget-object p1, Le/e/a/a;->a:Le/e/a/a;

    const-string v3, "\u4eca\u306f\u79fb\u52d5\u3057\u306a\u3044"

    invoke-virtual {v0, v3, p1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    :cond_10c
    :goto_10c
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p1, 0x1e

    if-ge v0, p1, :cond_123

    const-string p1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 4
    invoke-static {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_123

    new-array v0, v2, [Ljava/lang/String;

    aput-object p1, v0, v1

    iget p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->A:I

    invoke-static {p0, v0, p1}, Ld/h/d/a;->a(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_123
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 5

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_2c

    if-eq p1, v0, :cond_26

    const/4 v1, 0x2

    if-eq p1, v1, :cond_d

    goto :goto_2c

    :cond_d
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    new-instance p1, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sauzask.nicoid.hls"

    const-string v2, "com.sauzask.nicoid.NicoidSetting"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->u:Landroid/app/Activity;

    invoke-virtual {v1, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_2c

    :cond_26
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->u:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {p1, v1, v1}, Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;[I)V

    :cond_2c
    :goto_2c
    return v0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1e

    if-lt v0, p2, :cond_7

    return-void

    :cond_7
    iget p2, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->A:I

    if-ne p2, p1, :cond_3f

    const/4 p1, 0x0

    aget p1, p3, p1

    if-nez p1, :cond_11

    goto :goto_3f

    :cond_11
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const p2, 0x7f0f0057

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x7f0f0056

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x104000a

    new-instance p3, Lcom/sauzask/nicoid/NicoidTopActivity$a;

    invoke-direct {p3, p0}, Lcom/sauzask/nicoid/NicoidTopActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidTopActivity;)V

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    :cond_3f
    :goto_3f
    return-void
.end method

.method public onResume()V
    .registers 5

    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->y:Lcom/google/android/gms/ads/AdView;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->resume()V

    :cond_a
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->B:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->B:Z

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->w:Landroid/content/SharedPreferences;

    invoke-static {v0}, Le/e/a/v0;->a(Landroid/content/SharedPreferences;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->x:Z

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->u:Landroid/app/Activity;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidTopActivity;->t:Landroid/view/View;

    const v3, 0x7f0800e5

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    invoke-static {v1, v2, v0}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Landroid/content/Context;Landroid/widget/ListView;Z)Landroid/widget/ListView;

    return-void
.end method
