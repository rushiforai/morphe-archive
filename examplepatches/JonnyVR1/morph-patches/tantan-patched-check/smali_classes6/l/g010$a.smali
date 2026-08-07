.class public Ll/g010$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VScroll$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g010;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/g010;


# direct methods
.method public constructor <init>(Ll/g010;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g010$a;->a:Ll/g010;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lv/VScroll;IIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/g010$a;->a:Ll/g010;

    .line 2
    .line 3
    iget-object p2, p1, Ll/g010;->d:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    iget-object p1, p1, Ll/g010;->c:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/g010$a;->a:Ll/g010;

    .line 12
    .line 13
    iget-object p0, p0, Ll/g010;->b:Lv/VScroll;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr p1, p0

    .line 20
    const/high16 p0, 0x40800000    # 4.0f

    .line 21
    .line 22
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sub-int/2addr p1, p0

    .line 27
    if-ge p3, p1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
