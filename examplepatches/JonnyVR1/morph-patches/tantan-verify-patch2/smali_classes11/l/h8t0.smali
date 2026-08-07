.class public final Ll/h8t0;
.super Ll/r7t0;
.source "SourceFile"


# instance fields
.field public final a:Ll/w8d0;

.field public final b:Ll/v8d0;


# direct methods
.method public constructor <init>(Ll/w8d0;Ll/v8d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/r7t0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h8t0;->a:Ll/w8d0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/h8t0;->b:Ll/v8d0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final f(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h8t0;->a:Ll/w8d0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/client/zze;->H()Ll/jtv;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/h8t0;->a:Ll/w8d0;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/e70;->a(Ll/jtv;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final zze(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzg()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h8t0;->a:Ll/w8d0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/h8t0;->b:Ll/v8d0;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/e70;->b(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
