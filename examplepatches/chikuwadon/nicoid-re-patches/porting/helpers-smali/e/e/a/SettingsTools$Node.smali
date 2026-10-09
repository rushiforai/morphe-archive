.class final Le/e/a/SettingsTools$Node;
.super Ljava/lang/Object;
.source "SettingsTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SettingsTools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Node"
.end annotation


# instance fields
.field final children:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/preference/Preference;",
            "Le/e/a/SettingsTools$Node;",
            ">;"
        }
    .end annotation
.end field

.field final entries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/preference/Preference;",
            ">;"
        }
    .end annotation
.end field

.field final group:Landroid/preference/PreferenceGroup;


# direct methods
.method constructor <init>(Landroid/preference/PreferenceGroup;)V
    .registers 7

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/SettingsTools$Node;->entries:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/SettingsTools$Node;->children:Ljava/util/Map;

    iput-object p1, p0, Le/e/a/SettingsTools$Node;->group:Landroid/preference/PreferenceGroup;

    const/4 v0, 0x0

    :goto_14
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_1b

    return-void

    :cond_1b
    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    iget-object v2, p0, Le/e/a/SettingsTools$Node;->entries:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_35

    iget-object v2, p0, Le/e/a/SettingsTools$Node;->children:Ljava/util/Map;

    new-instance v3, Le/e/a/SettingsTools$Node;

    move-object v4, v1

    check-cast v4, Landroid/preference/PreferenceGroup;

    invoke-direct {v3, v4}, Le/e/a/SettingsTools$Node;-><init>(Landroid/preference/PreferenceGroup;)V

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_35
    add-int/lit8 v0, v0, 0x1

    goto :goto_14
.end method


# virtual methods
.method restore(Ljava/lang/String;Z)Z
    .registers 9

    .line 7
    iget-object v0, p0, Le/e/a/SettingsTools$Node;->group:Landroid/preference/PreferenceGroup;

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->removeAll()V

    iget-object v0, p0, Le/e/a/SettingsTools$Node;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_b
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_1d

    iget-object p1, p0, Le/e/a/SettingsTools$Node;->group:Landroid/preference/PreferenceGroup;

    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result p1

    if-lez p1, :cond_1c

    return v3

    :cond_1c
    return v2

    :cond_1d
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/preference/Preference;

    if-nez p2, :cond_54

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_54

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_54

    invoke-virtual {v1}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_54

    goto :goto_55

    :cond_54
    const/4 v2, 0x1

    :goto_55
    iget-object v3, p0, Le/e/a/SettingsTools$Node;->children:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/SettingsTools$Node;

    if-eqz v3, :cond_66

    invoke-virtual {v3, p1, v2}, Le/e/a/SettingsTools$Node;->restore(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_b

    goto :goto_68

    :cond_66
    if-eqz v2, :cond_b

    :goto_68
    iget-object v2, p0, Le/e/a/SettingsTools$Node;->group:Landroid/preference/PreferenceGroup;

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_b
.end method
