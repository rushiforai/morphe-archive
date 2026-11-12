.class public final Lfag;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# static fields
.field public static final synthetic c:I


# instance fields
.field public final b:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a051f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lfag;->b:Landroid/widget/TextView;

    return-void
.end method
