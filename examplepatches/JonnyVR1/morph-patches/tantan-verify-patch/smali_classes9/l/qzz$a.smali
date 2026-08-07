.class public Ll/qzz$a;
.super Ll/pn50;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qzz;->G0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Ll/qzz;


# direct methods
.method public constructor <init>(Ll/qzz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qzz$a;->b:Ll/qzz;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/pn50;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/pn50;->a(I)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/qzz$a;->b:Ll/qzz;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/qzz;->K1()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/qzz$a;->b:Ll/qzz;

    .line 12
    .line 13
    invoke-static {p1}, Ll/qzz;->X(Ll/qzz;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/qzz$a;->b:Ll/qzz;

    .line 17
    .line 18
    iget-object p0, p0, Ll/qzz;->t1:Ll/rdz;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/rdz;->e()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public b(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/pn50;->b(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
