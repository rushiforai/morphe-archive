.class public final Ll/pix0;
.super Ll/oks0;
.source "SourceFile"


# instance fields
.field public final a:Ll/e70;

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ll/e70;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/oks0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pix0;->a:Ll/e70;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pix0;->b:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final t0(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pix0;->a:Ll/e70;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/client/zze;->H()Ll/jtv;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/e70;->a(Ll/jtv;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final zzc()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pix0;->a:Ll/e70;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/pix0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/e70;->b(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
