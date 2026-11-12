.class public final Lkho;
.super Landroid/widget/ImageView;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lkko;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lkko;)V
    .registers 3

    iput-object p2, p0, Lkho;->a:Lkko;

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lkho;->a:Lkko;

    iput-object p1, p0, Lkko;->b:Landroid/view/View$OnClickListener;

    return-void
.end method
