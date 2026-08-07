.class public final Ll/r9p$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w9p$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r9p;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0004\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "l/r9p$b",
        "Ll/w9p$a;",
        "",
        "position",
        "oid",
        "",
        "a",
        "(II)V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/r9p;


# direct methods
.method public constructor <init>(Ll/r9p;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r9p$b;->a:Ll/r9p;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/r9p;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/r9p;->y()Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ll/r9p;->f(Ll/r9p;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/r9p$b;->a:Ll/r9p;

    .line 2
    .line 3
    invoke-static {p1}, Ll/r9p;->f(Ll/r9p;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p2, p0, Ll/r9p$b;->a:Ll/r9p;

    .line 8
    .line 9
    invoke-static {p2}, Ll/r9p;->e(Ll/r9p;)Ll/w9p;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    const-string p2, "adapter"

    .line 16
    .line 17
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    :cond_0
    invoke-virtual {p2}, Ll/w9p;->C()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    add-int/lit8 p2, p2, -0x1

    .line 26
    .line 27
    if-eq p1, p2, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Ll/r9p$b;->a:Ll/r9p;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/r9p;->n()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p0, p0, Ll/r9p$b;->a:Ll/r9p;

    .line 36
    .line 37
    new-instance p2, Ll/s9p;

    .line 38
    .line 39
    invoke-direct {p2, p0}, Ll/s9p;-><init>(Ll/r9p;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 v0, 0x28

    .line 43
    .line 44
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method
