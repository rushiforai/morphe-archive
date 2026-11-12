.class public final Lsi9;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:J

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lti9;

.field public w:I


# direct methods
.method public constructor <init>(Lti9;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lsi9;->v:Lti9;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lsi9;->u:Ljava/lang/Object;

    iget p1, p0, Lsi9;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lsi9;->w:I

    iget-object p1, p0, Lsi9;->v:Lti9;

    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1, p0}, Lti9;->c(JLnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
