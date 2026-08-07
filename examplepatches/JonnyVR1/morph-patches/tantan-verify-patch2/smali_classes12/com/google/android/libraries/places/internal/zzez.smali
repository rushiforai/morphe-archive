.class final Lcom/google/android/libraries/places/internal/zzez;
.super Ll/qrq;
.source "SourceFile"


# instance fields
.field final synthetic zza:Ljava/util/Map;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzfa;ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/d$b;Lcom/android/volley/d$a;Ljava/util/Map;)V
    .locals 0

    .line 1
    iput-object p7, p0, Lcom/google/android/libraries/places/internal/zzez;->zza:Ljava/util/Map;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    move-object p2, p3

    .line 5
    const/4 p3, 0x0

    .line 6
    move-object p4, p5

    .line 7
    move-object p5, p6

    .line 8
    invoke-direct/range {p0 .. p5}, Ll/qrq;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/d$b;Lcom/android/volley/d$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final getHeaders()Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzez;->zza:Ljava/util/Map;

    return-object p0
.end method
