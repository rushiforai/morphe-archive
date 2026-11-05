.class public final synthetic Le/e/a/Review181$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:Landroid/preference/Preference;

.field public final synthetic f$2:Landroid/widget/SeekBar;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/widget/SeekBar;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Review181$$ExternalSyntheticLambda5;->f$0:Landroid/preference/PreferenceActivity;

    iput-object p2, p0, Le/e/a/Review181$$ExternalSyntheticLambda5;->f$1:Landroid/preference/Preference;

    iput-object p3, p0, Le/e/a/Review181$$ExternalSyntheticLambda5;->f$2:Landroid/widget/SeekBar;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/Review181$$ExternalSyntheticLambda5;->f$0:Landroid/preference/PreferenceActivity;

    iget-object v1, p0, Le/e/a/Review181$$ExternalSyntheticLambda5;->f$1:Landroid/preference/Preference;

    iget-object v2, p0, Le/e/a/Review181$$ExternalSyntheticLambda5;->f$2:Landroid/widget/SeekBar;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/Review181;->lambda$2(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/widget/SeekBar;Landroid/content/DialogInterface;I)V

    return-void
.end method
