.class public Ll/x8i$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/x8i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x8i;


# direct methods
.method public constructor <init>(Ll/x8i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 11
    .line 12
    iget-object v0, v0, Ll/x8i;->h:Lv/VRelative;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 21
    .line 22
    invoke-static {v0}, Ll/x8i;->l(Ll/x8i;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 27
    .line 28
    iget-object v1, v1, Ll/x8i;->h:Lv/VRelative;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v0, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v1}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iget-object v2, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 48
    .line 49
    iget-object v2, v2, Ll/x8i;->h:Lv/VRelative;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    add-int/2addr v1, v2

    .line 56
    iput v1, v0, Ll/x8i;->D:I

    .line 57
    .line 58
    iget-object v0, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 59
    .line 60
    iget-object v1, v0, Ll/x8i;->h:Lv/VRelative;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-static {v0, v1}, Ll/x8i;->m(Ll/x8i;I)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/x8i$a;->a:Ll/x8i;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/x8i;->Z()V

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_0
    return-void
.end method
