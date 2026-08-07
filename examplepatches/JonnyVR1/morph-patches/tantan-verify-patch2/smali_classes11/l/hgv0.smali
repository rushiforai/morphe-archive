.class public final Ll/hgv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/q6w0;

.field public final synthetic b:Ll/igv0;


# direct methods
.method public constructor <init>(Ll/igv0;Ll/q6w0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/hgv0;->a:Ll/q6w0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/hgv0;->b:Ll/igv0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hgv0;->b:Ll/igv0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/hgv0;->b:Ll/igv0;

    .line 5
    .line 6
    invoke-static {v1}, Ll/igv0;->a(Ll/igv0;)Ll/jgv0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Ll/hgv0;->a:Ll/q6w0;

    .line 11
    .line 12
    invoke-virtual {v1, p1, v2}, Ll/jgv0;->b(Ljava/lang/Throwable;Ll/q6w0;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/hgv0;->b:Ll/igv0;

    .line 16
    .line 17
    invoke-static {p1}, Ll/igv0;->a(Ll/igv0;)Ll/jgv0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/jgv0;->e()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/hgv0;->b:Ll/igv0;

    .line 28
    .line 29
    invoke-static {p0}, Ll/igv0;->a(Ll/igv0;)Ll/jgv0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/jgv0;->a()Ll/q6w0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0, p1}, Ll/igv0;->c(Ll/igv0;Ll/q6w0;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit v0

    .line 44
    return-void

    .line 45
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p0
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hgv0;->b:Ll/igv0;

    .line 2
    .line 3
    check-cast p1, Ll/fhv0;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/hgv0;->b:Ll/igv0;

    .line 7
    .line 8
    invoke-static {v1}, Ll/igv0;->a(Ll/igv0;)Ll/jgv0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Ll/hgv0;->a:Ll/q6w0;

    .line 13
    .line 14
    invoke-virtual {v1, p1, v2}, Ll/jgv0;->c(Ll/fhv0;Ll/q6w0;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/hgv0;->b:Ll/igv0;

    .line 18
    .line 19
    invoke-static {p1}, Ll/igv0;->a(Ll/igv0;)Ll/jgv0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/jgv0;->e()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/hgv0;->b:Ll/igv0;

    .line 30
    .line 31
    invoke-static {p0}, Ll/igv0;->a(Ll/igv0;)Ll/jgv0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/jgv0;->a()Ll/q6w0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p0, p1}, Ll/igv0;->c(Ll/igv0;Ll/q6w0;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    :goto_0
    monitor-exit v0

    .line 46
    return-void

    .line 47
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0
.end method
