.class public final synthetic Le/e/a/ModernShorts$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Le/e/a/NetworkTask;

.field public final synthetic f$2:Le/e/a/ModernShorts$State;

.field public final synthetic f$3:Le/e/a/ModernShorts$Result;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;->f$1:Le/e/a/NetworkTask;

    iput-object p3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;->f$2:Le/e/a/ModernShorts$State;

    iput-object p4, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;->f$3:Le/e/a/ModernShorts$Result;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;->f$1:Le/e/a/NetworkTask;

    iget-object v2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;->f$2:Le/e/a/ModernShorts$State;

    iget-object v3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;->f$3:Le/e/a/ModernShorts$Result;

    invoke-static {v0, v1, v2, v3}, Le/e/a/ModernShorts;->lambda$requestSearch$28(Ljava/lang/String;Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V

    return-void
.end method
