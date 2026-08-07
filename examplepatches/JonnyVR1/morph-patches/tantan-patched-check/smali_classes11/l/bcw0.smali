.class public final Ll/bcw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/mbw0;

.field public final synthetic b:Ll/dcw0;


# direct methods
.method public constructor <init>(Ll/dcw0;Ll/mbw0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/bcw0;->a:Ll/mbw0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/bcw0;->b:Ll/dcw0;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bcw0;->b:Ll/dcw0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dcw0;->f:Ll/ecw0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/ecw0;->c(Ll/ecw0;)Ll/fcw0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/bcw0;->a:Ll/mbw0;

    .line 10
    .line 11
    invoke-interface {v0, p0, p1}, Ll/fcw0;->k(Ll/mbw0;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final zzb(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bcw0;->b:Ll/dcw0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/dcw0;->f:Ll/ecw0;

    .line 4
    .line 5
    invoke-static {p1}, Ll/ecw0;->c(Ll/ecw0;)Ll/fcw0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/bcw0;->a:Ll/mbw0;

    .line 10
    .line 11
    invoke-interface {p1, p0}, Ll/fcw0;->d0(Ll/mbw0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
