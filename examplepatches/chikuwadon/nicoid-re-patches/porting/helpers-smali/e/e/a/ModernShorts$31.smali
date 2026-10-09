.class public final synthetic Le/e/a/ModernShorts$31;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/ModernShorts$Result;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernShorts;"
    method = "lambda$extend$25"
    proto = "(Le/e/a/ModernShorts$State;Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/lang/Exception;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/ModernShorts$State;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$31;->f$0:Le/e/a/ModernShorts$State;

    iput-object p2, p0, Le/e/a/ModernShorts$31;->f$1:Landroid/app/Activity;

    iput-boolean p3, p0, Le/e/a/ModernShorts$31;->f$2:Z

    return-void
.end method


# virtual methods
.method public final done(Ljava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$31;->f$0:Le/e/a/ModernShorts$State;

    iget-object v1, p0, Le/e/a/ModernShorts$31;->f$1:Landroid/app/Activity;

    iget-boolean v2, p0, Le/e/a/ModernShorts$31;->f$2:Z

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/ModernShorts;->lambda$extend$25(Le/e/a/ModernShorts$State;Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/lang/Exception;)V

    return-void
.end method
