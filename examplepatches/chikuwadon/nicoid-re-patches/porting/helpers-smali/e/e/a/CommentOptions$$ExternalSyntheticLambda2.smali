.class public final synthetic Le/e/a/CommentOptions$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:I

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:I

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:Ljava/lang/String;

.field public final synthetic f$7:Landroid/preference/Preference;

.field public final synthetic f$8:I


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/preference/Preference;I)V
    .registers 10

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$0:Landroid/preference/PreferenceActivity;

    iput p2, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$1:I

    iput p3, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$2:I

    iput-object p4, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$3:Ljava/lang/String;

    iput p5, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$4:I

    iput-object p6, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$5:Ljava/lang/String;

    iput-object p7, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$6:Ljava/lang/String;

    iput-object p8, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$7:Landroid/preference/Preference;

    iput p9, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$8:I

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 12

    .line 0
    iget-object v0, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$0:Landroid/preference/PreferenceActivity;

    iget v1, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$1:I

    iget v2, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$2:I

    iget-object v3, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$3:Ljava/lang/String;

    iget v4, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$4:I

    iget-object v5, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$5:Ljava/lang/String;

    iget-object v6, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$6:Ljava/lang/String;

    iget-object v7, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$7:Landroid/preference/Preference;

    iget v8, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;->f$8:I

    move-object v9, p1

    invoke-static/range {v0 .. v9}, Le/e/a/CommentOptions;->lambda$slider$2(Landroid/preference/PreferenceActivity;IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/preference/Preference;ILandroid/preference/Preference;)Z

    move-result p1

    return p1
.end method
