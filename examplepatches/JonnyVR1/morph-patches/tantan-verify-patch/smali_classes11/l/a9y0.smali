.class public final Ll/a9y0;
.super Ll/dix0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/gtx0;


# direct methods
.method public constructor <init>(Ll/gtx0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a9y0;->a:Ll/gtx0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dix0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final D2(Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a9y0;->a:Ll/gtx0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/qqw0;->a(Lcom/google/android/gms/common/api/Status;)Ll/qqw0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->setResult(Lcom/google/android/gms/common/api/Result;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final q5(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/auth/api/credentials/Credential;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a9y0;->a:Ll/gtx0;

    .line 2
    .line 3
    new-instance v0, Ll/qqw0;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/qqw0;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/auth/api/credentials/Credential;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->setResult(Lcom/google/android/gms/common/api/Result;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
