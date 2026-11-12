.class public final Lfdn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lpt0;

.field public final e:Z

.field public final f:Lfdn;

.field public final g:Ljava/util/ArrayList;

.field public final h:I

.field public final i:I

.field public final j:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpt0;ZIILfdn;Z)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfdn;->a:Ljava/lang/String;

    iput-object p2, p0, Lfdn;->b:Ljava/lang/String;

    iput-object p3, p0, Lfdn;->c:Ljava/lang/String;

    iput-object p4, p0, Lfdn;->d:Lpt0;

    iput-boolean p5, p0, Lfdn;->e:Z

    iput-object p8, p0, Lfdn;->f:Lfdn;

    iput p6, p0, Lfdn;->h:I

    iput p7, p0, Lfdn;->i:I

    iput-boolean p9, p0, Lfdn;->j:Z

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lfdn;->g:Ljava/util/ArrayList;

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILpt0;)Lfdn;
    .registers 15

    new-instance v0, Lfdn;

    sget-object v1, Lpt0;->b:Lpt0;

    if-ne p4, v1, :cond_9

    const/4 v1, 0x1

    :goto_7
    move v9, v1

    goto :goto_b

    :cond_9
    const/4 v1, 0x0

    goto :goto_7

    :goto_b
    const/4 v5, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v6, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v9}, Lfdn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpt0;ZIILfdn;Z)V

    return-object v0
.end method


# virtual methods
.method public final b()Z
    .registers 2

    iget-boolean v0, p0, Lfdn;->e:Z

    if-nez v0, :cond_a

    iget-object p0, p0, Lfdn;->f:Lfdn;

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_1f

    const-class v0, Lfdn;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_1f

    check-cast p1, Lfdn;

    iget-boolean v0, p1, Lfdn;->e:Z

    iget-boolean v1, p0, Lfdn;->e:Z

    if-ne v0, v1, :cond_1f

    iget-object p0, p0, Lfdn;->b:Ljava/lang/String;

    iget-object p1, p1, Lfdn;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-boolean v0, p0, Lfdn;->e:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object p0, p0, Lfdn;->b:Ljava/lang/String;

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
