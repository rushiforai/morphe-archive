.class public final Ll/f6n$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r5n$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f6n;->r()V
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
        "l/f6n$a",
        "Ll/r5n$b;",
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
.field public final synthetic a:Ll/f6n;


# direct methods
.method public constructor <init>(Ll/f6n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f6n$a;->a:Ll/f6n;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(I)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne v0, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public a(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f6n$a;->a:Ll/f6n;

    .line 2
    .line 3
    invoke-static {v0}, Ll/f6n;->j(Ll/f6n;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/f6n$a;->a:Ll/f6n;

    .line 15
    .line 16
    invoke-static {p1}, Ll/f6n;->i(Ll/f6n;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p2, p0, Ll/f6n$a;->a:Ll/f6n;

    .line 21
    .line 22
    invoke-static {p2}, Ll/f6n;->f(Ll/f6n;)Ll/r5n;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    const-string p2, "adapter"

    .line 29
    .line 30
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    :cond_0
    invoke-virtual {p2}, Ll/r5n;->C()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    add-int/lit8 p2, p2, -0x1

    .line 39
    .line 40
    if-ne p1, p2, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Ll/f6n$a;->a:Ll/f6n;

    .line 43
    .line 44
    invoke-static {p1}, Ll/f6n;->j(Ll/f6n;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Ljava/util/Collection;

    .line 49
    .line 50
    new-instance p2, Ll/e6n;

    .line 51
    .line 52
    invoke-direct {p2}, Ll/e6n;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {p1, p2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iget-object p0, p0, Ll/f6n$a;->a:Ll/f6n;

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/f6n;->y()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const p1, 0x3e99999a    # 0.3f

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-virtual {p0}, Ll/f6n;->y()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const/high16 p1, 0x3f800000    # 1.0f

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method
