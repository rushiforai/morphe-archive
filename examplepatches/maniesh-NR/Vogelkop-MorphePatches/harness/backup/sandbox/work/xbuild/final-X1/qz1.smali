.class public final Lqz1;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:La12;

.field public u:Lrii;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Ltz1;

.field public x:I


# direct methods
.method public constructor <init>(Ltz1;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lqz1;->w:Ltz1;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lqz1;->v:Ljava/lang/Object;

    iget p1, p0, Lqz1;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lqz1;->x:I

    iget-object p1, p0, Lqz1;->w:Ltz1;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Ltz1;->d(Landroid/content/Context;Lumi;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
