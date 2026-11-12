.class public final Ljol;
.super Lzwg;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Lc69;

.field public d:Leol;


# direct methods
.method public constructor <init>(II)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ljol;->a:I

    iput p2, p0, Ljol;->b:I

    new-instance v0, Lc69;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lc69;-><init>(IIB)V

    iput-object v0, p0, Ljol;->c:Lc69;

    sget-object p1, Leol;->c:Leol;

    iput-object p1, p0, Ljol;->d:Leol;

    return-void
.end method


# virtual methods
.method public final j()Leol;
    .registers 1

    iget-object p0, p0, Ljol;->d:Leol;

    return-object p0
.end method

.method public final k()Le2m;
    .registers 1

    iget-object p0, p0, Ljol;->c:Lc69;

    return-object p0
.end method

.method public final o(Lm7l;)Ll7l;
    .registers 5

    iget-object v0, p1, Lm7l;->c:Ll7l;

    iget v1, v0, Ll7l;->b:I

    iget v2, v0, Ll7l;->c:I

    if-le v1, v2, :cond_15

    iget v1, p0, Ljol;->b:I

    mul-int/lit8 v1, v1, 0x50

    div-int/lit8 v1, v1, 0x64

    if-le v2, v1, :cond_22

    sget-object p1, Leol;->c:Leol;

    iput-object p1, p0, Ljol;->d:Leol;

    return-object v0

    :cond_15
    iget v2, p0, Ljol;->a:I

    mul-int/lit8 v2, v2, 0x50

    div-int/lit8 v2, v2, 0x64

    if-le v1, v2, :cond_22

    sget-object p1, Leol;->c:Leol;

    iput-object p1, p0, Ljol;->d:Leol;

    return-object v0

    :cond_22
    sget-object v0, Leol;->b:Leol;

    iput-object v0, p0, Ljol;->d:Leol;

    iget-object p0, p1, Lm7l;->b:Ll7l;

    return-object p0
.end method
