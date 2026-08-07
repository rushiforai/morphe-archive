.class public Ll/byw$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/byw;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/byw;


# direct methods
.method public constructor <init>(Ll/byw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/byw$c;->a:Ll/byw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->oe()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p1, Ll/th0$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/byw$c;->a:Ll/byw;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/byw;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {p1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-virtual {p1, p0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "\u786e\u5b9a\u8981\u5168\u90e8\u5df2\u8bfb\u6d88\u606f\u5417\uff1f"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "\u786e\u5b9a"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Ll/cyw;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/cyw;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "\u53d6\u6d88"

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ll/dyw;

    .line 45
    .line 46
    invoke-direct {p1}, Ll/dyw;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 58
    .line 59
    .line 60
    return-void
.end method
