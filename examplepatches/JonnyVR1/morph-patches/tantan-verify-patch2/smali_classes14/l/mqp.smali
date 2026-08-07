.class public final synthetic Ll/mqp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/oqp;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic c:I

.field public final synthetic d:Ljava/util/List;

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(Ll/oqp;Ljava/util/concurrent/atomic/AtomicInteger;ILjava/util/List;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mqp;->a:Ll/oqp;

    iput-object p2, p0, Ll/mqp;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    iput p3, p0, Ll/mqp;->c:I

    iput-object p4, p0, Ll/mqp;->d:Ljava/util/List;

    iput-wide p5, p0, Ll/mqp;->e:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/mqp;->a:Ll/oqp;

    iget-object v1, p0, Ll/mqp;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    iget v2, p0, Ll/mqp;->c:I

    iget-object v3, p0, Ll/mqp;->d:Ljava/util/List;

    iget-wide v4, p0, Ll/mqp;->e:J

    move-object v6, p1

    check-cast v6, Ljava/lang/Long;

    invoke-static/range {v0 .. v6}, Ll/oqp;->b(Ll/oqp;Ljava/util/concurrent/atomic/AtomicInteger;ILjava/util/List;JLjava/lang/Long;)V

    return-void
.end method
