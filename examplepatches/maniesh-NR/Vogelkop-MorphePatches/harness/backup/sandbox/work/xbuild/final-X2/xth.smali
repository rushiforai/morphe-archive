.class public final Lxth;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ltth;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lzth;

.field public w:I


# direct methods
.method public constructor <init>(Lzth;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lxth;->v:Lzth;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lxth;->u:Ljava/lang/Object;

    iget p1, p0, Lxth;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lxth;->w:I

    iget-object p1, p0, Lxth;->v:Lzth;

    const/4 v0, 0x0

    invoke-static {p1, v0, p0}, Lzth;->b(Lzth;Ltth;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
