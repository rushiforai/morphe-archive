.class final Lcom/google/android/gms/internal/ads/zzciy;
.super Lcom/google/android/gms/internal/ads/zzhp;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/akx0;)V
    .locals 2

    .line 1
    const-string v0, "Invalid content range: "

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/16 v0, 0x7d0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/lang/String;Ll/akx0;II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
