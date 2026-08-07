.class public Lcom/p1/mobile/android/app/Dialog$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Dialog;->U()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    iget-object p4, p1, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 4
    .line 5
    sget-object p5, Lcom/p1/mobile/android/app/Dialog$ListType;->MULTI:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 6
    .line 7
    if-ne p4, p5, :cond_2

    .line 8
    .line 9
    sget p1, Ll/vcc0;->B:I

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Landroid/widget/CheckBox;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p4, p0, Lcom/p1/mobile/android/app/Dialog$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 22
    .line 23
    iget-object p4, p4, Lcom/p1/mobile/android/app/Dialog;->H:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object p5

    .line 29
    invoke-interface {p4, p5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p4

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    if-nez p4, :cond_3

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    iget-object p4, p1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 40
    .line 41
    iget p4, p4, Lcom/p1/mobile/android/app/Dialog$e;->a0:I

    .line 42
    .line 43
    const/4 p5, -0x1

    .line 44
    if-eq p4, p5, :cond_0

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog;->H:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget-object p4, p0, Lcom/p1/mobile/android/app/Dialog$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 53
    .line 54
    iget-object p4, p4, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    iget p5, p4, Lcom/p1/mobile/android/app/Dialog$e;->a0:I

    .line 57
    .line 58
    if-lt p1, p5, :cond_0

    .line 59
    .line 60
    iget-object p0, p4, Lcom/p1/mobile/android/app/Dialog$e;->b0:Ljava/lang/Runnable;

    .line 61
    .line 62
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog;->H:Ljava/util/List;

    .line 69
    .line 70
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    if-eqz p4, :cond_3

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog;->H:Ljava/util/List;

    .line 83
    .line 84
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-interface {p1, p3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    sget-object p5, Lcom/p1/mobile/android/app/Dialog$ListType;->SINGLE:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 93
    .line 94
    if-ne p4, p5, :cond_3

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 97
    .line 98
    iget p4, p1, Lcom/p1/mobile/android/app/Dialog$e;->H:I

    .line 99
    .line 100
    if-eq p4, p3, :cond_3

    .line 101
    .line 102
    iput p3, p1, Lcom/p1/mobile/android/app/Dialog$e;->H:I

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    .line 105
    .line 106
    check-cast p1, Lcom/p1/mobile/android/app/Dialog$h;

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 109
    .line 110
    .line 111
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 112
    .line 113
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog;->onClick(Landroid/view/View;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method
