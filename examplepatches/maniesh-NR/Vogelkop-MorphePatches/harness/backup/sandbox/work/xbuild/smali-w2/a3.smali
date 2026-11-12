.class public final La3;
.super Le1g;
.source "SourceFile"


# instance fields
.field public final e:Landroid/content/Context;

.field public final f:Ll08;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0xbb8

    invoke-direct {p0, v0}, Le1g;-><init>(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, La3;->e:Landroid/content/Context;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, La3;->f:Ll08;

    return-void
.end method


# virtual methods
.method public final b(Lhx4;)Lix4;
    .registers 3

    iget-object v0, p0, La3;->e:Landroid/content/Context;

    invoke-static {v0}, Lhom;->t(Landroid/content/Context;)Lhom;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfom;

    iget-object v0, v0, Lfom;->b:Ljava/lang/String;

    if-nez v0, :cond_14

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_14
    invoke-super {p0, p1}, Le1g;->b(Lhx4;)Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, La3;->f:Ll08;

    return-object p0
.end method
