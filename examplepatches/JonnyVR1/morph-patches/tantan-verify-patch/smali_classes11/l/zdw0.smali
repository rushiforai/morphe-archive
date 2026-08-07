.class public final Ll/zdw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/cew0;

.field public final synthetic b:Ll/rdw0;

.field public final synthetic c:Z


# direct methods
.method public constructor <init>(Ll/cew0;Ll/rdw0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zdw0;->a:Ll/cew0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zdw0;->b:Ll/rdw0;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/zdw0;->c:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zdw0;->b:Ll/rdw0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/rdw0;->zzj()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/zdw0;->a:Ll/cew0;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ll/rdw0;->b(Ljava/lang/Throwable;)Ll/rdw0;

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-interface {v0, p1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 19
    .line 20
    .line 21
    iget-boolean p1, p0, Ll/zdw0;->c:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/zdw0;->a:Ll/cew0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/cew0;->g()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final zzb(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/zdw0;->b:Ll/rdw0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p1, v0}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/zdw0;->a:Ll/cew0;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Ll/zdw0;->c:Z

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/zdw0;->a:Ll/cew0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/cew0;->g()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
