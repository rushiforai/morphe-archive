.class public final Lcqo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Leqo;


# direct methods
.method public constructor <init>(Leqo;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lcqo;->a:J

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcqo;->b:Leqo;

    return-void
.end method


# virtual methods
.method public final a(Luep;)Lcom/google/android/gms/tasks/Task;
    .registers 10

    iget-object v0, p0, Lcqo;->b:Leqo;

    iget-object v2, v0, Leqo;->a:Lypo;

    iget-wide v5, p0, Lcqo;->a:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    iget-object v0, v2, Lypo;->a:Ligp;

    const-string v1, "requestExpressIntegrityToken(%s)"

    invoke-virtual {v0, v1, p0}, Ligp;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v3, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v3}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    new-instance v1, Lrpo;

    move-object v7, v3

    move-object v4, p1

    invoke-direct/range {v1 .. v7}, Lrpo;-><init>(Lypo;Lcom/google/android/gms/tasks/TaskCompletionSource;Luep;JLcom/google/android/gms/tasks/TaskCompletionSource;)V

    iget-object p0, v2, Lypo;->f:Lvko;

    invoke-virtual {p0, v1, v3}, Lvko;->c(Ldip;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-virtual {v3}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method
