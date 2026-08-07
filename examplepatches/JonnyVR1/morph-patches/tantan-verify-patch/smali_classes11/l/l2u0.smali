.class public final Ll/l2u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/k2u0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/k2u0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l2u0;->a:Ll/k2u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/l2u0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/l2u0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l2u0;->b:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    iget-object p0, p0, Ll/l2u0;->c:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/w8t0;

    .line 16
    .line 17
    new-instance v1, Ll/w9s0;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v1, v0, p0, v2}, Ll/w9s0;-><init>(Landroid/content/Context;Ll/w8t0;Lcom/google/android/gms/internal/ads/zzbyk;)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method
