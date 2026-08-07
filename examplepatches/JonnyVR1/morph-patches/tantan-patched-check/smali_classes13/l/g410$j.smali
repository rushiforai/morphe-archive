.class Ll/g410$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o410$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;-><init>(Ll/uow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g410$j;->a:Ll/g410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public P0(Ll/g510;IIII)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/g410$j;->a:Ll/g410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/g410;->g(Ll/g410;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/g410$j;->a:Ll/g410;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/g410;->h(Ll/g410;I)I

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/g410$j;->a:Ll/g410;

    .line 18
    .line 19
    invoke-static {v0}, Ll/g410;->k(Ll/g410;)I

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/g410$j;->a:Ll/g410;

    .line 23
    .line 24
    invoke-static {v0}, Ll/g410;->l(Ll/g410;)Ll/o410$f;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/g410$j;->a:Ll/g410;

    .line 31
    .line 32
    invoke-static {p0}, Ll/g410;->l(Ll/g410;)Ll/o410$f;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    move-object v1, p1

    .line 37
    move v2, p2

    .line 38
    move v3, p3

    .line 39
    move v4, p4

    .line 40
    move v5, p5

    .line 41
    invoke-interface/range {v0 .. v5}, Ll/o410$f;->P0(Ll/g510;IIII)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method
