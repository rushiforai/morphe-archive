.class Le/e/a/RankingPeriod$1;
.super Ljava/lang/Object;
.source "RankingPeriod.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/RankingPeriod;->install(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$current:[I

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>([ILandroid/app/Activity;Landroid/net/Uri;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 7
    iput-object p1, p0, Le/e/a/RankingPeriod$1;->val$current:[I

    iput-object p2, p0, Le/e/a/RankingPeriod$1;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/RankingPeriod$1;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 7
    iget-object p1, p0, Le/e/a/RankingPeriod$1;->val$current:[I

    const/4 p2, 0x0

    aget p1, p1, p2

    if-ne p1, p3, :cond_8

    return-void

    :cond_8
    iget-object p1, p0, Le/e/a/RankingPeriod$1;->val$current:[I

    aput p3, p1, p2

    iget-object p1, p0, Le/e/a/RankingPeriod$1;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "ranking_sort_span"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Le/e/a/RankingPeriod$1;->val$uri:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->clearQuery()Landroid/net/Uri$Builder;

    move-result-object p1

    iget-object p2, p0, Le/e/a/RankingPeriod$1;->val$uri:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_33
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    const-string p5, "term"

    if-eqz p4, :cond_61

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p4, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-nez p5, :cond_33

    iget-object p5, p0, Le/e/a/RankingPeriod$1;->val$uri:Landroid/net/Uri;

    invoke-virtual {p5, p4}, Landroid/net/Uri;->getQueryParameters(Ljava/lang/String;)Ljava/util/List;

    move-result-object p5

    invoke-interface {p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p5

    :goto_51
    invoke-interface {p5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-interface {p5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, p4, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_51

    :cond_61
    sget-object p2, Le/e/a/RankingPeriod;->terms:[Ljava/lang/String;

    aget-object p2, p2, p3

    invoke-virtual {p1, p5, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-object p2, p0, Le/e/a/RankingPeriod$1;->val$a:Landroid/app/Activity;

    new-instance p3, Landroid/content/Intent;

    iget-object p4, p0, Le/e/a/RankingPeriod$1;->val$a:Landroid/app/Activity;

    invoke-virtual {p4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p4

    invoke-direct {p3, p4}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iget-object p4, p0, Le/e/a/RankingPeriod$1;->val$a:Landroid/app/Activity;

    iget-object p5, p0, Le/e/a/RankingPeriod$1;->val$a:Landroid/app/Activity;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p3, p4, p5}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p3

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Le/e/a/RankingPeriod$1;->val$a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 7
    return-void
.end method
