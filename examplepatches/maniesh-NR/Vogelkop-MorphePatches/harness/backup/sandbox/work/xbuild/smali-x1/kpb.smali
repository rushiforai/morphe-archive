.class public final Lkpb;
.super Llpb;
.source "SourceFile"


# instance fields
.field public final e:Z


# direct methods
.method public constructor <init>(Lqq6;Z)V
    .registers 5

    const/4 v0, 0x0

    const-string v1, ""

    invoke-direct {p0, p1, v0, v1, v1}, Llpb;-><init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;)V

    iput-boolean p2, p0, Lkpb;->e:Z

    return-void
.end method


# virtual methods
.method public final b()I
    .registers 1

    iget-boolean p0, p0, Lkpb;->e:Z

    if-eqz p0, :cond_8

    const p0, 0x7f1408a2

    return p0

    :cond_8
    const p0, 0x7f1408a5

    return p0
.end method

.method public final d()I
    .registers 1

    iget-boolean p0, p0, Lkpb;->e:Z

    if-eqz p0, :cond_8

    const p0, 0x7f1408a4

    return p0

    :cond_8
    const p0, 0x7f1408a3

    return p0
.end method

.method public final e(Laz0;Landroid/widget/LinearLayout;)V
    .registers 3

    invoke-super {p0, p1, p2}, Llpb;->e(Laz0;Landroid/widget/LinearLayout;)V

    iget-boolean p0, p0, Lkpb;->e:Z

    if-eqz p0, :cond_b

    const p0, 0x7f1408a0

    goto :goto_e

    :cond_b
    const p0, 0x7f1408a1

    :goto_e
    invoke-virtual {p1, p0}, Laz0;->b(I)V

    return-void
.end method
