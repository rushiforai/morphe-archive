.class public Ll/bnl0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bnl0$c;->a:Ll/y20;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bnl0$c;->b:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    sub-int/2addr p8, p6

    .line 2
    sub-int/2addr p9, p7

    .line 3
    sub-int/2addr p4, p2

    .line 4
    sub-int/2addr p5, p3

    .line 5
    if-ne p8, p4, :cond_1

    .line 6
    .line 7
    if-eq p9, p5, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    .line 12
    .line 13
    if-eqz p5, :cond_2

    .line 14
    .line 15
    iget-object p1, p0, Ll/bnl0$c;->a:Ll/y20;

    .line 16
    .line 17
    filled-new-array {p4, p5}, [I

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/bnl0$c;->b:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    return-void
.end method
