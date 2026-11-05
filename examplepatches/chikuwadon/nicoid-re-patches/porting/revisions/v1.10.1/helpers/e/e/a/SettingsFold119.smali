.class public final Le/e/a/SettingsFold119;
.super Landroid/widget/BaseAdapter;
.source "SettingsFold119.java"


# instance fields
.field final activity:Landroid/preference/PreferenceActivity;

.field final original:Landroid/widget/ListAdapter;

.field final prefs:Landroid/content/SharedPreferences;

.field query:Ljava/lang/String;

.field final root:Landroid/preference/PreferenceScreen;

.field final visible:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/preference/PreferenceGroup;)V
    .registers 4

    .line 6
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/SettingsFold119;->query:Ljava/lang/String;

    .line 6
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceActivity;

    iput-object p1, p0, Le/e/a/SettingsFold119;->activity:Landroid/preference/PreferenceActivity;

    iget-object p1, p0, Le/e/a/SettingsFold119;->activity:Landroid/preference/PreferenceActivity;

    invoke-virtual {p1}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p1

    iput-object p1, p0, Le/e/a/SettingsFold119;->root:Landroid/preference/PreferenceScreen;

    iget-object p1, p0, Le/e/a/SettingsFold119;->activity:Landroid/preference/PreferenceActivity;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/SettingsFold119;->prefs:Landroid/content/SharedPreferences;

    iget-object p1, p0, Le/e/a/SettingsFold119;->activity:Landroid/preference/PreferenceActivity;

    invoke-virtual {p1}, Landroid/preference/PreferenceActivity;->getListView()Landroid/widget/ListView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/HeaderViewListAdapter;

    if-eqz v1, :cond_3a

    check-cast v0, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {v0}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    :cond_3a
    iput-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    new-instance v1, Le/e/a/SettingsFold119$1;

    invoke-direct {v1, p0}, Le/e/a/SettingsFold119$1;-><init>(Le/e/a/SettingsFold119;)V

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    invoke-virtual {p0}, Le/e/a/SettingsFold119;->rebuild()V

    invoke-virtual {p1, p0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v0, Le/e/a/SettingsFold119$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Le/e/a/SettingsFold119$$ExternalSyntheticLambda2;-><init>(Le/e/a/SettingsFold119;Landroid/widget/ListView;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method static key(Landroid/preference/Preference;)Ljava/lang/String;
    .registers 3

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "settings_fold_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_12

    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    goto :goto_16

    :cond_12
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p0

    :goto_16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static matches(Landroid/preference/Preference;Ljava/lang/String;)Z
    .registers 4

    .line 8
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2a

    invoke-virtual {p0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2a

    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .line 12
    const/4 v0, 0x0

    return v0
.end method

.method public getCount()I
    .registers 2

    .line 12
    iget-object v0, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 4

    .line 12
    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    iget-object v1, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 12
    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    iget-object v1, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 4

    .line 12
    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    iget-object v1, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8

    .line 13
    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    iget-object v1, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1, p2, p3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p0, p1}, Le/e/a/SettingsFold119;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    const p3, 0x1020016

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    if-eqz p3, :cond_b4

    instance-of v0, p1, Landroid/preference/PreferenceCategory;

    if-eqz v0, :cond_b0

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, p0, Le/e/a/SettingsFold119;->activity:Landroid/preference/PreferenceActivity;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iget-object v2, p0, Le/e/a/SettingsFold119;->activity:Landroid/preference/PreferenceActivity;

    const/16 v3, 0x30

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {p2, v2}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p2}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p2}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    invoke-virtual {p2, v2, v1, v3, v1}, Landroid/view/View;->setPadding(IIII)V

    const/16 v1, 0x10

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v1, p0, Le/e/a/SettingsFold119;->query:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_65

    iget-object v1, p0, Le/e/a/SettingsFold119;->prefs:Landroid/content/SharedPreferences;

    move-object v3, p1

    check-cast v3, Landroid/preference/Preference;

    invoke-static {v3}, Le/e/a/SettingsFold119;->key(Landroid/preference/Preference;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_65

    goto :goto_66

    :cond_65
    const/4 v0, 0x0

    :goto_66
    if-eqz v0, :cond_6c

    const v1, 0x1080002

    goto :goto_6f

    :cond_6c
    const v1, 0x1080003

    :goto_6f
    invoke-virtual {p3, v2, v2, v1, v2}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    invoke-virtual {p3}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object p3

    const/4 v1, 0x2

    aget-object p3, p3, v1

    if-eqz p3, :cond_84

    iget-object v1, p0, Le/e/a/SettingsFold119;->activity:Landroid/preference/PreferenceActivity;

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p3, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :cond_84
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    check-cast p1, Landroid/preference/Preference;

    invoke-virtual {p1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, ", "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    if-eqz v0, :cond_9e

    const-string p3, "\u6298\u308a\u305f\u305f\u307f"

    goto :goto_a0

    :cond_9e
    const-string p3, "\u5c55\u958b\u4e2d"

    :goto_a0
    invoke-static {p3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_b4

    :cond_b0
    const/4 p1, 0x0

    invoke-virtual {p3, p1, p1, p1, p1}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_b4
    :goto_b4
    return-object p2
.end method

.method public getViewTypeCount()I
    .registers 2

    .line 12
    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public hasStableIds()Z
    .registers 2

    .line 12
    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .registers 4

    .line 12
    invoke-virtual {p0, p1}, Le/e/a/SettingsFold119;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Landroid/preference/PreferenceCategory;

    if-nez v0, :cond_1e

    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    iget-object v1, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result p1

    if-nez p1, :cond_1e

    const/4 p1, 0x0

    return p1

    :cond_1e
    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$0$e-e-a-SettingsFold119(Landroid/widget/ListView;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 13

    .line 6
    invoke-virtual {p1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v0

    sub-int/2addr p4, v0

    if-ltz p4, :cond_52

    iget-object v0, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p4, v0, :cond_10

    goto :goto_52

    :cond_10
    invoke-virtual {p0, p4}, Le/e/a/SettingsFold119;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/preference/PreferenceCategory;

    if-eqz v1, :cond_38

    check-cast v0, Landroid/preference/Preference;

    invoke-static {v0}, Le/e/a/SettingsFold119;->key(Landroid/preference/Preference;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Le/e/a/SettingsFold119;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    iget-object p3, p0, Le/e/a/SettingsFold119;->prefs:Landroid/content/SharedPreferences;

    const/4 p4, 0x0

    invoke-interface {p3, p1, p4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p3

    xor-int/lit8 p3, p3, 0x1

    invoke-interface {p2, p1, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Le/e/a/SettingsFold119;->rebuild()V

    goto :goto_52

    :cond_38
    iget-object v0, p0, Le/e/a/SettingsFold119;->root:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Integer;

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    invoke-virtual {p1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result p1

    add-int v3, p4, p1

    move-object v1, p2

    move-object v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Landroid/preference/PreferenceScreen;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_52
    :goto_52
    return-void
.end method

.method rebuild()V
    .registers 9

    .line 10
    iget-object v0, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    new-array v1, v0, [Z

    new-array v2, v0, [Z

    new-array v3, v0, [Z

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_e
    if-lt v5, v0, :cond_2a

    iget-object v0, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Le/e/a/SettingsFold119;->visible:Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/SettingsFold119;->query:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    invoke-static {v1, v2, v3, v4}, Le/e/a/DisplayRules119;->visible([Z[Z[ZZ)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Le/e/a/SettingsFold119;->notifyDataSetChanged()V

    return-void

    :cond_2a
    iget-object v6, p0, Le/e/a/SettingsFold119;->original:Landroid/widget/ListAdapter;

    invoke-interface {v6, v5}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Landroid/preference/Preference;

    if-eqz v7, :cond_4e

    check-cast v6, Landroid/preference/Preference;

    instance-of v7, v6, Landroid/preference/PreferenceCategory;

    aput-boolean v7, v1, v5

    iget-object v7, p0, Le/e/a/SettingsFold119;->query:Ljava/lang/String;

    invoke-static {v6, v7}, Le/e/a/SettingsFold119;->matches(Landroid/preference/Preference;Ljava/lang/String;)Z

    move-result v7

    aput-boolean v7, v2, v5

    iget-object v7, p0, Le/e/a/SettingsFold119;->prefs:Landroid/content/SharedPreferences;

    invoke-static {v6}, Le/e/a/SettingsFold119;->key(Landroid/preference/Preference;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v7, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    aput-boolean v6, v3, v5

    :cond_4e
    add-int/lit8 v5, v5, 0x1

    goto :goto_e
.end method

.method search(Ljava/lang/String;)V
    .registers 2

    .line 9
    iput-object p1, p0, Le/e/a/SettingsFold119;->query:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/SettingsFold119;->rebuild()V

    return-void
.end method
