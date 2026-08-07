.class public final Ll/htv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/htv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/htv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/htv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/htv0;->d:Ll/kqx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/htv0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 10
    .line 11
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Ll/htv0;->c:Ll/kqx0;

    .line 15
    .line 16
    check-cast v2, Ll/z5u0;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/z5u0;->a()Ll/o7w0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object p0, p0, Ll/htv0;->d:Ll/kqx0;

    .line 23
    .line 24
    check-cast p0, Ll/vlt0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v3, Ll/ftv0;

    .line 31
    .line 32
    invoke-direct {v3, v0, v1, v2, p0}, Ll/ftv0;-><init>(Landroid/content/Context;Ll/xvw0;Ll/o7w0;Lcom/google/android/gms/internal/ads/zzcei;)V

    .line 33
    .line 34
    .line 35
    return-object v3
.end method
