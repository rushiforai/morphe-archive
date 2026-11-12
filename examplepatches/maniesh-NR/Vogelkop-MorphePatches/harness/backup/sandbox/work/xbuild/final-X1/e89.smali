.class public final synthetic Le89;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzak;


# instance fields
.field public final synthetic a:Lg89;


# direct methods
.method public synthetic constructor <init>(Lg89;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le89;->a:Lg89;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .registers 10

    check-cast p1, Lcom/google/android/play/core/install/zza;

    iget v0, p1, Lcom/google/android/play/core/install/zza;->a:I

    iget-object p0, p0, Le89;->a:Lg89;

    iget-object v1, p0, Lg89;->o:Ljdj;

    iget-boolean v2, p0, Lg89;->i:Z

    if-eqz v2, :cond_39

    iput-object p1, p0, Lg89;->h:Lcom/google/android/play/core/install/zza;

    const/4 v2, 0x5

    if-ne v0, v2, :cond_16

    sget-object v2, Lcom;->a:Lcom;

    invoke-virtual {v1, v2}, Ljdj;->i(Ljava/lang/Object;)Z

    :cond_16
    invoke-virtual {p0}, Lg89;->c()V

    const/4 p0, 0x2

    if-ne v0, p0, :cond_39

    iget-wide v6, p1, Lcom/google/android/play/core/install/zza;->c:J

    const-wide/16 v2, 0x0

    cmp-long p0, v6, v2

    if-lez p0, :cond_39

    iget-wide v2, p1, Lcom/google/android/play/core/install/zza;->b:J

    const-wide/16 v4, 0x0

    invoke-static/range {v2 .. v7}, Ldjh;->d(JJJ)J

    move-result-wide p0

    new-instance v0, Laom;

    const-wide/16 v2, 0x64

    mul-long/2addr p0, v2

    div-long/2addr p0, v6

    long-to-int p0, p0

    invoke-direct {v0, p0}, Laom;-><init>(I)V

    invoke-virtual {v1, v0}, Ljdj;->i(Ljava/lang/Object;)Z

    :cond_39
    return-void
.end method
