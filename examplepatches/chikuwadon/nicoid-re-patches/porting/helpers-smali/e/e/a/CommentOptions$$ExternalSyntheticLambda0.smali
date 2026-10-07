.class public final synthetic Le/e/a/CommentOptions$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/SeekBar;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/preference/PreferenceActivity;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Landroid/preference/Preference;

.field public final synthetic f$5:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/SeekBar;ILandroid/preference/PreferenceActivity;Ljava/lang/String;Landroid/preference/Preference;Ljava/lang/String;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$0:Landroid/widget/SeekBar;

    iput p2, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$1:I

    iput-object p3, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$2:Landroid/preference/PreferenceActivity;

    iput-object p4, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$4:Landroid/preference/Preference;

    iput-object p6, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$5:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 11

    .line 0
    iget-object v0, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$0:Landroid/widget/SeekBar;

    iget v1, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$1:I

    iget-object v2, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$2:Landroid/preference/PreferenceActivity;

    iget-object v3, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$4:Landroid/preference/Preference;

    iget-object v5, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;->f$5:Ljava/lang/String;

    move-object v6, p1

    move v7, p2

    invoke-static/range {v0 .. v7}, Le/e/a/CommentOptions;->lambda$slider$0(Landroid/widget/SeekBar;ILandroid/preference/PreferenceActivity;Ljava/lang/String;Landroid/preference/Preference;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
