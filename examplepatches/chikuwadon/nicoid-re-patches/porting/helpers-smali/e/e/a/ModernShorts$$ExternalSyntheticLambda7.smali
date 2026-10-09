.class public final synthetic Le/e/a/ModernShorts$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Le/e/a/ModernShorts$State;

.field public final synthetic f$2:Le/e/a/ModernShorts$Result;

.field public final synthetic f$3:Ljava/util/ArrayList;

.field public final synthetic f$4:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$1:Le/e/a/ModernShorts$State;

    iput-object p3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$2:Le/e/a/ModernShorts$Result;

    iput-object p4, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$3:Ljava/util/ArrayList;

    iput-object p5, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$4:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$1:Le/e/a/ModernShorts$State;

    iget-object v2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$2:Le/e/a/ModernShorts$Result;

    iget-object v3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$3:Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;->f$4:Ljava/lang/Exception;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/ModernShorts;->lambda$complete$26(Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V

    return-void
.end method
