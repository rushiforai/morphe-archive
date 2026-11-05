.class public final synthetic Le/e/a/Followup3$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Le/e/a/Followup3$Job;

.field public final synthetic f$2:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Le/e/a/Followup3$Job;Ljava/lang/Object;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Followup3$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/Followup3$$ExternalSyntheticLambda3;->f$1:Le/e/a/Followup3$Job;

    iput-object p3, p0, Le/e/a/Followup3$$ExternalSyntheticLambda3;->f$2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/Followup3$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/Followup3$$ExternalSyntheticLambda3;->f$1:Le/e/a/Followup3$Job;

    iget-object v2, p0, Le/e/a/Followup3$$ExternalSyntheticLambda3;->f$2:Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Le/e/a/Followup3;->lambda$refresh$0(Ljava/lang/Object;Le/e/a/Followup3$Job;Ljava/lang/Object;)V

    return-void
.end method
