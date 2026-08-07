.class public Ll/tzs$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kul;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tzs;->k()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tzs;


# direct methods
.method public constructor <init>(Ll/tzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tzs$c;->a:Ll/tzs;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(FF)V
    .locals 6

    .line 1
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ifv;

    .line 8
    .line 9
    iget-object v0, p0, Ll/ifv;->s:Ll/fyd0;

    .line 10
    .line 11
    float-to-double v1, p1

    .line 12
    float-to-double v3, p2

    .line 13
    const-string v5, ""

    .line 14
    .line 15
    invoke-virtual/range {v0 .. v5}, Ll/fyd0;->g(DDLjava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public clear()V
    .locals 0

    .line 1
    return-void
.end method

.method public getX()F
    .locals 2

    .line 1
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ifv;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ifv;->s:Ll/fyd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fyd0;->d()D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    double-to-float p0, v0

    .line 16
    return p0
.end method

.method public getY()F
    .locals 2

    .line 1
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ifv;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ifv;->s:Ll/fyd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fyd0;->e()D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    double-to-float p0, v0

    .line 16
    return p0
.end method

.method public hasConfig()Z
    .locals 0

    .line 1
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ifv;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ifv;->s:Ll/fyd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fyd0;->f()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
