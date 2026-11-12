.class public final Lxy1;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public final synthetic A:Ldz1;

.field public B:I

.field public t:Ljava/lang/String;

.field public u:Ljava/io/File;

.field public v:Lesd;

.field public w:Lbfj;

.field public x:Lokhttp3/internal/connection/RealCall;

.field public y:J

.field public synthetic z:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ldz1;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lxy1;->A:Ldz1;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iput-object p1, p0, Lxy1;->z:Ljava/lang/Object;

    iget p1, p0, Lxy1;->B:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lxy1;->B:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v0, p0, Lxy1;->A:Ldz1;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-object v7, p0

    invoke-virtual/range {v0 .. v7}, Ldz1;->a(Ljava/lang/String;Ljava/io/File;JLesd;Lbfj;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
