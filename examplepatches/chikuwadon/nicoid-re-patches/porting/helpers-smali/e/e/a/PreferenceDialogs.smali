.class public final Le/e/a/PreferenceDialogs;
.super Ljava/lang/Object;
.source "PreferenceDialogs.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/preference/PreferenceActivity;)V
    .registers 2
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 6
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PreferenceDialogs;->walk(Landroid/preference/Preference;)V

    return-void
.end method

.method static synthetic lambda$walk$0(Landroid/preference/Preference$OnPreferenceClickListener;Landroid/preference/Preference;)Z
    .registers 5
    .param p0, "prior"    # Landroid/preference/Preference$OnPreferenceClickListener;
    .param p1, "clicked"    # Landroid/preference/Preference;

    .line 9
    if-eqz p0, :cond_a

    invoke-interface {p0, p1}, Landroid/preference/Preference$OnPreferenceClickListener;->onPreferenceClick(Landroid/preference/Preference;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    .local v0, "result":Z
    :goto_b
    move-object v1, p1

    check-cast v1, Landroid/preference/DialogPreference;

    invoke-virtual {v1}, Landroid/preference/DialogPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    .local v1, "dialog":Landroid/app/Dialog;
    instance-of v2, v1, Landroid/app/AlertDialog;

    if-eqz v2, :cond_1c

    move-object v2, v1

    check-cast v2, Landroid/app/AlertDialog;

    invoke-static {v2}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V

    :cond_1c
    return v0
.end method

.method private static walk(Landroid/preference/Preference;)V
    .registers 4
    .param p0, "preference"    # Landroid/preference/Preference;

    .line 8
    instance-of v0, p0, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_18

    move-object v0, p0

    check-cast v0, Landroid/preference/PreferenceGroup;

    .local v0, "group":Landroid/preference/PreferenceGroup;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-ge v1, v2, :cond_18

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PreferenceDialogs;->walk(Landroid/preference/Preference;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 9
    .end local v0    # "group":Landroid/preference/PreferenceGroup;
    .end local v1    # "i":I
    :cond_18
    instance-of v0, p0, Landroid/preference/DialogPreference;

    if-eqz v0, :cond_28

    invoke-virtual {p0}, Landroid/preference/Preference;->getOnPreferenceClickListener()Landroid/preference/Preference$OnPreferenceClickListener;

    move-result-object v0

    .local v0, "prior":Landroid/preference/Preference$OnPreferenceClickListener;
    new-instance v1, Le/e/a/PreferenceDialogs$0;

    invoke-direct {v1, v0}, Le/e/a/PreferenceDialogs$0;-><init>(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 10
    .end local v0    # "prior":Landroid/preference/Preference$OnPreferenceClickListener;
    :cond_28
    return-void
.end method
