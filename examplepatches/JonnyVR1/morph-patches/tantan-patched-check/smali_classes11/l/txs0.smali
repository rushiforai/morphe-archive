.class public final Ll/txs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u7y;


# instance fields
.field public final a:Ljava/util/Date;

.field public final b:I

.field public final c:Ljava/util/Set;

.field public final d:Z

.field public final e:Landroid/location/Location;

.field public final f:I

.field public final g:Z

.field public final h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/Date;ILjava/util/Set;Landroid/location/Location;ZIZILjava/lang/String;)V
    .locals 0
    .param p1    # Ljava/util/Date;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Set;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/location/Location;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/txs0;->a:Ljava/util/Date;

    .line 5
    .line 6
    iput p2, p0, Ll/txs0;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/txs0;->c:Ljava/util/Set;

    .line 9
    .line 10
    iput-object p4, p0, Ll/txs0;->e:Landroid/location/Location;

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/txs0;->d:Z

    .line 13
    .line 14
    iput p6, p0, Ll/txs0;->f:I

    .line 15
    .line 16
    iput-boolean p7, p0, Ll/txs0;->g:Z

    .line 17
    .line 18
    iput-object p9, p0, Ll/txs0;->h:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/txs0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/txs0;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/txs0;->c:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/txs0;->d:Z

    .line 2
    .line 3
    return p0
.end method
