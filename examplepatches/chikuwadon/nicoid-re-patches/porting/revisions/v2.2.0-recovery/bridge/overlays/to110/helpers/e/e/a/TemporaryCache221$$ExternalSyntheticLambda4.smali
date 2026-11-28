.class public final synthetic Le/e/a/TemporaryCache221$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:Le/e/a/TemporaryCache221$Result;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;Le/e/a/TemporaryCache221$Result;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda4;->f$0:Landroid/preference/PreferenceActivity;

    iput-object p2, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda4;->f$1:Le/e/a/TemporaryCache221$Result;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda4;->f$0:Landroid/preference/PreferenceActivity;

    iget-object v1, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda4;->f$1:Le/e/a/TemporaryCache221$Result;

    invoke-static {v0, v1}, Le/e/a/TemporaryCache221;->lambda$clear$4(Landroid/preference/PreferenceActivity;Le/e/a/TemporaryCache221$Result;)V

    return-void
.end method
