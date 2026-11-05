.class public final synthetic Le/e/a/Followup173$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/Followup173;"
    method = "lambda$showLimit$1"
    proto = "(Landroid/widget/SeekBar;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/widget/SeekBar;

.field public final synthetic f$1:Landroid/preference/PreferenceActivity;

.field public final synthetic f$2:Landroid/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/SeekBar;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Followup173$3;->f$0:Landroid/widget/SeekBar;

    iput-object p2, p0, Le/e/a/Followup173$3;->f$1:Landroid/preference/PreferenceActivity;

    iput-object p3, p0, Le/e/a/Followup173$3;->f$2:Landroid/preference/Preference;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/Followup173$3;->f$0:Landroid/widget/SeekBar;

    iget-object v1, p0, Le/e/a/Followup173$3;->f$1:Landroid/preference/PreferenceActivity;

    iget-object v2, p0, Le/e/a/Followup173$3;->f$2:Landroid/preference/Preference;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/Followup173;->lambda$showLimit$1(Landroid/widget/SeekBar;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/content/DialogInterface;I)V

    return-void
.end method
