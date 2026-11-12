.class public final synthetic Lefl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

.field public final synthetic b:Landroid/graphics/drawable/Drawable;

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;Landroid/graphics/drawable/Drawable;II)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lefl;->a:Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    iput-object p2, p0, Lefl;->b:Landroid/graphics/drawable/Drawable;

    iput p3, p0, Lefl;->c:I

    iput p4, p0, Lefl;->d:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    sget p1, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->b:I

    iget-object p1, p0, Lefl;->a:Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    iget-object v0, p1, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a:Lq5g;

    iget-object v0, v0, Lq5g;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget v1, p0, Lefl;->c:I

    iget v2, p0, Lefl;->d:I

    invoke-static {v1, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget-object p0, p0, Lefl;->b:Landroid/graphics/drawable/Drawable;

    invoke-static {p0, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
