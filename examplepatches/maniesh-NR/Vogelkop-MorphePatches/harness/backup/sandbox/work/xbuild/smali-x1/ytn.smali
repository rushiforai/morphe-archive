.class public final Lytn;
.super Lvtn;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lytn;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final c()J
    .registers 5

    iget-object p0, p0, Lytn;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    int-to-long v2, p0

    add-long/2addr v2, v0

    return-wide v2
.end method

.method public final d()Lutn;
    .registers 1

    sget-object p0, Lutn;->a:Lutn;

    return-object p0
.end method
