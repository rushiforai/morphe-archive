.class public Ll/ufw$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ufw$a;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/ufw$a;


# direct methods
.method public constructor <init>(Ll/ufw$a;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ufw$a$a;->b:Ll/ufw$a;

    .line 2
    .line 3
    iput p2, p0, Ll/ufw$a$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .line 1
    iget v0, p0, Ll/ufw$a$a;->a:I

    .line 2
    .line 3
    const-string v1, "\u5b8c\u6210"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ll/ufw$a$a;->b:Ll/ufw$a;

    .line 9
    .line 10
    iget-object v0, v0, Ll/ufw$a;->a:Ll/ufw;

    .line 11
    .line 12
    iget-object v0, v0, Ll/ufw;->h:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v3, p0, Ll/ufw$a$a;->b:Ll/ufw$a;

    .line 19
    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, v3, Ll/ufw$a;->a:Ll/ufw;

    .line 23
    .line 24
    iget-object v0, v0, Ll/ufw;->c:Lv/VText;

    .line 25
    .line 26
    const-string v1, "\u4e0b\u4e00\u6b65"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, v3, Ll/ufw$a;->a:Ll/ufw;

    .line 33
    .line 34
    iget-object v0, v0, Ll/ufw;->c:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v0, p0, Ll/ufw$a$a;->b:Ll/ufw$a;

    .line 40
    .line 41
    iget-object v0, v0, Ll/ufw$a;->a:Ll/ufw;

    .line 42
    .line 43
    iget-object v0, v0, Ll/ufw;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 44
    .line 45
    iget p0, p0, Ll/ufw$a$a;->a:I

    .line 46
    .line 47
    add-int/2addr p0, v2

    .line 48
    invoke-virtual {v0, p0}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    if-ne v0, v2, :cond_3

    .line 53
    .line 54
    iget-object v0, p0, Ll/ufw$a$a;->b:Ll/ufw$a;

    .line 55
    .line 56
    iget-object v0, v0, Ll/ufw$a;->a:Ll/ufw;

    .line 57
    .line 58
    iget-object v0, v0, Ll/ufw;->h:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v3, p0, Ll/ufw$a$a;->b:Ll/ufw$a;

    .line 65
    .line 66
    if-lez v0, :cond_2

    .line 67
    .line 68
    iget-object v0, v3, Ll/ufw$a;->a:Ll/ufw;

    .line 69
    .line 70
    iget-object v0, v0, Ll/ufw;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 71
    .line 72
    iget v3, p0, Ll/ufw$a$a;->a:I

    .line 73
    .line 74
    add-int/2addr v3, v2

    .line 75
    invoke-virtual {v0, v3}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    iget-object v0, v3, Ll/ufw$a;->a:Ll/ufw;

    .line 80
    .line 81
    invoke-static {v0}, Ll/ufw;->a(Ll/ufw;)Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 86
    .line 87
    .line 88
    :goto_1
    iget-object p0, p0, Ll/ufw$a$a;->b:Ll/ufw$a;

    .line 89
    .line 90
    iget-object p0, p0, Ll/ufw$a;->a:Ll/ufw;

    .line 91
    .line 92
    iget-object p0, p0, Ll/ufw;->c:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    const/4 v1, 0x2

    .line 99
    if-ne v0, v1, :cond_4

    .line 100
    .line 101
    iget-object p0, p0, Ll/ufw$a$a;->b:Ll/ufw$a;

    .line 102
    .line 103
    iget-object p0, p0, Ll/ufw$a;->a:Ll/ufw;

    .line 104
    .line 105
    invoke-static {p0}, Ll/ufw;->a(Ll/ufw;)Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 110
    .line 111
    .line 112
    :cond_4
    return-void
.end method
