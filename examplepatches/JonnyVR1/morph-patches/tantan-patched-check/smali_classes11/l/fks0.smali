.class public final Ll/fks0;
.super Ll/zks0;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/drawable/Drawable;

.field public final b:Landroid/net/Uri;

.field public final c:D

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/net/Uri;DII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zks0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fks0;->a:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fks0;->b:Landroid/net/Uri;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/fks0;->c:D

    .line 9
    .line 10
    iput p5, p0, Ll/fks0;->d:I

    .line 11
    .line 12
    iput p6, p0, Ll/fks0;->e:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final zzb()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/fks0;->c:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzc()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fks0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final zzd()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fks0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public final zze()Landroid/net/Uri;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fks0;->b:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzf()Ll/p1m;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fks0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
