.class public final Lamh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lqq8;

.field public final b:Lbp;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lqq8;Lbp;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lamh;->a:Lqq8;

    iput-object p2, p0, Lamh;->b:Lbp;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lamh;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(J)V
    .registers 4

    iget-object v0, p0, Lamh;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lamh;->a:Lqq8;

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Ltr3;

    iput-wide p1, p0, Ltr3;->a:J

    invoke-virtual {p0, p1, p2}, Ltr3;->p(J)V
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_10

    monitor-exit v0

    return-void

    :catchall_10
    move-exception p0

    monitor-exit v0

    throw p0
.end method
