.class public Lv/smart_refresh/SmartRefreshLayout$m;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/smart_refresh/SmartRefreshLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "m"
.end annotation


# instance fields
.field public a:I

.field public b:Ll/wwf0;


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    const/4 p1, 0x0

    .line 55
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout$m;->a:I

    const/4 p1, 0x0

    .line 56
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$m;->b:Ll/wwf0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$m;->a:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$m;->b:Ll/wwf0;

    .line 9
    .line 10
    sget-object v0, Ll/hhc0;->V1:[I

    .line 11
    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget p2, Ll/hhc0;->W1:I

    .line 17
    .line 18
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout$m;->a:I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Lv/smart_refresh/SmartRefreshLayout$m;->a:I

    .line 25
    .line 26
    sget p2, Ll/hhc0;->X1:I

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    sget-object p2, Ll/wwf0;->i:[Ll/wwf0;

    .line 35
    .line 36
    sget v0, Ll/hhc0;->X1:I

    .line 37
    .line 38
    sget-object v1, Ll/wwf0;->d:Ll/wwf0;

    .line 39
    .line 40
    iget v1, v1, Ll/wwf0;->a:I

    .line 41
    .line 42
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    aget-object p2, p2, v0

    .line 47
    .line 48
    iput-object p2, p0, Lv/smart_refresh/SmartRefreshLayout$m;->b:Ll/wwf0;

    .line 49
    .line 50
    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
