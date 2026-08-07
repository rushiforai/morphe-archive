.class public final Ll/yor0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ser0;


# instance fields
.field public final a:Ll/ser0;

.field public final b:Ll/vor0;

.field public final c:Landroid/util/SparseArray;


# direct methods
.method public constructor <init>(Ll/ser0;Ll/vor0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yor0;->a:Ll/ser0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yor0;->b:Ll/vor0;

    .line 7
    .line 8
    new-instance p1, Landroid/util/SparseArray;

    .line 9
    .line 10
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/yor0;->c:Landroid/util/SparseArray;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yor0;->a:Ll/ser0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ser0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i(II)Ll/sgr0;
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    if-eq p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Ll/yor0;->a:Ll/ser0;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Ll/ser0;->i(II)Ll/sgr0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p2, p0, Ll/yor0;->c:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Ll/apr0;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    return-object p2

    .line 22
    :cond_1
    iget-object p2, p0, Ll/yor0;->a:Ll/ser0;

    .line 23
    .line 24
    new-instance v1, Ll/apr0;

    .line 25
    .line 26
    invoke-interface {p2, p1, v0}, Ll/ser0;->i(II)Ll/sgr0;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object v0, p0, Ll/yor0;->b:Ll/vor0;

    .line 31
    .line 32
    invoke-direct {v1, p2, v0}, Ll/apr0;-><init>(Ll/sgr0;Ll/vor0;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/yor0;->c:Landroid/util/SparseArray;

    .line 36
    .line 37
    invoke-virtual {p0, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-object v1
.end method

.method public final j(Ll/bgr0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yor0;->a:Ll/ser0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/ser0;->j(Ll/bgr0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
