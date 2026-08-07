.class public final synthetic Ll/b9r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/google/android/gms/ads/AdFormat;

.field public final synthetic c:Ll/s70;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/yvb0;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdFormat;Ll/s70;Ljava/lang/String;Ll/yvb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b9r0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b9r0;->b:Lcom/google/android/gms/ads/AdFormat;

    .line 7
    .line 8
    iput-object p3, p0, Ll/b9r0;->c:Ll/s70;

    .line 9
    .line 10
    iput-object p4, p0, Ll/b9r0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Ll/b9r0;->e:Ll/yvb0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/b9r0;->c:Ll/s70;

    .line 2
    .line 3
    new-instance v1, Ll/r2t0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {v0}, Ll/s70;->a()Ll/xxu0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    iget-object v2, p0, Ll/b9r0;->e:Ll/yvb0;

    .line 14
    .line 15
    iget-object v3, p0, Ll/b9r0;->d:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v4, p0, Ll/b9r0;->b:Lcom/google/android/gms/ads/AdFormat;

    .line 18
    .line 19
    iget-object p0, p0, Ll/b9r0;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-direct {v1, p0, v4, v0, v3}, Ll/r2t0;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdFormat;Ll/xxu0;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ll/r2t0;->b(Ll/yvb0;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
