.class public final Ll/e2u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hdu0;
.implements Ll/k8u0;


# instance fields
.field public final a:Lcom/google/android/gms/common/util/Clock;

.field public final b:Ll/g2u0;

.field public final c:Ll/o7w0;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/util/Clock;Ll/g2u0;Ll/o7w0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e2u0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 5
    .line 6
    iput-object p2, p0, Ll/e2u0;->b:Ll/g2u0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/e2u0;->c:Ll/o7w0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/e2u0;->d:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e2u0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    iget-object v1, p0, Ll/e2u0;->b:Ll/g2u0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/e2u0;->d:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-virtual {v1, p0, v2, v3}, Ll/g2u0;->e(Ljava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final zzr()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e2u0;->c:Ll/o7w0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/e2u0;->b:Ll/g2u0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->f:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Ll/e2u0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 8
    .line 9
    iget-object p0, p0, Ll/e2u0;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    invoke-virtual {v1, v0, p0, v2, v3}, Ll/g2u0;->d(Ljava/lang/String;Ljava/lang/String;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
