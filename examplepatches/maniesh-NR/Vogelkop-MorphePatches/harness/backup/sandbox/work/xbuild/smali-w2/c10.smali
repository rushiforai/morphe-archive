.class public Lc10;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Landroid/view/View;

.field public final c:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lc10;->a:Ljava/lang/String;

    iput-object p1, p0, Lc10;->b:Landroid/view/View;

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    const p2, 0x7f0a00b9

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lc10;->c:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public a(ZZZ)V
    .registers 4

    iget-object p0, p0, Lc10;->c:Landroid/widget/TextView;

    move-object p1, p0

    check-cast p1, Landroid/widget/Checkable;

    invoke-interface {p1, p2}, Landroid/widget/Checkable;->setChecked(Z)V

    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setEnabled(Z)V

    invoke-virtual {p0, p3}, Landroid/view/View;->setClickable(Z)V

    return-void
.end method
