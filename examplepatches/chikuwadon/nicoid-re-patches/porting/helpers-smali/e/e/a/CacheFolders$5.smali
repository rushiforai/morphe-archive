.class public final synthetic Le/e/a/CacheFolders$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CacheFolders;"
    method = "lambda$offerCopy$2"
    proto = "(Landroid/app/Activity;Ljava/io/File;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/io/File;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheFolders$5;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/CacheFolders$5;->f$1:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/CacheFolders$5;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/CacheFolders$5;->f$1:Ljava/io/File;

    invoke-static {v0, v1, p1, p2}, Le/e/a/CacheFolders;->lambda$offerCopy$2(Landroid/app/Activity;Ljava/io/File;Landroid/content/DialogInterface;I)V

    return-void
.end method
