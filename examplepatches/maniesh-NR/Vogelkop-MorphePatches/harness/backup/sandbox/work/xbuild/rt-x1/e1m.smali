.class public final Le1m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:I

.field public t:Lavb;

.field public u:Lxzl;

.field public v:Lyzl;

.field public w:Ljava/lang/Throwable;

.field public x:I

.field public synthetic y:Ljava/lang/Object;

.field public final synthetic z:Lg1m;


# direct methods
.method public constructor <init>(Lg1m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Le1m;->z:Lg1m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Le1m;->y:Ljava/lang/Object;

    iget p1, p0, Le1m;->A:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Le1m;->A:I

    const/4 p1, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Le1m;->z:Lg1m;

    invoke-virtual {v1, p1, p1, v0, p0}, Lg1m;->c(Lavb;Lxzl;ILnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
