.class public final synthetic Le/e/a/SpeedSlider$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/SpeedSlider$Selection;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/SpeedSlider;"
    method = "lambda$settings$1"
    proto = "(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;F)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:Landroid/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SpeedSlider$2;->f$0:Landroid/preference/PreferenceActivity;

    iput-object p2, p0, Le/e/a/SpeedSlider$2;->f$1:Landroid/preference/Preference;

    return-void
.end method


# virtual methods
.method public final selected(F)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/SpeedSlider$2;->f$0:Landroid/preference/PreferenceActivity;

    iget-object v1, p0, Le/e/a/SpeedSlider$2;->f$1:Landroid/preference/Preference;

    invoke-static {v0, v1, p1}, Le/e/a/SpeedSlider;->lambda$settings$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;F)V

    return-void
.end method
