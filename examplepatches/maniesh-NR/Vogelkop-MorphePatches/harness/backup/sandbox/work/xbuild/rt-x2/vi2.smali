.class public final Lvi2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrzh;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:I

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 4

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lvi2;->b:Z

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lvi2;->a:Ljava/lang/String;

    .line 35
    iput-object v0, p0, Lvi2;->h:Ljava/lang/Object;

    .line 36
    iput p1, p0, Lvi2;->c:I

    .line 37
    iput-object p2, p0, Lvi2;->g:Ljava/lang/Object;

    .line 38
    iput-object v0, p0, Lvi2;->d:Ljava/lang/Object;

    .line 39
    iput-object v0, p0, Lvi2;->e:Ljava/lang/Object;

    .line 40
    iput-object v0, p0, Lvi2;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 7

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-boolean p6, p0, Lvi2;->b:Z

    .line 43
    iput-object p1, p0, Lvi2;->a:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lvi2;->h:Ljava/lang/Object;

    .line 45
    iput-object p3, p0, Lvi2;->d:Ljava/lang/Object;

    .line 46
    iput-object p4, p0, Lvi2;->e:Ljava/lang/Object;

    .line 47
    iput-object p5, p0, Lvi2;->f:Ljava/lang/Object;

    const/4 p1, -0x1

    .line 48
    iput p1, p0, Lvi2;->c:I

    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Lvi2;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lode;Lkotlin/jvm/functions/Function1;Loyj;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvi2;->a:Ljava/lang/String;

    iput-object p2, p0, Lvi2;->d:Ljava/lang/Object;

    iput-object p3, p0, Lvi2;->e:Ljava/lang/Object;

    iput-object p4, p0, Lvi2;->f:Ljava/lang/Object;

    new-instance p1, Lpde;

    sget-object p3, Lng;->a:Lng;

    invoke-direct {p1, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lvi2;->g:Ljava/lang/Object;

    new-instance p1, Lmyj;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Lmyj;-><init>(Lvi2;B)V

    iput-object p1, p0, Lvi2;->h:Ljava/lang/Object;

    invoke-virtual {p2, p1}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    iget v0, p0, Lvi2;->c:I

    if-gt p1, v0, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lvi2;->c:I

    iget-object v0, p0, Lvi2;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_28

    iget-object p1, p0, Lvi2;->a:Ljava/lang/String;

    iget v0, p0, Lvi2;->c:I

    invoke-static {p1, v0}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Character;->getType(I)I

    move-result v0

    const/16 v1, 0x18

    if-ne v0, v1, :cond_28

    iget v0, p0, Lvi2;->c:I

    invoke-static {p1}, Ljava/lang/Character;->charCount(I)I

    move-result p1

    add-int/2addr p1, v0

    iput p1, p0, Lvi2;->c:I

    :cond_28
    iget-object p1, p0, Lvi2;->e:Ljava/lang/Object;

    check-cast p1, Lkotlin/jvm/functions/Function1;

    iget p0, p0, Lvi2;->c:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final cancel()V
    .registers 3

    iget-boolean v0, p0, Lvi2;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lvi2;->b:Z

    iget-object v0, p0, Lvi2;->d:Ljava/lang/Object;

    check-cast v0, Lode;

    iget-object v1, p0, Lvi2;->h:Ljava/lang/Object;

    check-cast v1, Lmyj;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lvi2;->g:Ljava/lang/Object;

    check-cast v0, Lpde;

    sget-object v1, Log;->a:Log;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v0, p0, Lvi2;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lvi2;->a(I)V

    return-void
.end method

.method public final l(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lvi2;->a:Ljava/lang/String;

    return-void
.end method
