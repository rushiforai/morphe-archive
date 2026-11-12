.class public final Let6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Luv9;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lft6;

.field public w:I


# direct methods
.method public constructor <init>(Lft6;Lnt5;)V
    .registers 3

    iput-object p1, p0, Let6;->v:Lft6;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Let6;->u:Ljava/lang/Object;

    iget p1, p0, Let6;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Let6;->w:I

    iget-object p1, p0, Let6;->v:Lft6;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lft6;->a(Luv9;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
