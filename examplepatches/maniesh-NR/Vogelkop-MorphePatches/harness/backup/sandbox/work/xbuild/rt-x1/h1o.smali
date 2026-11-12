.class public final Lh1o;
.super Lg1o;
.source "SourceFile"


# instance fields
.field public final g:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;Z)V
    .registers 11

    const v4, 0x7f060cb7

    const/4 v6, 0x1

    const v2, 0x7f08068c

    const v3, 0x7f14117e

    move-object v0, p0

    move v5, p1

    move-object v1, p2

    invoke-direct/range {v0 .. v6}, Lg1o;-><init>(Ljava/lang/String;IIIII)V

    iput-boolean p3, v0, Lh1o;->g:Z

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-boolean p0, p0, Lh1o;->g:Z

    if-eqz p0, :cond_8

    const p0, 0x7f141404

    goto :goto_b

    :cond_8
    const p0, 0x7f14139f

    :goto_b
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
