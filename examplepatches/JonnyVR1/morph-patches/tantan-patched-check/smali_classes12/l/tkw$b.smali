.class Ll/tkw$b;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tkw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tkw$b$a;
    }
.end annotation


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/rkw;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic c:Ll/tkw;


# direct methods
.method public constructor <init>(Ll/tkw;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ll/rkw;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tkw$b;->c:Ll/tkw;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/tkw$b;->a:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/tkw$b;->b:Ljava/util/ArrayList;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(I)Ll/rkw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkw$b;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/rkw;

    .line 8
    .line 9
    return-object p0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkw$b;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tkw$b;->a(I)Ll/rkw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/tkw$b;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p3, p0, Ll/tkw$b;->c:Ll/tkw;

    .line 10
    .line 11
    invoke-static {p3}, Ll/tkw;->c(Ll/tkw;)I

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    new-instance p3, Ll/tkw$b$a;

    .line 21
    .line 22
    invoke-direct {p3, p0, v0}, Ll/tkw$b$a;-><init>(Ll/tkw$b;Ll/tkw$a;)V

    .line 23
    .line 24
    .line 25
    sget v0, Ll/pcc0;->i:I

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/ImageView;

    .line 32
    .line 33
    iput-object v0, p3, Ll/tkw$b$a;->a:Landroid/widget/ImageView;

    .line 34
    .line 35
    sget v0, Ll/pcc0;->j:I

    .line 36
    .line 37
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/widget/TextView;

    .line 42
    .line 43
    iput-object v0, p3, Ll/tkw$b$a;->b:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    check-cast p3, Ll/tkw$b$a;

    .line 54
    .line 55
    :goto_0
    invoke-virtual {p0, p1}, Ll/tkw$b;->a(I)Ll/rkw;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iget-object p1, p3, Ll/tkw$b$a;->b:Landroid/widget/TextView;

    .line 60
    .line 61
    iget-object v0, p0, Ll/rkw;->a:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/hkw;->a()Ll/hkw;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object p0, p0, Ll/rkw;->b:Ljava/lang/String;

    .line 71
    .line 72
    iget-object p3, p3, Ll/tkw$b$a;->a:Landroid/widget/ImageView;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    invoke-virtual {p1, p0, p3, v0}, Ll/hkw;->c(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 76
    .line 77
    .line 78
    return-object p2
.end method
