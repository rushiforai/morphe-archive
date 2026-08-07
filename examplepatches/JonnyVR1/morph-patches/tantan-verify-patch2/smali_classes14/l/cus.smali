.class public Ll/cus;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field private final listener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cus;->listener:Landroid/view/View$OnClickListener;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->c2:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/ldc0;->o1:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p0, p0, Ll/cus;->listener:Landroid/view/View$OnClickListener;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
