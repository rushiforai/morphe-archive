.class public final Lyi9;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/util/ArrayList;

.field public u:Ljava/util/Iterator;

.field public v:Ljdj;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Lzi9;

.field public y:I


# direct methods
.method public constructor <init>(Lzi9;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lyi9;->x:Lzi9;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lyi9;->w:Ljava/lang/Object;

    iget p1, p0, Lyi9;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lyi9;->y:I

    iget-object p1, p0, Lyi9;->x:Lzi9;

    invoke-virtual {p1, p0}, Lzi9;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
