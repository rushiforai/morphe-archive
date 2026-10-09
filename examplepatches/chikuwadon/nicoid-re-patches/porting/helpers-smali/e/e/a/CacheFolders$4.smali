.class public final synthetic Le/e/a/CacheFolders$4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CacheFolders;"
    method = "lambda$copy$5"
    proto = "(Ljava/io/File;Ljava/lang/String;Landroid/app/Activity;Landroid/app/ProgressDialog;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/io/File;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Landroid/app/ProgressDialog;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ljava/lang/String;Landroid/app/Activity;Landroid/app/ProgressDialog;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheFolders$4;->f$0:Ljava/io/File;

    iput-object p2, p0, Le/e/a/CacheFolders$4;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/CacheFolders$4;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/CacheFolders$4;->f$3:Landroid/app/ProgressDialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/CacheFolders$4;->f$0:Ljava/io/File;

    iget-object v1, p0, Le/e/a/CacheFolders$4;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/CacheFolders$4;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/CacheFolders$4;->f$3:Landroid/app/ProgressDialog;

    invoke-static {v0, v1, v2, v3}, Le/e/a/CacheFolders;->lambda$copy$5(Ljava/io/File;Ljava/lang/String;Landroid/app/Activity;Landroid/app/ProgressDialog;)V

    return-void
.end method
