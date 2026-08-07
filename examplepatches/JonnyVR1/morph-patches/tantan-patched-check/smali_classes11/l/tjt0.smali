.class public final Ll/tjt0;
.super Ll/wft0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    const/4 p0, 0x0

    .line 5
    throw p0
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wft0;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final e(Ljava/lang/Object;)Ll/tjt0;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/wft0;->b(Ljava/lang/Object;)Ll/wft0;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final f()Lcom/google/android/gms/internal/play_billing/zzco;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/wft0;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/wft0;->a:[Ljava/lang/Object;

    .line 5
    .line 6
    iget p0, p0, Ll/wft0;->b:I

    .line 7
    .line 8
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/play_billing/zzco;->zzj([Ljava/lang/Object;I)Lcom/google/android/gms/internal/play_billing/zzco;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
