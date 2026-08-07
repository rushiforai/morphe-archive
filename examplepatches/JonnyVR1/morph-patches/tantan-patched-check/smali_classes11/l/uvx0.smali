.class public final Ll/uvx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/zzo;

.field public final synthetic b:Ll/iux0;


# direct methods
.method public constructor <init>(Ll/iux0;Lcom/google/android/gms/measurement/internal/zzo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/uvx0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 2
    .line 3
    iput-object p1, p0, Ll/uvx0;->b:Ll/iux0;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uvx0;->b:Ll/iux0;

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
    iget-object v0, p0, Ll/uvx0;->b:Ll/iux0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/iux0;->P2(Ll/iux0;)Lcom/google/android/gms/measurement/internal/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/uvx0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/google/android/gms/measurement/internal/j;->a0(Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
