.class public Ll/qte$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qte;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/widget/TextView;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:Z

.field public final f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;IZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qte$a;->a:Landroid/widget/TextView;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qte$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qte$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Ll/qte$a;->d:I

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/qte$a;->e:Z

    .line 13
    .line 14
    iput-boolean p6, p0, Ll/qte$a;->f:Z

    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    iput-boolean p2, p0, Ll/qte$a;->g:Z

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/qte$a;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/qte$a;->a:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v1, p0, Ll/qte$a;->b:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p0, Ll/qte$a;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget-boolean v3, p0, Ll/qte$a;->f:Z

    .line 17
    .line 18
    invoke-static {v0, v1, v2, v3}, Ll/qte;->a(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    iget-boolean v0, p0, Ll/qte$a;->g:Z

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    return v1

    .line 27
    :cond_0
    iget-boolean v0, p0, Ll/qte$a;->e:Z

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Ll/qte$a;->a:Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/widget/TextView;->getEllipsize()Landroid/text/TextUtils$TruncateAt;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    .line 38
    .line 39
    if-ne v0, v2, :cond_1

    .line 40
    .line 41
    move v6, v1

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    const/4 v0, 0x0

    .line 44
    :goto_0
    move v6, v0

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const/4 v0, 0x2

    .line 47
    goto :goto_0

    .line 48
    :goto_1
    iget-object v0, p0, Ll/qte$a;->a:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget-object v3, p0, Ll/qte$a;->c:Ljava/lang/String;

    .line 59
    .line 60
    iget v4, p0, Ll/qte$a;->d:I

    .line 61
    .line 62
    const/4 v5, 0x0

    .line 63
    iget-boolean v7, p0, Ll/qte$a;->f:Z

    .line 64
    .line 65
    invoke-static/range {v2 .. v7}, Ll/qte;->f(Ljava/lang/String;Ljava/lang/String;IIIZ)Landroid/text/SpannableString;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object p0, p0, Ll/qte$a;->a:Landroid/widget/TextView;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    return v1
.end method
