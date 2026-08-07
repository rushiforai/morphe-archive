.class public final Ll/zmx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kdx0;


# instance fields
.field public final a:Ll/esx0;

.field public b:Ll/btx0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:I

.field public e:I

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/esx0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/esx0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zmx0;->a:Ll/esx0;

    .line 10
    .line 11
    const/16 v0, 0x1f40

    .line 12
    .line 13
    iput v0, p0, Ll/zmx0;->d:I

    .line 14
    .line 15
    iput v0, p0, Ll/zmx0;->e:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a(Z)Ll/zmx0;
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/zmx0;->f:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public final b(I)Ll/zmx0;
    .locals 0

    .line 1
    iput p1, p0, Ll/zmx0;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(I)Ll/zmx0;
    .locals 0

    .line 1
    iput p1, p0, Ll/zmx0;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Ll/btx0;)Ll/zmx0;
    .locals 0
    .param p1    # Ll/btx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/zmx0;->b:Ll/btx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ljava/lang/String;)Ll/zmx0;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/zmx0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()Ll/wqx0;
    .locals 9

    .line 1
    new-instance v0, Ll/wqx0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zmx0;->c:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Ll/zmx0;->d:I

    .line 6
    .line 7
    iget v3, p0, Ll/zmx0;->e:I

    .line 8
    .line 9
    iget-boolean v4, p0, Ll/zmx0;->f:Z

    .line 10
    .line 11
    iget-object v5, p0, Ll/zmx0;->a:Ll/esx0;

    .line 12
    .line 13
    const/4 v7, 0x0

    .line 14
    const/4 v8, 0x0

    .line 15
    const/4 v6, 0x0

    .line 16
    invoke-direct/range {v0 .. v8}, Ll/wqx0;-><init>(Ljava/lang/String;IIZLl/esx0;Ll/uow0;ZLl/rqx0;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/zmx0;->b:Ll/btx0;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/m8x0;->f(Ll/btx0;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-object v0
.end method

.method public final bridge synthetic zza()Ll/fex0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zmx0;->f()Ll/wqx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
