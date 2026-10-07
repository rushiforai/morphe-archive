.class public final Le/e/a/RankingPeriod;
.super Ljava/lang/Object;
.source "RankingPeriod.java"


# static fields
.field static final labels:[Ljava/lang/String;

.field static final terms:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 4
    const-string v0, "month"

    const-string v1, "total"

    const-string v2, "hour"

    const-string v3, "24h"

    const-string v4, "week"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/RankingPeriod;->terms:[Ljava/lang/String;

    .line 5
    const-string v0, "rankingSortmonthly"

    const-string v1, "rankingSorttotal"

    const-string v2, "rankingSorthourly"

    const-string v3, "rankingSortdaily"

    const-string v4, "rankingSortweekly"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/RankingPeriod;->labels:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static install(Ljava/lang/Object;)V
    .registers 13

    .line 7
    const-string v0, "ranking_period"

    :try_start_2
    const-string v1, "o0"

    invoke-static {p0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "type"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, 0x6

    if-ne v3, v4, :cond_ea

    if-eqz v2, :cond_ea

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_ea

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ranking"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_36

    goto/16 :goto_ea

    :cond_36
    const-string v3, "b0"

    invoke-static {p0, v3}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/ListView;

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_45

    return-void

    :cond_45
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "ranking_layout_header"

    const-string v6, "layout"

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v4, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    invoke-virtual {v4, v3, p0, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v4, "spinner1"

    const-string v6, "id"

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v4, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    sget-object v4, Le/e/a/RankingPeriod;->labels:[Ljava/lang/String;

    array-length v4, v4

    new-array v6, v4, [Ljava/lang/String;

    const/4 v7, 0x0

    :goto_7c
    if-ge v7, v4, :cond_99

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget-object v9, Le/e/a/RankingPeriod;->labels:[Ljava/lang/String;

    aget-object v9, v9, v7

    const-string v10, "string"

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v9, v10, v11}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v1, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_7c

    :cond_99
    new-instance v4, Landroid/widget/ArrayAdapter;

    const v7, 0x1090008

    invoke-direct {v4, v1, v7, v6}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v6, 0x1090009

    invoke-virtual {v4, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {v0, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    const-string v4, "ThemeChoice"

    const-string v6, "spinner"

    const/4 v7, 0x1

    new-array v8, v7, [Ljava/lang/Class;

    const-class v9, Landroid/widget/Spinner;

    aput-object v9, v8, v5

    new-array v9, v7, [Ljava/lang/Object;

    aput-object v0, v9, v5

    invoke-static {v4, v6, v8, v9}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v4, 0x0

    :goto_bd
    sget-object v6, Le/e/a/RankingPeriod;->terms:[Ljava/lang/String;

    array-length v6, v6

    if-ge v4, v6, :cond_d6

    sget-object v6, Le/e/a/RankingPeriod;->terms:[Ljava/lang/String;

    aget-object v6, v6, v4

    const-string v8, "term"

    invoke-virtual {v2, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d3

    move v7, v4

    :cond_d3
    add-int/lit8 v4, v4, 0x1

    goto :goto_bd

    :cond_d6
    invoke-virtual {v0, v7}, Landroid/widget/Spinner;->setSelection(I)V

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4, v5}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    filled-new-array {v7}, [I

    move-result-object p0

    new-instance v3, Le/e/a/RankingPeriod$1;

    invoke-direct {v3, p0, v1, v2}, Le/e/a/RankingPeriod$1;-><init>([ILandroid/app/Activity;Landroid/net/Uri;)V

    invoke-virtual {v0, v3}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    :try_end_e9
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_e9} :catch_eb

    goto :goto_ef

    :cond_ea
    :goto_ea
    return-void

    :catch_eb
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_ef
    return-void
.end method

.method public static savedTerm(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .line 6
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "ranking_sort_span"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    sget-object v0, Le/e/a/RankingPeriod;->terms:[Ljava/lang/String;

    const/4 v1, 0x4

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v1, 0x0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    aget-object p0, v0, p0

    return-object p0
.end method
