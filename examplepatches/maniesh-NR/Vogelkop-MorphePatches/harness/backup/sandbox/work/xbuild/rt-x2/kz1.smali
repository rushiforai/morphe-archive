.class public final Lkz1;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Ltz1;

.field public v:I


# direct methods
.method public constructor <init>(Ltz1;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lkz1;->u:Ltz1;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lkz1;->t:Ljava/lang/Object;

    iget p1, p0, Lkz1;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lkz1;->v:I

    iget-object p1, p0, Lkz1;->u:Ltz1;

    invoke-virtual {p1, p0}, Ltz1;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
