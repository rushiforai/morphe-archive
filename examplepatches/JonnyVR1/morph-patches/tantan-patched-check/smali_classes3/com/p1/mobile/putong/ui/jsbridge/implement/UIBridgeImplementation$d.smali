.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->u(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Lv/navigationbar/VNavigationBar;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->f:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->a:Ll/bqq;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->b:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Ll/bqq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/bqq;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;Ll/bqq;Landroid/graphics/Bitmap;Lv/navigationbar/VNavigationBar;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->d(Ll/bqq;Landroid/graphics/Bitmap;Lv/navigationbar/VNavigationBar;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->e(Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method


# virtual methods
.method public final synthetic d(Ll/bqq;Landroid/graphics/Bitmap;Lv/navigationbar/VNavigationBar;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/bqq;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    sget v0, Ll/qa00;->E:I

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {p2, v0, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 40
    .line 41
    invoke-direct {v0, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 42
    .line 43
    .line 44
    new-instance p2, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$b;

    .line 45
    .line 46
    invoke-direct {p2, p0, p1, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$b;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;Ll/bqq;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p3, v0, p2}, Lv/navigationbar/VNavigationBar;->v(Landroid/graphics/drawable/Drawable;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic e(Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 6

    .line 1
    new-instance v0, Ll/fpj0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v4, p2

    .line 6
    move-object v5, p3

    .line 7
    move-object v3, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/fpj0;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;Ll/bqq;Landroid/graphics/Bitmap;Lv/navigationbar/VNavigationBar;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->a:Ll/bqq;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bqq;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->b:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->b:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->B()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->c:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->a:Ll/bqq;

    .line 30
    .line 31
    invoke-interface {v0}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v2, Ll/jec0;->A:I

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/TextView;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->c:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    const/high16 v2, -0x1000000

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->a:Ll/bqq;

    .line 59
    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->d:Ljava/lang/String;

    .line 61
    .line 62
    new-instance v4, Ll/dpj0;

    .line 63
    .line 64
    invoke-direct {v4, v2, v3}, Ll/dpj0;-><init>(Ll/bqq;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    new-instance v2, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$a;

    .line 71
    .line 72
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$a;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->b:Lv/navigationbar/VNavigationBar;

    .line 79
    .line 80
    const/4 v3, 0x1

    .line 81
    new-array v3, v3, [Landroid/view/View;

    .line 82
    .line 83
    aput-object v0, v3, v1

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->e:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_2

    .line 95
    .line 96
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->e:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->a:Ll/bqq;

    .line 105
    .line 106
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->b:Lv/navigationbar/VNavigationBar;

    .line 107
    .line 108
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->d:Ljava/lang/String;

    .line 109
    .line 110
    new-instance v4, Ll/epj0;

    .line 111
    .line 112
    invoke-direct {v4, p0, v1, v2, v3}, Ll/epj0;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    :cond_2
    :goto_0
    return-void
.end method
