.class public final Ll/e1z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jzy0;


# instance fields
.field public final a:Ll/kdx0;

.field public b:I

.field public final c:Ll/d1z0;

.field public final d:Ll/s6z0;

.field public final e:Ll/uty0;


# direct methods
.method public constructor <init>(Ll/kdx0;Ll/d1z0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/uty0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uty0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/s6z0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/s6z0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/e1z0;->a:Ll/kdx0;

    .line 15
    .line 16
    iput-object p2, p0, Ll/e1z0;->c:Ll/d1z0;

    .line 17
    .line 18
    iput-object v0, p0, Ll/e1z0;->e:Ll/uty0;

    .line 19
    .line 20
    iput-object v1, p0, Ll/e1z0;->d:Ll/s6z0;

    .line 21
    .line 22
    const/high16 p1, 0x100000

    .line 23
    .line 24
    iput p1, p0, Ll/e1z0;->b:I

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final a(I)Ll/e1z0;
    .locals 0

    .line 1
    iput p1, p0, Ll/e1z0;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ll/trs0;)Ll/g1z0;
    .locals 9

    .line 1
    iget-object v0, p1, Ll/trs0;->b:Ll/zis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v3, p0, Ll/e1z0;->a:Ll/kdx0;

    .line 7
    .line 8
    iget-object v4, p0, Ll/e1z0;->c:Ll/d1z0;

    .line 9
    .line 10
    iget-object v6, p0, Ll/e1z0;->d:Ll/s6z0;

    .line 11
    .line 12
    new-instance v1, Ll/g1z0;

    .line 13
    .line 14
    sget-object v5, Ll/huy0;->a:Ll/huy0;

    .line 15
    .line 16
    iget v7, p0, Ll/e1z0;->b:I

    .line 17
    .line 18
    const/4 v8, 0x0

    .line 19
    move-object v2, p1

    .line 20
    invoke-direct/range {v1 .. v8}, Ll/g1z0;-><init>(Ll/trs0;Ll/kdx0;Ll/d1z0;Ll/huy0;Ll/s6z0;ILl/f1z0;)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method
