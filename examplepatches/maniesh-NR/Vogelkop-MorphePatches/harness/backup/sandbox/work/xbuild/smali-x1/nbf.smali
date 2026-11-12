.class public final synthetic Lnbf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic a:Lvbf;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lvbf;III)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnbf;->a:Lvbf;

    iput p2, p0, Lnbf;->b:I

    iput p3, p0, Lnbf;->c:I

    iput p4, p0, Lnbf;->d:I

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    iget-object p1, p0, Lnbf;->a:Lvbf;

    iget-object p3, p1, Lvbf;->t:Ltbf;

    sub-int/2addr p8, p6

    sub-int/2addr p4, p2

    if-eq p8, p4, :cond_21

    invoke-virtual {p1}, Lvbf;->q()V

    iget p1, p0, Lnbf;->b:I

    sub-int/2addr p4, p1

    iget p1, p0, Lnbf;->c:I

    if-ge p4, p1, :cond_16

    const/4 p0, 0x1

    iput p0, p3, Ltbf;->c:I

    return-void

    :cond_16
    iget p0, p0, Lnbf;->d:I

    if-ge p4, p0, :cond_1e

    const/4 p0, 0x2

    iput p0, p3, Ltbf;->c:I

    return-void

    :cond_1e
    const/4 p0, 0x3

    iput p0, p3, Ltbf;->c:I

    :cond_21
    return-void
.end method
