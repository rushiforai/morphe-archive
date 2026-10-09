.class public final synthetic Le/e/a/ModernShorts$29;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/ModernShorts$Result;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernShorts;"
    method = "lambda$loadFeed$9"
    proto = "(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;ZLjava/util/ArrayList;Ljava/lang/Exception;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/ModernShorts$State;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Le/e/a/ModernShorts$Home;

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;Z)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$29;->f$0:Le/e/a/ModernShorts$State;

    iput-object p2, p0, Le/e/a/ModernShorts$29;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/ModernShorts$29;->f$2:Le/e/a/ModernShorts$Home;

    iput-boolean p4, p0, Le/e/a/ModernShorts$29;->f$3:Z

    return-void
.end method


# virtual methods
.method public final done(Ljava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$29;->f$0:Le/e/a/ModernShorts$State;

    iget-object v1, p0, Le/e/a/ModernShorts$29;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/ModernShorts$29;->f$2:Le/e/a/ModernShorts$Home;

    iget-boolean v3, p0, Le/e/a/ModernShorts$29;->f$3:Z

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/ModernShorts;->lambda$loadFeed$9(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;ZLjava/util/ArrayList;Ljava/lang/Exception;)V

    return-void
.end method
