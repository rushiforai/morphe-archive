.class public final synthetic Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:Le/e/a/TemporaryCache221$Result;

.field public final synthetic f$2:Le/e/a/ImageDiskCache;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;Le/e/a/TemporaryCache221$Result;Le/e/a/ImageDiskCache;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;->f$0:Landroid/preference/PreferenceActivity;

    iput-object p2, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;->f$1:Le/e/a/TemporaryCache221$Result;

    iput-object p3, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;->f$2:Le/e/a/ImageDiskCache;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;->f$0:Landroid/preference/PreferenceActivity;

    iget-object v1, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;->f$1:Le/e/a/TemporaryCache221$Result;

    iget-object v2, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;->f$2:Le/e/a/ImageDiskCache;

    invoke-static {v0, v1, v2}, Le/e/a/TemporaryCache221;->lambda$inspect$2(Landroid/preference/PreferenceActivity;Le/e/a/TemporaryCache221$Result;Le/e/a/ImageDiskCache;)V

    return-void
.end method
