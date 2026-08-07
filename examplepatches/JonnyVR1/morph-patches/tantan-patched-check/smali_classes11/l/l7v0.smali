.class public final synthetic Ll/l7v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/u7v0;

.field public final synthetic b:Ll/hpr;

.field public final synthetic c:Ll/hpr;

.field public final synthetic d:Lcom/google/android/gms/internal/ads/zzbze;

.field public final synthetic e:Ll/rdw0;


# direct methods
.method public synthetic constructor <init>(Ll/u7v0;Ll/hpr;Ll/hpr;Lcom/google/android/gms/internal/ads/zzbze;Ll/rdw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l7v0;->a:Ll/u7v0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/l7v0;->b:Ll/hpr;

    .line 7
    .line 8
    iput-object p3, p0, Ll/l7v0;->c:Ll/hpr;

    .line 9
    .line 10
    iput-object p4, p0, Ll/l7v0;->d:Lcom/google/android/gms/internal/ads/zzbze;

    .line 11
    .line 12
    iput-object p5, p0, Ll/l7v0;->e:Ll/rdw0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l7v0;->a:Ll/u7v0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/l7v0;->b:Ll/hpr;

    .line 4
    .line 5
    iget-object v2, p0, Ll/l7v0;->c:Ll/hpr;

    .line 6
    .line 7
    iget-object v3, p0, Ll/l7v0;->d:Lcom/google/android/gms/internal/ads/zzbze;

    .line 8
    .line 9
    iget-object p0, p0, Ll/l7v0;->e:Ll/rdw0;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/u7v0;->s8(Ll/hpr;Ll/hpr;Lcom/google/android/gms/internal/ads/zzbze;Ll/rdw0;)Ljava/io/InputStream;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
