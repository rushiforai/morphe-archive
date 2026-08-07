.class public Ll/krl0;
.super Ll/a;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Lcom/p1/mobile/putong/data/MessageLocation;",
        ">;",
        "Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView$a;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/psl0;

.field public e:Ll/gsl0;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/psl0;Ll/gsl0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/krl0;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ll/hrl0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/hrl0;-><init>(Ll/krl0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/krl0;->f:Ll/y20;

    .line 17
    .line 18
    iput-object p1, p0, Ll/krl0;->d:Ll/psl0;

    .line 19
    .line 20
    iput-object p2, p0, Ll/krl0;->e:Ll/gsl0;

    .line 21
    .line 22
    return-void
.end method

.method private synthetic A(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;Ll/z80;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/data/DoublePair;

    .line 4
    .line 5
    invoke-virtual {p3}, Ll/z80;->d()D

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-virtual {p3}, Ll/z80;->e()D

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/data/DoublePair;-><init>(DD)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/gsl0;->E0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p3}, Ll/z80;->b()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p3}, Ll/z80;->a()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    iput-object p3, p1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    if-nez p3, :cond_1

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p0, p0, Ll/krl0;->e:Ll/gsl0;

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    invoke-virtual {p0, p1}, Ll/gsl0;->a1(Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic s(Ll/krl0;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/krl0;->z(Lcom/p1/mobile/putong/data/MessageLocation;)V

    return-void
.end method

.method public static synthetic t(Ll/krl0;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;Ll/z80;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/krl0;->A(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;Ll/z80;)V

    return-void
.end method

.method public static synthetic w(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic z(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/krl0;->d:Ll/psl0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/psl0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    new-array v1, v1, [Ll/sfj0$a;

    .line 13
    .line 14
    const-string v2, "e_my_roam_location"

    .line 15
    .line 16
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/krl0;->d:Ll/psl0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/psl0;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/krl0;->e:Ll/gsl0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/gsl0;->G0()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "p_settings_location,manyou"

    .line 32
    .line 33
    invoke-static {v2, v0, v1}, Ll/psl0;->n(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p0, p0, Ll/krl0;->d:Ll/psl0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/psl0;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-static {p0, p1, v0}, Ll/gsl0;->C0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MessageLocation;Ll/x20;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public B(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/krl0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/krl0;->e:Ll/gsl0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/gsl0;->b:Ll/fmj;

    .line 4
    .line 5
    iget-object v0, p0, Ll/krl0;->d:Ll/psl0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/psl0;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 12
    .line 13
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 14
    .line 15
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 16
    .line 17
    new-instance v7, Ll/irl0;

    .line 18
    .line 19
    invoke-direct {v7, p0, p1, p2}, Ll/irl0;-><init>(Ll/krl0;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;)V

    .line 20
    .line 21
    .line 22
    new-instance v8, Ll/jrl0;

    .line 23
    .line 24
    invoke-direct {v8}, Ll/jrl0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual/range {v1 .. v8}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/krl0;->y(Landroid/view/View;Lcom/p1/mobile/putong/data/MessageLocation;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/krl0;->d:Ll/psl0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/psl0;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->Df:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/krl0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Landroid/view/View;Lcom/p1/mobile/putong/data/MessageLocation;II)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 3
    .line 4
    iget-object v2, p0, Ll/krl0;->f:Ll/y20;

    .line 5
    .line 6
    iget-object p1, p0, Ll/krl0;->d:Ll/psl0;

    .line 7
    .line 8
    iget-object v3, p1, Ll/psl0;->o:Ll/y20;

    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 11
    .line 12
    iget-object p3, p0, Ll/krl0;->e:Ll/gsl0;

    .line 13
    .line 14
    invoke-virtual {p3}, Ll/gsl0;->I0()Lcom/p1/mobile/putong/data/DoublePair;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p1, p3}, Ll/gsl0;->E0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    move-object v4, p0

    .line 23
    move-object v1, p2

    .line 24
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->e(Lcom/p1/mobile/putong/data/MessageLocation;Ll/y20;Ll/y20;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView$a;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
