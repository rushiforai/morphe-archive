.class Ltech/sud/runtime/component/c/d$i;
.super Ltech/sud/runtime/component/c/d$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "i"
.end annotation


# instance fields
.field final synthetic j:Ltech/sud/runtime/component/c/d;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/c/d;Z)V
    .locals 8

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/c/d$i;->j:Ltech/sud/runtime/component/c/d;

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
    invoke-direct/range {v0 .. v7}, Ltech/sud/runtime/component/c/d$b;-><init>(Ltech/sud/runtime/component/c/d;IIIIII)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
