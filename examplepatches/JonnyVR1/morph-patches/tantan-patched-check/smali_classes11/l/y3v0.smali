.class public final synthetic Ll/y3v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# static fields
.field public static final synthetic a:Ll/y3v0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/y3v0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/y3v0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/y3v0;->a:Ll/y3v0;

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
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 0

    .line 1
    check-cast p1, Ljava/util/concurrent/TimeoutException;

    .line 2
    .line 3
    new-instance p0, Lcom/google/android/gms/internal/ads/zzead;

    .line 4
    .line 5
    const/4 p1, 0x5

    .line 6
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzead;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
