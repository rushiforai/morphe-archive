.class public final Lgy0;
.super Lfy0;
.source "SourceFile"

# interfaces
.implements Laca;


# instance fields
.field public final a:Lyda;

.field public final b:J

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lyda;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgy0;->a:Lyda;

    iget-object v0, p1, Lyda;->a:Ljz1;

    iget-object v0, v0, Ljz1;->d:Lebb;

    invoke-virtual {v0}, Lebb;->i()J

    move-result-wide v0

    iput-wide v0, p0, Lgy0;->b:J

    iget-object p1, p1, Lyda;->a:Ljz1;

    iget-object p1, p1, Ljz1;->c:Ljava/lang/String;

    iput-object p1, p0, Lgy0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Lzda;
    .registers 1

    iget-object p0, p0, Lgy0;->a:Lyda;

    return-object p0
.end method

.method public final b()J
    .registers 5

    iget-object p0, p0, Lgy0;->a:Lyda;

    iget-object p0, p0, Lyda;->a:Ljz1;

    invoke-virtual {p0}, Ljz1;->hashCode()I

    move-result p0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    int-to-long v2, p0

    add-long/2addr v2, v0

    return-wide v2
.end method
