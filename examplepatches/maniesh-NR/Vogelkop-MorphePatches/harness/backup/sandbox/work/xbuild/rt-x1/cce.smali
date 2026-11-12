.class public final Lcce;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/lang/String;

.field public u:Lpfe;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lece;

.field public x:I


# direct methods
.method public constructor <init>(Lece;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lcce;->w:Lece;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lcce;->v:Ljava/lang/Object;

    iget p1, p0, Lcce;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lcce;->x:I

    iget-object p1, p0, Lcce;->w:Lece;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lece;->e(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
