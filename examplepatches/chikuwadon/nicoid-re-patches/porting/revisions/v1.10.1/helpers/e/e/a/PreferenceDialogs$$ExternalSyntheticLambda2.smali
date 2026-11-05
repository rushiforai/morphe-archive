.class public final synthetic Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field public final synthetic f$0:Landroid/preference/Preference$OnPreferenceChangeListener;

.field public final synthetic f$1:Landroid/preference/ListPreference;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/Preference$OnPreferenceChangeListener;Landroid/preference/ListPreference;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda2;->f$0:Landroid/preference/Preference$OnPreferenceChangeListener;

    iput-object p2, p0, Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda2;->f$1:Landroid/preference/ListPreference;

    return-void
.end method


# virtual methods
.method public final onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda2;->f$0:Landroid/preference/Preference$OnPreferenceChangeListener;

    iget-object v1, p0, Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda2;->f$1:Landroid/preference/ListPreference;

    invoke-static {v0, v1, p1, p2}, Le/e/a/PreferenceDialogs;->lambda$0(Landroid/preference/Preference$OnPreferenceChangeListener;Landroid/preference/ListPreference;Landroid/preference/Preference;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
