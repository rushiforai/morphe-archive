.class public final synthetic Le/e/a/ModernShorts$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# instance fields
.field public final synthetic f$0:[J

.field public final synthetic f$1:[I

.field public final synthetic f$2:Landroid/preference/PreferenceActivity;


# direct methods
.method public synthetic constructor <init>([J[ILandroid/preference/PreferenceActivity;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;->f$0:[J

    iput-object p2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;->f$1:[I

    iput-object p3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;->f$2:Landroid/preference/PreferenceActivity;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;->f$0:[J

    iget-object v1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;->f$1:[I

    iget-object v2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;->f$2:Landroid/preference/PreferenceActivity;

    invoke-static {v0, v1, v2, p1}, Le/e/a/ModernShorts;->lambda$settings$0([J[ILandroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z

    move-result p1

    return p1
.end method
