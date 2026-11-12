.class public final Lpon;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lb7k;


# direct methods
.method public constructor <init>(Lb7k;)V
    .registers 4

    iget-object v0, p1, Lb7k;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lpon;->b:Lb7k;

    iget-object p1, p1, Lb7k;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/weather/view/WeatherWidgetView;

    new-instance v0, Loon;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Loon;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v0, p1}, Loon;->a(Landroid/view/View;)V

    return-void
.end method
