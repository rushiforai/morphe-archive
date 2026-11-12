.class public final Luwa;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lcom/opera/hype/image/editor/EditImage;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lywa;

.field public w:I


# direct methods
.method public constructor <init>(Lywa;Lnt5;)V
    .registers 3

    iput-object p1, p0, Luwa;->v:Lywa;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Luwa;->u:Ljava/lang/Object;

    iget p1, p0, Luwa;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Luwa;->w:I

    sget-object p1, Lywa;->g:[Lxtb;

    iget-object p1, p0, Luwa;->v:Lywa;

    invoke-virtual {p1, p0}, Lywa;->i0(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
