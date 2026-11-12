.class public Lp2c;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "SourceFile"

# interfaces
.implements Lm2c;


# instance fields
.field public final a:Ln2c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Ln2c;

    invoke-direct {v0, p1, p2}, Ln2c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lp2c;->a:Ln2c;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lk2c;)V
    .registers 3

    iget-object p0, p0, Lp2c;->a:Ln2c;

    invoke-virtual {p0, p1, p2}, Ln2c;->a(Landroid/view/View;Lk2c;)V

    return-void
.end method
