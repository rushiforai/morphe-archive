.class public final synthetic Ll/ijt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuw0;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ll/v2s0;

.field public final synthetic c:Lcom/google/android/gms/internal/ads/zzcei;

.field public final synthetic d:Ll/far0;

.field public final synthetic e:Ll/qbv0;

.field public final synthetic f:Ll/s7w0;

.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ll/v2s0;Lcom/google/android/gms/internal/ads/zzcei;Ll/far0;Ll/qbv0;Ll/s7w0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ijt0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ijt0;->b:Ll/v2s0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ijt0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 9
    .line 10
    iput-object p4, p0, Ll/ijt0;->d:Ll/far0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/ijt0;->e:Ll/qbv0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/ijt0;->f:Ll/s7w0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/ijt0;->g:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final zza()Ll/hpr;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->B()Ll/jjt0;

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Ll/ijt0;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {}, Ll/xkt0;->a()Ll/xkt0;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-object v6, v0, Ll/ijt0;->b:Ll/v2s0;

    .line 13
    .line 14
    iget-object v15, v0, Ll/ijt0;->e:Ll/qbv0;

    .line 15
    .line 16
    iget-object v11, v0, Ll/ijt0;->d:Ll/far0;

    .line 17
    .line 18
    iget-object v8, v0, Ll/ijt0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 19
    .line 20
    iget-object v3, v0, Ll/ijt0;->f:Ll/s7w0;

    .line 21
    .line 22
    invoke-static {}, Ll/fcs0;->a()Ll/fcs0;

    .line 23
    .line 24
    .line 25
    move-result-object v12

    .line 26
    const/4 v13, 0x0

    .line 27
    const/4 v14, 0x0

    .line 28
    move-object/from16 v16, v3

    .line 29
    .line 30
    const-string v3, ""

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    const/4 v5, 0x0

    .line 34
    const/4 v7, 0x0

    .line 35
    const/4 v9, 0x0

    .line 36
    const/4 v10, 0x0

    .line 37
    invoke-static/range {v1 .. v16}, Ll/jjt0;->a(Landroid/content/Context;Ll/xkt0;Ljava/lang/String;ZZLl/v2s0;Ll/his0;Lcom/google/android/gms/internal/ads/zzcei;Ll/khs0;Ll/d9y0;Ll/far0;Ll/fcs0;Ll/q6w0;Ll/t6w0;Ll/qbv0;Ll/s7w0;)Ll/wit0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Ll/sct0;->d(Ljava/lang/Object;)Ll/sct0;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v1}, Ll/wit0;->zzN()Ll/nkt0;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    new-instance v4, Ll/hjt0;

    .line 50
    .line 51
    invoke-direct {v4, v2}, Ll/hjt0;-><init>(Ll/sct0;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v3, v4}, Ll/nkt0;->zzB(Ll/lkt0;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, v0, Ll/ijt0;->g:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v1, v0}, Ll/wit0;->loadUrl(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object v2
.end method
