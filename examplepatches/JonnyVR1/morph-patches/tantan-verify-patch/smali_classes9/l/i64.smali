.class public Ll/i64;
.super Ll/pf2;
.source "SourceFile"


# instance fields
.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pf2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i64;->c:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public i()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i64;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()V
    .locals 0

    .line 1
    return-void
.end method

.method public r(Landroid/view/ViewGroup;Ll/si3;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->CALL_BULLET:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 2
    .line 3
    invoke-virtual {p2, v0, p1}, Ll/si3;->a(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/obc0;->z7:I

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    sget p1, Ll/mdc0;->c6:I

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lv/VDraweeView;

    .line 22
    .line 23
    sget v0, Ll/obc0;->b6:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    sget p1, Ll/mdc0;->D0:I

    .line 29
    .line 30
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Landroid/widget/TextView;

    .line 35
    .line 36
    iget-object v0, p0, Ll/i64;->c:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p2}, Ll/pf2;->d(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;)V

    .line 42
    .line 43
    .line 44
    const-string p1, "client_liveCall"

    .line 45
    .line 46
    invoke-static {p1}, Ll/ni3;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object p0, p0, Ll/pf2;->b:Ll/ki3;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    const-string v4, ""

    .line 61
    .line 62
    const-string v5, ""

    .line 63
    .line 64
    const-string v0, "client_liveCall"

    .line 65
    .line 66
    invoke-static/range {v0 .. v5}, Ll/ni3;->d(Ljava/lang/String;Ljava/lang/String;Ll/oo2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
