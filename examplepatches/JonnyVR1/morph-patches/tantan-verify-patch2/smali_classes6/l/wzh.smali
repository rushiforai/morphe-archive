.class public Ll/wzh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/SpanWatcher;


# instance fields
.field public a:Ljava/lang/Class;

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/wzh;->b:I

    .line 6
    .line 7
    iput v0, p0, Ll/wzh;->c:I

    .line 8
    .line 9
    iput-object p1, p0, Ll/wzh;->a:Ljava/lang/Class;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onSpanAdded(Landroid/text/Spannable;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSpanChanged(Landroid/text/Spannable;Ljava/lang/Object;IIII)V
    .locals 3

    .line 1
    sget-object p3, Landroid/text/Selection;->SELECTION_END:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 p4, 0x0

    .line 4
    if-ne p2, p3, :cond_2

    .line 5
    .line 6
    iget p3, p0, Ll/wzh;->c:I

    .line 7
    .line 8
    if-eq p3, p5, :cond_2

    .line 9
    .line 10
    iput p5, p0, Ll/wzh;->c:I

    .line 11
    .line 12
    iget-object p3, p0, Ll/wzh;->a:Ljava/lang/Class;

    .line 13
    .line 14
    invoke-interface {p1, p5, p6, p3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    if-eqz p3, :cond_5

    .line 19
    .line 20
    array-length v0, p3

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_0
    aget-object p3, p3, p4

    .line 25
    .line 26
    invoke-interface {p1, p3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-interface {p1, p3}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    iget v1, p0, Ll/wzh;->c:I

    .line 35
    .line 36
    sub-int/2addr v1, p3

    .line 37
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iget v2, p0, Ll/wzh;->c:I

    .line 42
    .line 43
    sub-int/2addr v2, v0

    .line 44
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-le v1, v2, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move v0, p3

    .line 52
    :goto_0
    invoke-static {p1}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    invoke-static {p1, p3, v0}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 57
    .line 58
    .line 59
    :cond_2
    sget-object p3, Landroid/text/Selection;->SELECTION_START:Ljava/lang/Object;

    .line 60
    .line 61
    if-ne p2, p3, :cond_5

    .line 62
    .line 63
    iget p2, p0, Ll/wzh;->b:I

    .line 64
    .line 65
    if-eq p2, p5, :cond_5

    .line 66
    .line 67
    iput p5, p0, Ll/wzh;->b:I

    .line 68
    .line 69
    iget-object p2, p0, Ll/wzh;->a:Ljava/lang/Class;

    .line 70
    .line 71
    invoke-interface {p1, p5, p6, p2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    if-eqz p2, :cond_5

    .line 76
    .line 77
    array-length p3, p2

    .line 78
    if-nez p3, :cond_3

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    aget-object p2, p2, p4

    .line 82
    .line 83
    invoke-interface {p1, p2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 84
    .line 85
    .line 86
    move-result p3

    .line 87
    invoke-interface {p1, p2}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    iget p4, p0, Ll/wzh;->b:I

    .line 92
    .line 93
    sub-int/2addr p4, p2

    .line 94
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    .line 95
    .line 96
    .line 97
    move-result p4

    .line 98
    iget p0, p0, Ll/wzh;->b:I

    .line 99
    .line 100
    sub-int/2addr p0, p3

    .line 101
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-le p4, p0, :cond_4

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_4
    move p3, p2

    .line 109
    :goto_1
    invoke-static {p1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-static {p1, p3, p0}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 114
    .line 115
    .line 116
    :cond_5
    :goto_2
    return-void
.end method

.method public onSpanRemoved(Landroid/text/Spannable;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    return-void
.end method
