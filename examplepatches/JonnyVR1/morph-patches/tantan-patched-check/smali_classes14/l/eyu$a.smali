.class public Ll/eyu$a;
.super Ll/lct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/eyu;->U()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/eyu;


# direct methods
.method public constructor <init>(Ll/eyu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eyu$a;->a:Ll/eyu;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lct;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public l0(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/lct;->l0(I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/eyu$a;->a:Ll/eyu;

    .line 5
    .line 6
    invoke-static {p1}, Ll/eyu;->J(Ll/eyu;)Ll/y20;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/eyu$a;->a:Ll/eyu;

    .line 13
    .line 14
    invoke-static {p1}, Ll/eyu;->J(Ll/eyu;)Ll/y20;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/eyu$a;->a:Ll/eyu;

    .line 19
    .line 20
    invoke-static {v0}, Ll/eyu;->L(Ll/eyu;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Ll/eyu$a;->a:Ll/eyu;

    .line 34
    .line 35
    invoke-static {p0}, Ll/eyu;->K(Ll/eyu;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    or-int/lit8 p1, p1, 0x4

    .line 40
    .line 41
    invoke-static {p0, p1}, Ll/eyu;->O(Ll/eyu;I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public u1()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/lct;->u1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/eyu$a;->a:Ll/eyu;

    .line 5
    .line 6
    invoke-static {v0}, Ll/eyu;->K(Ll/eyu;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    or-int/lit8 v1, v1, 0x2

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/eyu;->O(Ll/eyu;I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/eyu$a;->a:Ll/eyu;

    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    invoke-static {p0, v0, v1}, Ll/eyu;->N(Ll/eyu;J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
