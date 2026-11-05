.class public final synthetic Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# instance fields
.field public final synthetic f$0:[Ljava/lang/String;

.field public final synthetic f$1:Landroid/preference/PreferenceActivity;

.field public final synthetic f$2:Landroid/preference/Preference;

.field public final synthetic f$3:[Ljava/lang/CharSequence;

.field public final synthetic f$4:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/String;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/CharSequence;Ljava/lang/Runnable;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$0:[Ljava/lang/String;

    iput-object p2, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$1:Landroid/preference/PreferenceActivity;

    iput-object p3, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$2:Landroid/preference/Preference;

    iput-object p4, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$3:[Ljava/lang/CharSequence;

    iput-object p5, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$4:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$0:[Ljava/lang/String;

    iget-object v1, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$1:Landroid/preference/PreferenceActivity;

    iget-object v2, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$2:Landroid/preference/Preference;

    iget-object v3, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$3:[Ljava/lang/CharSequence;

    iget-object v4, p0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;->f$4:Ljava/lang/Runnable;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/PlayerVisibility192;->lambda$1([Ljava/lang/String;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/CharSequence;Ljava/lang/Runnable;Landroid/preference/Preference;)Z

    move-result p1

    return p1
.end method
