.class public final Ll/gks0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nwr0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/mps0;


# direct methods
.method public constructor <init>(Ll/bts0;Ljava/lang/String;Ll/mps0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/gks0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/gks0;->b:Ll/mps0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/ads/zzaqj;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "Failed to load URL: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/gks0;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "\n"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/gks0;->b:Ll/mps0;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, p1}, Ll/mps0;->zza(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
