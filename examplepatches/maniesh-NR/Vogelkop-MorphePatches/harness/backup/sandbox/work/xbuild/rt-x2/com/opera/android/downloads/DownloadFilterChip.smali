.class public final Lcom/opera/android/downloads/DownloadFilterChip;
.super Lcom/opera/android/ui/catalog/widget/OperaChip;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/downloads/DownloadFilterChip;",
        "Lcom/opera/android/ui/catalog/widget/OperaChip;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/chip/Chip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final setChecked(Z)V
    .registers 3

    invoke-super {p0, p1}, Lcom/google/android/material/chip/Chip;->setChecked(Z)V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v0, :cond_a

    invoke-virtual {v0, p1}, Ltx4;->T(Z)V

    :cond_a
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->i()V

    xor-int/lit8 p1, p1, 0x1

    if-eqz v0, :cond_14

    invoke-virtual {v0, p1}, Ltx4;->Q(Z)V

    :cond_14
    return-void
.end method
