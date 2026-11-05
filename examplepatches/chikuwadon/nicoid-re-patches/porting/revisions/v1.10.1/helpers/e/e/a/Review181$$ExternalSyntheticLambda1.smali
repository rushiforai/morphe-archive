.class public final synthetic Le/e/a/Review181$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;II)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Review181$$ExternalSyntheticLambda1;->f$0:Landroid/preference/PreferenceActivity;

    iput p2, p0, Le/e/a/Review181$$ExternalSyntheticLambda1;->f$1:I

    iput p3, p0, Le/e/a/Review181$$ExternalSyntheticLambda1;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/Review181$$ExternalSyntheticLambda1;->f$0:Landroid/preference/PreferenceActivity;

    iget v1, p0, Le/e/a/Review181$$ExternalSyntheticLambda1;->f$1:I

    iget v2, p0, Le/e/a/Review181$$ExternalSyntheticLambda1;->f$2:I

    invoke-static {v0, v1, v2}, Le/e/a/Review181;->lambda$1(Landroid/preference/PreferenceActivity;II)V

    return-void
.end method
