.class public final Lkpe;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/util/EnumSet;

.field public u:Ljava/util/Iterator;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lisd;

.field public x:I


# direct methods
.method public constructor <init>(Lisd;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lkpe;->w:Lisd;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lkpe;->v:Ljava/lang/Object;

    iget p1, p0, Lkpe;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lkpe;->x:I

    iget-object p1, p0, Lkpe;->w:Lisd;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lisd;->M(Ljava/util/EnumSet;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
