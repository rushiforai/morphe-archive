.class public final Ll/duy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/huy0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/sqr0;)I
    .locals 0

    .line 1
    iget-object p0, p1, Ll/sqr0;->o:Lcom/google/android/gms/internal/ads/zzae;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
