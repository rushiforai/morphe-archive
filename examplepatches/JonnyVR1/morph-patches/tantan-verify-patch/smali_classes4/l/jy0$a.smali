.class public Ll/jy0$a;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jy0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public final synthetic b:Ll/jy0;


# direct methods
.method public constructor <init>(Ll/jy0;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jy0$a;->b:Ll/jy0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/adc0;->N5:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lv/VDraweeView;

    .line 13
    .line 14
    iput-object p1, p0, Ll/jy0$a;->a:Lv/VDraweeView;

    .line 15
    .line 16
    return-void
.end method
