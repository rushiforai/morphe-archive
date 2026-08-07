.class final Lcom/google/android/libraries/places/internal/zzeu;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static zza(Lcom/android/volley/VolleyError;)Lcom/google/android/gms/common/api/ApiException;
    .locals 3

    .line 1
    instance-of v0, p0, Lcom/android/volley/NetworkError;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x7

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    instance-of v0, p0, Lcom/android/volley/TimeoutError;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/16 v0, 0xf

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    instance-of v0, p0, Lcom/android/volley/ServerError;

    .line 15
    .line 16
    const/16 v1, 0x8

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    instance-of v0, p0, Lcom/android/volley/ParseError;

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    :cond_2
    move v0, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_3
    instance-of v0, p0, Lcom/android/volley/AuthFailureError;

    .line 27
    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    const/16 v0, 0x2333

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_4
    const/16 v0, 0xd

    .line 34
    .line 35
    :goto_0
    iget-object v1, p0, Lcom/android/volley/VolleyError;->networkResponse:Ll/cl20;

    .line 36
    .line 37
    if-nez v1, :cond_5

    .line 38
    .line 39
    const-string v1, "N/A"

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_5
    iget v1, v1, Ll/cl20;->a:I

    .line 43
    .line 44
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    :goto_1
    filled-new-array {v1, p0}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string v1, "Unexpected server error (HTTP Code: %s. Message: %s.)"

    .line 53
    .line 54
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance v1, Lcom/google/android/gms/common/api/ApiException;

    .line 59
    .line 60
    new-instance v2, Lcom/google/android/gms/common/api/Status;

    .line 61
    .line 62
    invoke-direct {v2, v0, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 66
    .line 67
    .line 68
    return-object v1
.end method
