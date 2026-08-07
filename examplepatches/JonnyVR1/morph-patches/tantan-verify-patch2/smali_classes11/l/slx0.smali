.class public final Ll/slx0;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/RandomAccess;
.implements Ll/jjx0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/jjx0;


# direct methods
.method public constructor <init>(Ll/jjx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/slx0;->a:Ll/jjx0;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/slx0;)Ll/jjx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/slx0;->a:Ll/jjx0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final Z(Lcom/google/android/gms/internal/ads/zzgyl;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public final bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/slx0;->a:Ll/jjx0;

    .line 2
    .line 3
    check-cast p0, Ll/ijx0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ijx0;->c(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final iterator()Ljava/util/Iterator;
    .locals 1

    .line 1
    new-instance v0, Ll/rlx0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rlx0;-><init>(Ll/slx0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final listIterator(I)Ljava/util/ListIterator;
    .locals 1

    .line 1
    new-instance v0, Ll/qlx0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/qlx0;-><init>(Ll/slx0;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/slx0;->a:Ll/jjx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final zze()Ll/jjx0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public final zzf(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/slx0;->a:Ll/jjx0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/jjx0;->zzf(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzh()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/slx0;->a:Ll/jjx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/jjx0;->zzh()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
