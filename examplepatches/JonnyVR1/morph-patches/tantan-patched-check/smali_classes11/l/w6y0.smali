.class public final Ll/w6y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/w6y0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    iput-object p2, p0, Ll/w6y0;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Ll/w6y0;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p5, p0, Ll/w6y0;->d:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p0, Ll/w6y0;->e:Lcom/google/android/gms/measurement/internal/g;

    .line 11
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w6y0;->e:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/atx0;->E()Ll/hcy0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/w6y0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    iget-object v2, p0, Ll/w6y0;->c:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Ll/w6y0;->d:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v0, v1, v3, v2, p0}, Ll/hcy0;->D(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
