.class public Ll/leq0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/leq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Landroid/view/View;

.field public c:Lv/VText_NoTopPadding;

.field public d:Landroid/view/View;

.field public e:Lv/VText_NoTopPadding;

.field public f:Lv/VText_NoTopPadding;

.field public g:Lv/AutoVDraweeView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->Df:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/AutoVDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/leq0$a;->a:Lv/AutoVDraweeView;

    .line 13
    .line 14
    sget v0, Ll/adc0;->Lf:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/leq0$a;->b:Landroid/view/View;

    .line 21
    .line 22
    sget v0, Ll/adc0;->Kf:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VText_NoTopPadding;

    .line 29
    .line 30
    iput-object v0, p0, Ll/leq0$a;->c:Lv/VText_NoTopPadding;

    .line 31
    .line 32
    sget v0, Ll/adc0;->Jf:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/leq0$a;->d:Landroid/view/View;

    .line 39
    .line 40
    sget v0, Ll/adc0;->Of:I

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lv/VText_NoTopPadding;

    .line 47
    .line 48
    iput-object v0, p0, Ll/leq0$a;->e:Lv/VText_NoTopPadding;

    .line 49
    .line 50
    sget v0, Ll/adc0;->Pf:I

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lv/VText_NoTopPadding;

    .line 57
    .line 58
    iput-object v0, p0, Ll/leq0$a;->f:Lv/VText_NoTopPadding;

    .line 59
    .line 60
    sget v0, Ll/adc0;->Gf:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lv/AutoVDraweeView;

    .line 67
    .line 68
    iput-object p1, p0, Ll/leq0$a;->g:Lv/AutoVDraweeView;

    .line 69
    .line 70
    return-void
.end method
