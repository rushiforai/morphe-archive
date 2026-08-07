.class public Ll/qfw$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qfw;->n(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/qfw;


# direct methods
.method public constructor <init>(Ll/qfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 2
    .line 3
    invoke-static {p1}, Ll/qfw;->f(Ll/qfw;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 11
    .line 12
    iget-object p1, p1, Ll/qfw;->b:Lv/VEditText;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p0, "\u6570\u636e\u4e3a\u7a7a"

    .line 25
    .line 26
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object v0, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 31
    .line 32
    invoke-static {v0}, Ll/qfw;->e(Ll/qfw;)Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingItem;->new_()Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v0, v1}, Ll/qfw;->j(Ll/qfw;Lcom/p1/mobile/putong/core/data/GreetingItem;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object v0, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 48
    .line 49
    invoke-static {v0}, Ll/qfw;->e(Ll/qfw;)Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GreetingItem;->value:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v0, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 60
    .line 61
    invoke-static {v0}, Ll/qfw;->e(Ll/qfw;)Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 66
    .line 67
    invoke-static {v1}, Ll/qfw;->d(Ll/qfw;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    const-string p1, "ai"

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    const-string p1, "custom"

    .line 81
    .line 82
    :goto_0
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/GreetingItem;->category:Ljava/lang/String;

    .line 83
    .line 84
    iget-object p1, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 85
    .line 86
    invoke-static {p1}, Ll/qfw;->i(Ll/qfw;)Ll/nfw;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object v0, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 91
    .line 92
    invoke-static {v0}, Ll/qfw;->e(Ll/qfw;)Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p1, v0}, Ll/nfw;->s0(Lcom/p1/mobile/putong/core/data/GreetingItem;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/qfw$c;->a:Ll/qfw;

    .line 100
    .line 101
    invoke-static {p0}, Ll/qfw;->c(Ll/qfw;)Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string p1, "e_love_radar_ai_hello"

    .line 110
    .line 111
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method
