.class public final Locd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:J


# instance fields
.field public final a:Lb59;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x18

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Locd;->b:J

    return-void
.end method

.method public constructor <init>(Lb59;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Locd;->a:Lb59;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 5

    iget-object p0, p0, Locd;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "masthead_ad.last_removed_timestamp"

    const-wide/16 v1, -0x1

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-ltz p0, :cond_2f

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long p0, v2, v0

    if-ltz p0, :cond_2f

    sget-object p0, Lpn7;->b:Lon7;

    sub-long/2addr v2, v0

    sget-object p0, Lun7;->d:Lun7;

    invoke-static {v2, v3, p0}, Lcs5;->y0(JLun7;)J

    move-result-wide v0

    sget-wide v2, Locd;->b:J

    invoke-static {v0, v1, v2, v3}, Lpn7;->c(JJ)I

    move-result p0

    if-ltz p0, :cond_31

    :cond_2f
    const/4 p0, 0x1

    return p0

    :cond_31
    const/4 p0, 0x0

    return p0
.end method
