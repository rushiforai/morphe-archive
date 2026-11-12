.class public final Lcz1;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public final synthetic A:Ldz1;

.field public B:I

.field public t:Ljava/lang/String;

.field public u:Landroid/net/Uri;

.field public v:Ljava/lang/String;

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/String;

.field public y:Z

.field public synthetic z:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ldz1;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lcz1;->A:Ldz1;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iput-object p1, p0, Lcz1;->z:Ljava/lang/Object;

    iget p1, p0, Lcz1;->B:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lcz1;->B:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v0, p0, Lcz1;->A:Ldz1;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v6, p0

    invoke-virtual/range {v0 .. v6}, Ldz1;->d(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
