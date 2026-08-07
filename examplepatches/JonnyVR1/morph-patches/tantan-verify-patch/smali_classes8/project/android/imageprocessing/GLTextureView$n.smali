.class Lproject/android/imageprocessing/GLTextureView$n;
.super Lproject/android/imageprocessing/GLTextureView$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lproject/android/imageprocessing/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "n"
.end annotation


# instance fields
.field final synthetic k:Lproject/android/imageprocessing/GLTextureView;


# direct methods
.method public constructor <init>(Lproject/android/imageprocessing/GLTextureView;Z)V
    .locals 8

    .line 1
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView$n;->k:Lproject/android/imageprocessing/GLTextureView;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/16 p2, 0x10

    .line 6
    .line 7
    :goto_0
    move v6, p2

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const/4 p2, 0x0

    .line 10
    goto :goto_0

    .line 11
    :goto_1
    const/4 v7, 0x0

    .line 12
    const/16 v2, 0x8

    .line 13
    .line 14
    const/16 v3, 0x8

    .line 15
    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    move-object v0, p0

    .line 20
    move-object v1, p1

    .line 21
    invoke-direct/range {v0 .. v7}, Lproject/android/imageprocessing/GLTextureView$c;-><init>(Lproject/android/imageprocessing/GLTextureView;IIIIII)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
