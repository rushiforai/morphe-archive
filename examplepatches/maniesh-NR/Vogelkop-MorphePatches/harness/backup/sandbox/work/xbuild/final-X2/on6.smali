.class public final Lon6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lika;

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Lpn6;

.field public y:I


# direct methods
.method public constructor <init>(Lpn6;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lon6;->x:Lpn6;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lon6;->w:Ljava/lang/Object;

    iget p1, p0, Lon6;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lon6;->y:I

    iget-object p1, p0, Lon6;->x:Lpn6;

    invoke-virtual {p1, p0}, Lpn6;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
