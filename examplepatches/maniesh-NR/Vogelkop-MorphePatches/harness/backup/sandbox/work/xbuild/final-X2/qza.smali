.class public final Lqza;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Landroid/content/Context;

.field public u:Landroid/graphics/Bitmap;

.field public v:Ljava/util/Map;

.field public w:Z

.field public synthetic x:Ljava/lang/Object;

.field public final synthetic y:Ltza;

.field public z:I


# direct methods
.method public constructor <init>(Ltza;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lqza;->y:Ltza;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lqza;->x:Ljava/lang/Object;

    iget p1, p0, Lqza;->z:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lqza;->z:I

    iget-object p1, p0, Lqza;->y:Ltza;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ltza;->a(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
