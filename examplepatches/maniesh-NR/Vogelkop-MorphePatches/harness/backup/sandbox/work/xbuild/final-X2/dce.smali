.class public final Ldce;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/lang/String;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lece;

.field public w:I


# direct methods
.method public constructor <init>(Lece;Lnt5;)V
    .registers 3

    iput-object p1, p0, Ldce;->v:Lece;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Ldce;->u:Ljava/lang/Object;

    iget p1, p0, Ldce;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Ldce;->w:I

    iget-object p1, p0, Ldce;->v:Lece;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lece;->f(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
