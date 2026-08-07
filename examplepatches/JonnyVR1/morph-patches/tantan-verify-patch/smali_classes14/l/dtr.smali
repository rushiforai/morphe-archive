.class public Ll/dtr;
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
.field public final a:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/dtr;->a:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Ll/dtr;->a:Z

    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/y6u;->v(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
