.class public final Lk1o;
.super Lg1o;
.source "SourceFile"


# instance fields
.field public final g:B


# direct methods
.method public constructor <init>(ILjava/lang/String;I)V
    .registers 11

    const v4, 0x7f060cba

    const/4 v6, 0x0

    const v2, 0x7f08068d

    const v3, 0x7f140471

    move-object v0, p0

    move v5, p1

    move-object v1, p2

    invoke-direct/range {v0 .. v6}, Lg1o;-><init>(Ljava/lang/String;IIIII)V

    iput-byte p3, v0, Lk1o;->g:B

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lk1o;->g:B

    if-eqz p0, :cond_1d

    const/4 v0, 0x2

    if-eq p0, v0, :cond_19

    const/4 v0, 0x3

    if-eq p0, v0, :cond_15

    const/4 v0, 0x4

    if-eq p0, v0, :cond_11

    const p0, 0x7f141183

    goto :goto_20

    :cond_11
    const p0, 0x7f141405

    goto :goto_20

    :cond_15
    const p0, 0x7f141406

    goto :goto_20

    :cond_19
    const p0, 0x7f141403

    goto :goto_20

    :cond_1d
    const p0, 0x7f141266

    :goto_20
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b()I
    .registers 2

    iget-byte p0, p0, Lk1o;->g:B

    if-eqz p0, :cond_c

    const/4 v0, 0x3

    if-eq p0, v0, :cond_c

    const/4 v0, 0x4

    if-eq p0, v0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    const/4 p0, 0x1

    return p0
.end method

.method public final c()I
    .registers 2

    iget-byte p0, p0, Lk1o;->g:B

    if-eqz p0, :cond_f

    const/4 v0, 0x2

    if-eq p0, v0, :cond_f

    const/4 v0, 0x3

    if-eq p0, v0, :cond_f

    const/4 v0, 0x4

    if-eq p0, v0, :cond_f

    const/4 p0, 0x0

    return p0

    :cond_f
    const/4 p0, 0x1

    return p0
.end method

.method public final d()Z
    .registers 2

    const/4 v0, 0x4

    iget-byte p0, p0, Lk1o;->g:B

    if-eq p0, v0, :cond_c

    const/4 v0, 0x3

    if-eq p0, v0, :cond_c

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method
