.class public final synthetic Le/e/a/SpeedSlider$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/SpeedSlider;"
    method = "lambda$settings$2"
    proto = "(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/preference/Preference;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:Landroid/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SpeedSlider$0;->f$0:Landroid/preference/PreferenceActivity;

    iput-object p2, p0, Le/e/a/SpeedSlider$0;->f$1:Landroid/preference/Preference;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/SpeedSlider$0;->f$0:Landroid/preference/PreferenceActivity;

    iget-object v1, p0, Le/e/a/SpeedSlider$0;->f$1:Landroid/preference/Preference;

    invoke-static {v0, v1, p1}, Le/e/a/SpeedSlider;->lambda$settings$2(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/preference/Preference;)Z

    move-result p1

    return p1
.end method
