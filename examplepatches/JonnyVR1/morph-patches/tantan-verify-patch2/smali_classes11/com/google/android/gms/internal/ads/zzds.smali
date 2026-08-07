.class public final Lcom/google/android/gms/internal/ads/zzds;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public final zza:Ll/mqu0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/mqu0;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "Unhandled input format: "

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/google/android/gms/internal/ads/zzds;->zza:Ll/mqu0;

    .line 15
    .line 16
    return-void
.end method
