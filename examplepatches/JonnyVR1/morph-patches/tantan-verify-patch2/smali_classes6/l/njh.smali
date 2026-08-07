.class public Ll/njh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x1m;


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:I

.field public d:Landroid/widget/TextView;

.field public e:I


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationBar;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/njh;->a:Lv/navigationbar/VNavigationBar;

    .line 5
    .line 6
    iput-object p2, p0, Ll/njh;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ll/njh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/njh;->g(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/njh;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Ll/njh;->d(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/njh;->c:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/njh;->d(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/njh;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public d(II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/njh;->f()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/njh;->d:Landroid/widget/TextView;

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/njh;->f()V

    .line 18
    .line 19
    .line 20
    if-ne p2, v0, :cond_1

    .line 21
    .line 22
    iget p2, p0, Ll/njh;->e:I

    .line 23
    .line 24
    :cond_1
    if-ne p1, v0, :cond_2

    .line 25
    .line 26
    iget p1, p0, Ll/njh;->c:I

    .line 27
    .line 28
    :cond_2
    const/4 v0, 0x1

    .line 29
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-ge p1, p2, :cond_3

    .line 38
    .line 39
    move p2, p1

    .line 40
    :cond_3
    iget-object v0, p0, Ll/njh;->d:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v2, "%d/%d"

    .line 55
    .line 56
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iput p1, p0, Ll/njh;->c:I

    .line 64
    .line 65
    iput p2, p0, Ll/njh;->e:I

    .line 66
    .line 67
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/njh;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Landroid/widget/TextView;

    .line 7
    .line 8
    iget-object v1, p0, Ll/njh;->b:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/njh;->d:Landroid/widget/TextView;

    .line 14
    .line 15
    const/high16 v1, 0x41700000    # 15.0f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/njh;->d:Landroid/widget/TextView;

    .line 21
    .line 22
    const-string v1, "#80000000"

    .line 23
    .line 24
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/njh;->d:Landroid/widget/TextView;

    .line 32
    .line 33
    const/high16 v1, 0x41000000    # 8.0f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {v0, v2, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/njh;->a:Lv/navigationbar/VNavigationBar;

    .line 44
    .line 45
    iget-object p0, p0, Ll/njh;->d:Landroid/widget/TextView;

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    new-array v1, v1, [Landroid/view/View;

    .line 49
    .line 50
    aput-object p0, v1, v2

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/njh;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/njh;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    new-instance v1, Ll/mjh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mjh;-><init>(Ll/njh;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/njh;->a:Lv/navigationbar/VNavigationBar;

    .line 12
    .line 13
    sget v1, Ll/lbc0;->j:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/njh;->a:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    const-string v0, "\u5bf9\u4f60\u611f\u5174\u8da3\u7684\u4eba"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
