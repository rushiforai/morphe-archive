.class public final Lxch;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lxri;

.field public u:Lqd6;

.field public v:Ljava/lang/String;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Lych;

.field public y:I


# direct methods
.method public constructor <init>(Lych;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lxch;->x:Lych;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lxch;->w:Ljava/lang/Object;

    iget p1, p0, Lxch;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lxch;->y:I

    iget-object p1, p0, Lxch;->x:Lych;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lych;->a(Lxri;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
