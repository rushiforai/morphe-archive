.class public final Lrza;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Ltza;

.field public v:I


# direct methods
.method public constructor <init>(Ltza;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lrza;->u:Ltza;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lrza;->t:Ljava/lang/Object;

    iget p1, p0, Lrza;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lrza;->v:I

    iget-object p1, p0, Lrza;->u:Ltza;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Ltza;->c(Landroid/content/Context;Landroid/graphics/Bitmap;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
