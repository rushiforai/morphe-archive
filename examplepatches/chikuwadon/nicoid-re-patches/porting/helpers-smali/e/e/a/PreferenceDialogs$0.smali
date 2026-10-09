.class public final synthetic Le/e/a/PreferenceDialogs$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PreferenceDialogs;"
    method = "lambda$walk$0"
    proto = "(Landroid/preference/Preference$OnPreferenceClickListener;Landroid/preference/Preference;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/preference/Preference$OnPreferenceClickListener;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/Preference$OnPreferenceClickListener;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PreferenceDialogs$0;->f$0:Landroid/preference/Preference$OnPreferenceClickListener;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/PreferenceDialogs$0;->f$0:Landroid/preference/Preference$OnPreferenceClickListener;

    invoke-static {v0, p1}, Le/e/a/PreferenceDialogs;->lambda$walk$0(Landroid/preference/Preference$OnPreferenceClickListener;Landroid/preference/Preference;)Z

    move-result p1

    return p1
.end method
