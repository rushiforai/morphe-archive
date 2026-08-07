.class public Ll/zxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xxe;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VButton_FakeShadow;

.field public final c:Lcom/p1/mobile/putong/app/PutongAct;

.field public d:Ll/xxe;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zxe;->c:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/zxe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zxe;->e(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zxe;->c:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zxe;->c:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/aye;->b(Ll/zxe;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/xxe;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zxe;->d:Ll/xxe;

    .line 2
    .line 3
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/SignInData;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/zxe;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, v0, Lcom/p1/mobile/android/app/Act;->hackCenterTitle:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/zxe;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v2, Lcom/p1/mobile/putong/account/R$string;->i4:I

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/zxe;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v2, Ll/bbc0;->P1:I

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ll/c30;->B(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/zxe;->b:Lv/VButton_FakeShadow;

    .line 31
    .line 32
    new-instance v2, Ll/yxe;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/yxe;-><init>(Ll/zxe;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v0, p0, Ll/zxe;->a:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/zxe;->C0()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget v2, Lcom/p1/mobile/putong/account/R$string;->h4:I

    .line 49
    .line 50
    filled-new-array {p1}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    const/4 v4, 0x2

    .line 59
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const/high16 v5, -0x22000000

    .line 64
    .line 65
    invoke-static {p1, v3, v5, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-array v1, v1, [Ljava/lang/CharSequence;

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    aput-object p1, v1, v3

    .line 73
    .line 74
    invoke-static {p0, v2, v1}, Ll/hmj0;->a(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/Spannable;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zxe;->d:Ll/xxe;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xxe;->g0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zxe;->c:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->R(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xxe;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zxe;->c(Ll/xxe;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zxe;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
