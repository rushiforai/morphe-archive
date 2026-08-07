.class public final Lcom/google/android/libraries/places/internal/zzbay;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "internal:health-check-consumer-listener"

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbay;->zza:Ljava/lang/String;

    return-void
.end method

.method public static zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbay;
    .locals 2

    new-instance p0, Lcom/google/android/libraries/places/internal/zzbay;

    const-string v0, "internal:health-check-consumer-listener"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbay;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbay;->zza:Ljava/lang/String;

    return-object p0
.end method
