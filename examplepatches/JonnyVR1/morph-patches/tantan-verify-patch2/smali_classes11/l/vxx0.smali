.class public final Ll/vxx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/zzbf;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/iux0;


# direct methods
.method public constructor <init>(Ll/iux0;Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/vxx0;->a:Lcom/google/android/gms/measurement/internal/zzbf;

    .line 2
    .line 3
    iput-object p3, p0, Ll/vxx0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/vxx0;->c:Ll/iux0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vxx0;->c:Ll/iux0;

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
    iget-object v0, p0, Ll/vxx0;->c:Ll/iux0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/iux0;->P2(Ll/iux0;)Lcom/google/android/gms/measurement/internal/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/vxx0;->a:Lcom/google/android/gms/measurement/internal/zzbf;

    .line 17
    .line 18
    iget-object p0, p0, Ll/vxx0;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/measurement/internal/j;->r(Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
