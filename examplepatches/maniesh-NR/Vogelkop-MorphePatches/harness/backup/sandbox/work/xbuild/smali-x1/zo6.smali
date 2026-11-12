.class public final Lzo6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Lap6;

.field public v:I


# direct methods
.method public constructor <init>(Lap6;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lzo6;->u:Lap6;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iput-object p1, p0, Lzo6;->t:Ljava/lang/Object;

    iget p1, p0, Lzo6;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lzo6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v0, p0, Lzo6;->u:Lap6;

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Lap6;->a(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ZLnt5;)Ljava/lang/Enum;

    move-result-object p0

    return-object p0
.end method
