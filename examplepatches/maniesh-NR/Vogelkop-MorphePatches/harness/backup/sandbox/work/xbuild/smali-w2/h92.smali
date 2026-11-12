.class public final Lh92;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Lqre;

.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lqre;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lh92;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p1, p0, Lh92;->a:Ljava/lang/String;

    iput-object p2, p0, Lh92;->b:Ljava/lang/String;

    iput-object p3, p0, Lh92;->c:Lqre;

    return-void
.end method
