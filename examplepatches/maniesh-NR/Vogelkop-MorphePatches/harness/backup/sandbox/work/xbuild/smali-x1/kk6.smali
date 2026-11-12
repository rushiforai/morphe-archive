.class public final Lkk6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Landroid/content/Context;

.field public u:Li8f;

.field public v:Lh8f;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Llk6;

.field public y:I


# direct methods
.method public constructor <init>(Llk6;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lkk6;->x:Llk6;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lkk6;->w:Ljava/lang/Object;

    iget p1, p0, Lkk6;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lkk6;->y:I

    iget-object p1, p0, Lkk6;->x:Llk6;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Llk6;->e(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Enum;

    move-result-object p0

    return-object p0
.end method
