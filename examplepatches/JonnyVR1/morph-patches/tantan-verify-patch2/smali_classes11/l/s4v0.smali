.class public final Ll/s4v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x9u0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/s9t0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/s9t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s4v0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/s4v0;->b:Ll/s9t0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final A(Ll/b7w0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/t6w0;->d:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/s4v0;->b:Ll/s9t0;

    .line 14
    .line 15
    iget-object v1, p0, Ll/s4v0;->a:Landroid/content/Context;

    .line 16
    .line 17
    iget-object v2, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 18
    .line 19
    iget-object v2, v2, Ll/y6w0;->a:Ll/o7w0;

    .line 20
    .line 21
    iget-object v2, v2, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ll/s9t0;->m(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzl;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/s4v0;->b:Ll/s9t0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/s4v0;->a:Landroid/content/Context;

    .line 29
    .line 30
    iget-object p1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 31
    .line 32
    iget-object p1, p1, Ll/a7w0;->b:Ll/t6w0;

    .line 33
    .line 34
    iget-object p1, p1, Ll/t6w0;->d:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, p0, p1}, Ll/s9t0;->i(Landroid/content/Context;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final x(Lcom/google/android/gms/internal/ads/zzbze;)V
    .locals 0

    .line 1
    return-void
.end method
