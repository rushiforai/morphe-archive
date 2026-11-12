.class public final Lj8a;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Li06;

.field public v:I


# direct methods
.method public constructor <init>(Li06;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lj8a;->u:Li06;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lj8a;->t:Ljava/lang/Object;

    iget p1, p0, Lj8a;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lj8a;->v:I

    iget-object p1, p0, Lj8a;->u:Li06;

    invoke-virtual {p1, p0}, Li06;->i(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
