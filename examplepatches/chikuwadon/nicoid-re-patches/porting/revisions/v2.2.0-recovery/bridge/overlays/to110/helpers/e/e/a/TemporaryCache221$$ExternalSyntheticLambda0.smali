.class public final synthetic Le/e/a/TemporaryCache221$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/ImageDiskCache;

.field public final synthetic f$1:Landroid/preference/PreferenceActivity;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ImageDiskCache;Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda0;->f$0:Le/e/a/ImageDiskCache;

    iput-object p2, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda0;->f$1:Landroid/preference/PreferenceActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda0;->f$0:Le/e/a/ImageDiskCache;

    iget-object v1, p0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda0;->f$1:Landroid/preference/PreferenceActivity;

    invoke-static {v0, v1}, Le/e/a/TemporaryCache221;->lambda$inspect$3(Le/e/a/ImageDiskCache;Landroid/preference/PreferenceActivity;)V

    return-void
.end method
