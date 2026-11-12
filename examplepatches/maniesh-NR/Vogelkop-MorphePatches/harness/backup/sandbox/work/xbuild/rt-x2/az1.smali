.class public final Laz1;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public final synthetic A:Ldz1;

.field public B:I

.field public t:Ljava/lang/String;

.field public u:Ljava/io/File;

.field public v:Ljava/lang/String;

.field public w:Lesd;

.field public x:Z

.field public y:J

.field public synthetic z:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ldz1;Lnt5;)V
    .registers 3

    iput-object p1, p0, Laz1;->A:Ldz1;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Laz1;->z:Ljava/lang/Object;

    iget p1, p0, Laz1;->B:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Laz1;->B:I

    iget-object p1, p0, Laz1;->A:Ldz1;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, p0}, Ldz1;->c(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
