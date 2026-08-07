.class public Lcom/p1/mobile/putong/core/newui/home/b$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "n"
.end annotation


# static fields
.field public static c:I


# instance fields
.field public a:I

.field public b:Lv/VLinear$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/gkc0;->a(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sput v0, Lcom/p1/mobile/putong/core/newui/home/b$n;->c:I

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$n;->a:I

    .line 6
    .line 7
    new-instance v0, Lv/VLinear$a;

    .line 8
    .line 9
    invoke-direct {v0}, Lv/VLinear$a;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$n;->b:Lv/VLinear$a;

    .line 13
    .line 14
    invoke-virtual {v0}, Lv/VLinear$a;->c()V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$n;->a:I

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/core/newui/home/b$n;->c:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-gt p1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$n;->a:I

    .line 15
    .line 16
    add-int/2addr p1, v1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$n;->a:I

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/core/newui/home/b$n;->c:I

    .line 20
    .line 21
    if-le p1, v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$n;->b:Lv/VLinear$a;

    .line 24
    .line 25
    invoke-virtual {p1}, Lv/VLinear$a;->b()Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v0, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    sput-boolean v0, Lcom/p1/mobile/putong/core/api/y;->Q:Z

    .line 38
    .line 39
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p1, Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    sput-boolean p1, Lcom/p1/mobile/putong/core/api/y;->R:Z

    .line 48
    .line 49
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$n;->b:Lv/VLinear$a;

    .line 50
    .line 51
    invoke-virtual {p0, p2}, Lv/VLinear$a;->a(Landroid/view/MotionEvent;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    const/4 p1, 0x0

    .line 59
    if-nez p0, :cond_2

    .line 60
    .line 61
    invoke-static {v1}, Ll/u7l;->c(Z)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eq p0, v1, :cond_3

    .line 70
    .line 71
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    const/4 p2, 0x3

    .line 76
    if-ne p0, p2, :cond_4

    .line 77
    .line 78
    :cond_3
    invoke-static {p1}, Ll/u7l;->c(Z)V

    .line 79
    .line 80
    .line 81
    :cond_4
    :goto_0
    return p1
.end method
