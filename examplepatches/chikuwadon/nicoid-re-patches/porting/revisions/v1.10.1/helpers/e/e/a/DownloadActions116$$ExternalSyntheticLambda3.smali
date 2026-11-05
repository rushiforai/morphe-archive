.class public final synthetic Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Le/e/a/DownloadActions116;->lambda$0(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
