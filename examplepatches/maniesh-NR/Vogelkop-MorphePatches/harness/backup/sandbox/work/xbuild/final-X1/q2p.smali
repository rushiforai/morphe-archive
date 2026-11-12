.class public final Lq2p;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:La3p;

.field public v:I


# direct methods
.method public constructor <init>(La3p;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lq2p;->u:La3p;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lq2p;->t:Ljava/lang/Object;

    iget p1, p0, Lq2p;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lq2p;->v:I

    iget-object p1, p0, Lq2p;->u:La3p;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, La3p;->d(Ljava/lang/String;Lnt5;)Ljava/io/Serializable;

    move-result-object p0

    return-object p0
.end method
