.class public final synthetic Le/e/a/CacheFolders$7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CacheFolders;"
    method = "lambda$started$0"
    proto = "(Landroid/content/Context;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheFolders$7;->f$0:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/CacheFolders$7;->f$0:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/CacheFolders;->lambda$started$0(Landroid/content/Context;)V

    return-void
.end method
