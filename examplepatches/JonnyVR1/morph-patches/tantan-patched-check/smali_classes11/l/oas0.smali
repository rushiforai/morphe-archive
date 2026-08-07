.class public final Ll/oas0;
.super Ll/vas0;
.source "SourceFile"


# instance fields
.field public final a:Ll/bx0$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/bx0$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vas0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oas0;->a:Ll/bx0$a;

    .line 5
    .line 6
    iput-object p2, p0, Ll/oas0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final K3(Ll/tas0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oas0;->a:Ll/bx0$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/oas0;->b:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ll/pas0;

    .line 8
    .line 9
    invoke-direct {v1, p1, v0}, Ll/pas0;-><init>(Ll/tas0;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/oas0;->a:Ll/bx0$a;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/e70;->b(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final K7(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oas0;->a:Ll/bx0$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/client/zze;->H()Ll/jtv;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/oas0;->a:Ll/bx0$a;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/e70;->a(Ll/jtv;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final e(I)V
    .locals 0

    .line 1
    return-void
.end method
