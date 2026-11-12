.class public final Lry0;
.super Lsy0;
.source "SourceFile"


# instance fields
.field public final g:Lkf;


# direct methods
.method public constructor <init>(Lkf;Ltzi;)V
    .registers 4

    iget-object v0, p1, Lkf;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-direct {p0, v0, p2}, Lyzi;-><init>(Landroid/view/View;Ltzi;)V

    iput-object p1, p0, Lry0;->g:Lkf;

    return-void
.end method


# virtual methods
.method public final j0(Lfy0;)V
    .registers 2

    check-cast p1, Lhy0;

    invoke-virtual {p0}, Lyzi;->U()V

    iput-object p1, p0, Lsy0;->f:Lfy0;

    iget-object p0, p0, Lry0;->g:Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, p1, Lhy0;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
