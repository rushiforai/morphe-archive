.class public final synthetic Ll/uos0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# static fields
.field public static final synthetic a:Ll/uos0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/uos0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uos0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/uos0;->a:Ll/uos0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 1

    .line 1
    check-cast p1, Ll/ckt0;

    .line 2
    .line 3
    sget-object p0, Ll/aqs0;->a:Ll/bqs0;

    .line 4
    .line 5
    const-string p0, "u"

    .line 6
    .line 7
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const-string p0, "URL missing from httpTrack GMSG."

    .line 16
    .line 17
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance p2, Ll/s6t0;

    .line 22
    .line 23
    invoke-interface {p1}, Ll/ckt0;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast p1, Ll/jkt0;

    .line 28
    .line 29
    invoke-interface {p1}, Ll/jkt0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 34
    .line 35
    invoke-direct {p2, v0, p1, p0}, Ll/s6t0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ll/aas0;->b()Ll/hpr;

    .line 39
    .line 40
    .line 41
    return-void
.end method
