.class public final Ll/sfv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcv0;


# instance fields
.field public final a:Ll/huu0;


# direct methods
.method public constructor <init>(Ll/huu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sfv0;->a:Ll/huu0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lorg/json/JSONObject;)Ll/scv0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sfv0;->a:Ll/huu0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/huu0;->c(Ljava/lang/String;Lorg/json/JSONObject;)Ll/r8w0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p2, Ll/vev0;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/vev0;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/scv0;

    .line 13
    .line 14
    invoke-direct {v0, p0, p2, p1}, Ll/scv0;-><init>(Ljava/lang/Object;Ll/g8u0;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method
