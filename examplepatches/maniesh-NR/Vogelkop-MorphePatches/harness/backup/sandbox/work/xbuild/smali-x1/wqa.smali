.class public final Lwqa;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ltna;

.field public u:Lfr6;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lyqa;

.field public x:I


# direct methods
.method public constructor <init>(Lyqa;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lwqa;->w:Lyqa;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lwqa;->v:Ljava/lang/Object;

    iget p1, p0, Lwqa;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lwqa;->x:I

    iget-object p1, p0, Lwqa;->w:Lyqa;

    invoke-virtual {p1, p0}, Lyqa;->e(Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
