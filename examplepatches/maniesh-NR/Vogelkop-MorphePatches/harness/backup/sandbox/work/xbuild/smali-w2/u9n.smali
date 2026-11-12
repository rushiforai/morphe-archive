.class public final Lu9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public a:I

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu9n;->b:Landroid/view/View;

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p1}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object p1

    if-eqz p1, :cond_1a

    const/16 v0, 0x8

    iget-object p1, p1, Lg3o;->a:Ld3o;

    invoke-virtual {p1, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    if-eqz p1, :cond_1a

    iget p1, p1, Lr9b;->d:I

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    :goto_1b
    iput p1, p0, Lu9n;->a:I

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    iget-object p1, p0, Lu9n;->b:Landroid/view/View;

    invoke-static {p1}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object p2

    if-eqz p2, :cond_17

    const/16 p3, 0x8

    iget-object p2, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p2, p3}, Ld3o;->i(I)Lr9b;

    move-result-object p2

    if-eqz p2, :cond_17

    iget p2, p2, Lr9b;->d:I

    goto :goto_18

    :cond_17
    const/4 p2, 0x0

    :goto_18
    iget p3, p0, Lu9n;->a:I

    if-eq p3, p2, :cond_21

    iput p2, p0, Lu9n;->a:I

    invoke-virtual {p1}, Landroid/view/View;->requestApplyInsets()V

    :cond_21
    return-void
.end method
