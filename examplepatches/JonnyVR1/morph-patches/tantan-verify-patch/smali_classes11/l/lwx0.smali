.class public final Ll/lwx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/util/List<",
        "Ll/ymy0;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/iux0;


# direct methods
.method public constructor <init>(Ll/iux0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/lwx0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/lwx0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/lwx0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Ll/lwx0;->d:Ll/iux0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/lwx0;->d:Ll/iux0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/iux0;->P2(Ll/iux0;)Lcom/google/android/gms/measurement/internal/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->u0()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/lwx0;->d:Ll/iux0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/iux0;->P2(Ll/iux0;)Lcom/google/android/gms/measurement/internal/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->g0()Ll/opr0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/lwx0;->a:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p0, Ll/lwx0;->b:Ljava/lang/String;

    .line 23
    .line 24
    iget-object p0, p0, Ll/lwx0;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2, p0}, Ll/opr0;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method
