.class public final Lcq2;
.super Lhq2;
.source "SourceFile"


# instance fields
.field public final synthetic b:Liq2;


# direct methods
.method public constructor <init>(Liq2;Landroid/view/View;)V
    .registers 3

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcq2;->b:Liq2;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-void
.end method
