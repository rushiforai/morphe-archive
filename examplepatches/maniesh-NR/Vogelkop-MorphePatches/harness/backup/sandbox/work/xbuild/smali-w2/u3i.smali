.class public final Lu3i;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Landroid/content/Context;

.field public u:Landroid/net/Uri;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lhr5;

.field public x:I


# direct methods
.method public constructor <init>(Lhr5;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lu3i;->w:Lhr5;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lu3i;->v:Ljava/lang/Object;

    iget p1, p0, Lu3i;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lu3i;->x:I

    iget-object p1, p0, Lu3i;->w:Lhr5;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lhr5;->m(Lm0f;Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
