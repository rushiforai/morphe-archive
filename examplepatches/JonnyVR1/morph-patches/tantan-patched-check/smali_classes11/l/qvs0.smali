.class public final Ll/qvs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vct0;


# instance fields
.field public final synthetic a:Ll/tct0;

.field public final synthetic b:Ll/vus0;


# direct methods
.method public constructor <init>(Ll/aws0;Ll/tct0;Ll/vus0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/qvs0;->a:Ll/tct0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/qvs0;->b:Ll/vus0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 2

    .line 1
    const-string v0, "callJs > getEngine: Promise rejected"

    .line 2
    .line 3
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/google/android/gms/internal/ads/zzbrm;

    .line 7
    .line 8
    const-string v1, "Unable to obtain a JavascriptEngine."

    .line 9
    .line 10
    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ads/zzbrm;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/qvs0;->a:Ll/tct0;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/qvs0;->b:Ll/vus0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/vus0;->g()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
