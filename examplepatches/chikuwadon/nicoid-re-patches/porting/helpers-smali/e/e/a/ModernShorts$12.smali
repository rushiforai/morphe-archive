.class public final synthetic Le/e/a/ModernShorts$12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernShorts;"
    method = "lambda$monitorRefresh$29"
    proto = "(ILandroid/app/Activity;)V"
.end annotation


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(ILandroid/app/Activity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/ModernShorts$12;->f$0:I

    iput-object p2, p0, Le/e/a/ModernShorts$12;->f$1:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget v0, p0, Le/e/a/ModernShorts$12;->f$0:I

    iget-object v1, p0, Le/e/a/ModernShorts$12;->f$1:Landroid/app/Activity;

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->lambda$monitorRefresh$29(ILandroid/app/Activity;)V

    return-void
.end method
