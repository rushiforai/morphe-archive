.class public Ll/qvw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qvw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Ll/l0m;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ljava/lang/String;

.field public d:Ll/qow;

.field public final synthetic e:Ll/qvw;


# direct methods
.method public constructor <init>(Ll/qvw;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/l0m;Ll/qow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/qvw$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qvw$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/qvw$a;->a:Ll/l0m;

    .line 11
    .line 12
    iput-object p5, p0, Ll/qvw$a;->d:Ll/qow;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/qvw$a;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qvw$a;->h(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ll/qvw$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qvw$a;->j()V

    return-void
.end method

.method public static synthetic d(Ll/qvw$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qvw$a;->i()V

    return-void
.end method

.method public static synthetic e(Ll/qvw$a;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qvw$a;->g(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic g(Ljava/lang/Long;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qvw;->h:Landroid/widget/TextView;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/qvw$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Wm:I

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, " "

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    const-wide/16 v4, 0x4

    .line 35
    .line 36
    sub-long v2, v4, v2

    .line 37
    .line 38
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    sub-long/2addr v4, v1

    .line 50
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    filled-new-array {p1}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v1, "#d74d37"

    .line 63
    .line 64
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 69
    .line 70
    invoke-static {p0, p1, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic h(Ljava/lang/Long;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qvw;->b:Landroid/widget/TextView;

    .line 4
    .line 5
    const-string v1, "#000000"

    .line 6
    .line 7
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 15
    .line 16
    iget-object v0, v0, Ll/qvw;->c:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 26
    .line 27
    iget-object v0, v0, Ll/qvw;->d:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 37
    .line 38
    iget-object v0, v0, Ll/qvw;->e:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    const-string v0, "#d74d37"

    .line 52
    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    if-eq p1, v1, :cond_1

    .line 57
    .line 58
    const/4 v1, 0x2

    .line 59
    if-eq p1, v1, :cond_0

    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    iget-object p0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 63
    .line 64
    iget-object p0, p0, Ll/qvw;->e:Landroid/widget/TextView;

    .line 65
    .line 66
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    iget-object p0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 75
    .line 76
    iget-object p0, p0, Ll/qvw;->d:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    iget-object p0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 87
    .line 88
    iget-object p0, p0, Ll/qvw;->c:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final synthetic i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qvw;->e:Landroid/widget/TextView;

    .line 4
    .line 5
    const-string v1, "#000000"

    .line 6
    .line 7
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 15
    .line 16
    iget-object v0, v0, Ll/qvw;->k:Ll/qvw$a;

    .line 17
    .line 18
    iget-object v0, v0, Ll/qvw$a;->a:Ll/l0m;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/l0m;->s()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/qvw$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    sget v1, Lcom/p1/mobile/putong/core/R$string;->vt:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 35
    .line 36
    iget-object v0, v0, Ll/qvw;->k:Ll/qvw$a;

    .line 37
    .line 38
    iget-object v0, v0, Ll/qvw$a;->a:Ll/l0m;

    .line 39
    .line 40
    new-instance v1, Ll/qvw$a$a;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/qvw$a$a;-><init>(Ll/qvw$a;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0, v1}, Ll/l0m;->P(Ll/lpw;)Z

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic j()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qvw;->h:Landroid/widget/TextView;

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Xm:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 11
    .line 12
    iget-object v0, v0, Ll/qvw;->k:Ll/qvw$a;

    .line 13
    .line 14
    iget-object v0, v0, Ll/qvw$a;->a:Ll/l0m;

    .line 15
    .line 16
    iget-object v1, p0, Ll/qvw$a;->c:Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ll/l0m;->H(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 22
    .line 23
    iget-object v0, v0, Ll/qvw;->k:Ll/qvw$a;

    .line 24
    .line 25
    iget-object v0, v0, Ll/qvw$a;->a:Ll/l0m;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/l0m;->i()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/qvw$a;->e:Ll/qvw;

    .line 31
    .line 32
    iget-object v0, v0, Ll/qvw;->b:Landroid/widget/TextView;

    .line 33
    .line 34
    const-string v1, "#d74d37"

    .line 35
    .line 36
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/qvw$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    const-string v1, "ManuelPicVerificationRECORDING"

    .line 46
    .line 47
    const/4 v2, 0x4

    .line 48
    invoke-static {v1, v2}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/nvw;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/nvw;-><init>(Ll/qvw$a;)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Ll/ovw;

    .line 62
    .line 63
    invoke-direct {v2}, Ll/ovw;-><init>()V

    .line 64
    .line 65
    .line 66
    new-instance v3, Ll/pvw;

    .line 67
    .line 68
    invoke-direct {v3, p0}, Ll/pvw;-><init>(Ll/qvw$a;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, v2, v3}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/qvw$a;->a:Ll/l0m;

    .line 2
    .line 3
    const/16 p3, 0x2d0

    .line 4
    .line 5
    const/16 p4, 0x500

    .line 6
    .line 7
    invoke-interface {p2, p3, p4}, Ll/n0m;->n(II)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Ll/qvw$a;->a:Ll/l0m;

    .line 11
    .line 12
    iget-object p3, p0, Ll/qvw$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iget-object p4, p0, Ll/qvw$a;->d:Ll/qow;

    .line 15
    .line 16
    invoke-interface {p2, p3, p4}, Ll/l0m;->I(Landroid/app/Activity;Ll/qow;)Z

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Ll/qvw$a;->a:Ll/l0m;

    .line 20
    .line 21
    invoke-interface {p2, p1}, Ll/n0m;->w(Landroid/view/SurfaceHolder;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/qvw$a;->a:Ll/l0m;

    .line 25
    .line 26
    invoke-interface {p1}, Ll/n0m;->g()V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/qvw$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    const-string p2, "ManuelPicVerificationPreview"

    .line 32
    .line 33
    const/4 p3, 0x5

    .line 34
    invoke-static {p2, p3}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Ll/kvw;

    .line 43
    .line 44
    invoke-direct {p2, p0}, Ll/kvw;-><init>(Ll/qvw$a;)V

    .line 45
    .line 46
    .line 47
    new-instance p3, Ll/lvw;

    .line 48
    .line 49
    invoke-direct {p3}, Ll/lvw;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance p4, Ll/mvw;

    .line 53
    .line 54
    invoke-direct {p4, p0}, Ll/mvw;-><init>(Ll/qvw$a;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p2, p3, p4}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/qvw$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    return-void
.end method
