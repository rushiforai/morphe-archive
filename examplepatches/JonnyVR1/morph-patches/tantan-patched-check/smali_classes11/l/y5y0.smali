.class public final Ll/y5y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-wide p2, p0, Ll/y5y0;->a:J

    .line 2
    .line 3
    iput-object p1, p0, Ll/y5y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y5y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/y5y0;->a:J

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/g;->G0(J)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/y5y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/v1v0;->n()Ll/hcy0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/hcy0;->B(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
