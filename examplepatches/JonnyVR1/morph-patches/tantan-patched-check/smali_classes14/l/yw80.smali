.class public abstract Ll/yw80;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/d3q<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ll/kv80;


# direct methods
.method public constructor <init>(ILl/kv80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/yw80;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/yw80;->b:Ll/kv80;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H()Ll/kv80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yw80;->b:Ll/kv80;

    .line 2
    .line 3
    return-object p0
.end method

.method public I()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yw80;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public J(Ll/vx80;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vx80;",
            "TV;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public K(Ll/vx80;)V
    .locals 0

    .line 1
    return-void
.end method

.method public L(Ll/vx80;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vx80;",
            "TV;)V"
        }
    .end annotation

    .line 1
    return-void
.end method
