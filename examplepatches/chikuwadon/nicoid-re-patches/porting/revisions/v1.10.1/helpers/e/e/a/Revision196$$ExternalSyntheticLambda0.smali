.class public final synthetic Le/e/a/Revision196$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:Landroid/preference/Preference;

.field public final synthetic f$2:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Revision196$$ExternalSyntheticLambda0;->f$0:Landroid/preference/PreferenceActivity;

    iput-object p2, p0, Le/e/a/Revision196$$ExternalSyntheticLambda0;->f$1:Landroid/preference/Preference;

    iput-object p3, p0, Le/e/a/Revision196$$ExternalSyntheticLambda0;->f$2:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/Revision196$$ExternalSyntheticLambda0;->f$0:Landroid/preference/PreferenceActivity;

    iget-object v1, p0, Le/e/a/Revision196$$ExternalSyntheticLambda0;->f$1:Landroid/preference/Preference;

    iget-object v2, p0, Le/e/a/Revision196$$ExternalSyntheticLambda0;->f$2:[Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Le/e/a/Revision196;->lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/String;Landroid/preference/Preference;)Z

    move-result p1

    return p1
.end method
