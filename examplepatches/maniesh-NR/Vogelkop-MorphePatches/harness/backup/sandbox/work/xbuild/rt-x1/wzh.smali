.class public final Lwzh;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lx9m;

.field public u:Lfr6;

.field public v:I

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Lrgh;

.field public y:I


# direct methods
.method public constructor <init>(Lrgh;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lwzh;->x:Lrgh;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lwzh;->w:Ljava/lang/Object;

    iget p1, p0, Lwzh;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lwzh;->y:I

    iget-object p1, p0, Lwzh;->x:Lrgh;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lrgh;->l(Lnyb;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
