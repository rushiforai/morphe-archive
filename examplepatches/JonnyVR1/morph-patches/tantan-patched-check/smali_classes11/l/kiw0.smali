.class public final Ll/kiw0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/google/android/gms/common/internal/ShowFirstParty;
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Landroid/os/Looper;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Looper;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kiw0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kiw0;->b:Landroid/os/Looper;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/w1;->L()Ll/xiw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/kiw0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/xiw0;->q(Ljava/lang/String;)Ll/xiw0;

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-virtual {v0, v1}, Ll/xiw0;->s(I)Ll/xiw0;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/google/android/gms/internal/ads/v1;->L()Ll/viw0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2, p1}, Ll/viw0;->q(Ljava/lang/String;)Ll/viw0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ll/viw0;->r(I)Ll/viw0;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ll/xiw0;->r(Ll/viw0;)Ll/xiw0;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/google/android/gms/internal/ads/w1;

    .line 36
    .line 37
    new-instance v0, Ll/liw0;

    .line 38
    .line 39
    iget-object v1, p0, Ll/kiw0;->a:Landroid/content/Context;

    .line 40
    .line 41
    iget-object p0, p0, Ll/kiw0;->b:Landroid/os/Looper;

    .line 42
    .line 43
    invoke-direct {v0, v1, p0, p1}, Ll/liw0;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/internal/ads/w1;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ll/liw0;->a()V

    .line 47
    .line 48
    .line 49
    return-void
.end method
