.class public final Log7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final a:Landroid/widget/TextView;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Log7;->a:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-boolean p0, p0, Log7;->b:Z

    if-eqz p0, :cond_f

    invoke-static {v0}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_13

    :cond_f
    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_13
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method
