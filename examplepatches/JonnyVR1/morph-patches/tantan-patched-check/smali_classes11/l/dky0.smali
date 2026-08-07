.class public final Ll/dky0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kmy0;

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/j;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/j;Ll/kmy0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/dky0;->a:Ll/kmy0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/dky0;->b:Lcom/google/android/gms/measurement/internal/j;

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
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dky0;->b:Lcom/google/android/gms/measurement/internal/j;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dky0;->a:Ll/kmy0;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/j;->s(Lcom/google/android/gms/measurement/internal/j;Ll/kmy0;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/dky0;->b:Lcom/google/android/gms/measurement/internal/j;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/j;->y0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
