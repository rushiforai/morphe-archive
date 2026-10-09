.class public final synthetic Le/e/a/ModernShorts$30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernShorts;"
    method = "lambda$extend$24"
    proto = "(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Le/e/a/ModernShorts$State;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$30;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/ModernShorts$30;->f$1:Le/e/a/ModernShorts$State;

    iput-object p3, p0, Le/e/a/ModernShorts$30;->f$2:Ljava/lang/String;

    iput-boolean p4, p0, Le/e/a/ModernShorts$30;->f$3:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$30;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/ModernShorts$30;->f$1:Le/e/a/ModernShorts$State;

    iget-object v2, p0, Le/e/a/ModernShorts$30;->f$2:Ljava/lang/String;

    iget-boolean v3, p0, Le/e/a/ModernShorts$30;->f$3:Z

    invoke-static {v0, v1, v2, v3}, Le/e/a/ModernShorts;->lambda$extend$24(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    return-void
.end method
