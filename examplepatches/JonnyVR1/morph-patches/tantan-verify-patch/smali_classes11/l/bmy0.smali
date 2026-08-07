.class public final Ll/bmy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/os/Bundle;

.field public final synthetic d:Ll/vly0;


# direct methods
.method public constructor <init>(Ll/vly0;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/bmy0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/bmy0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/bmy0;->c:Landroid/os/Bundle;

    .line 6
    .line 7
    iput-object p1, p0, Ll/bmy0;->d:Ll/vly0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/bmy0;->d:Ll/vly0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vly0;->a:Lcom/google/android/gms/measurement/internal/j;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->t0()Ll/hny0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bmy0;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v3, p0, Ll/bmy0;->b:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v4, p0, Ll/bmy0;->c:Landroid/os/Bundle;

    .line 14
    .line 15
    iget-object v0, p0, Ll/bmy0;->d:Ll/vly0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/vly0;->a:Lcom/google/android/gms/measurement/internal/j;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v6

    .line 27
    const/4 v8, 0x0

    .line 28
    const/4 v9, 0x1

    .line 29
    const-string v5, "auto"

    .line 30
    .line 31
    invoke-virtual/range {v1 .. v9}, Ll/hny0;->B(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;JZZ)Lcom/google/android/gms/measurement/internal/zzbf;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Ll/bmy0;->d:Ll/vly0;

    .line 36
    .line 37
    iget-object v1, v1, Ll/vly0;->a:Lcom/google/android/gms/measurement/internal/j;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/google/android/gms/measurement/internal/zzbf;

    .line 44
    .line 45
    iget-object p0, p0, Ll/bmy0;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v0, p0}, Lcom/google/android/gms/measurement/internal/j;->r(Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
