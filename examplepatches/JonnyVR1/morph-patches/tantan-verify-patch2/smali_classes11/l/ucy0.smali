.class public final Ll/ucy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hby0;


# instance fields
.field public final a:Ll/fzy0;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/util/List;

.field public d:I

.field public e:Z


# direct methods
.method public constructor <init>(Ll/mzy0;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fzy0;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Ll/fzy0;-><init>(Ll/mzy0;Z)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ucy0;->a:Ll/fzy0;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/ucy0;->c:Ljava/util/List;

    .line 17
    .line 18
    new-instance p1, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/ucy0;->b:Ljava/lang/Object;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ucy0;->d:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Ll/ucy0;->e:Z

    .line 5
    .line 6
    iget-object p0, p0, Ll/ucy0;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final zza()Ll/d0u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucy0;->a:Ll/fzy0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzy0;->J()Ll/d0u0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucy0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method
