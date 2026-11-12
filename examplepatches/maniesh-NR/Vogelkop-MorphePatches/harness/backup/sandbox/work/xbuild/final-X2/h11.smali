.class public final Lh11;
.super Lz43;
.source "SourceFile"


# static fields
.field public static final j:Lh11;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lh11;

    const-string v1, "https://ofa-sub.osp.opera.software/v1/binary"

    const-string v2, "BUce4RU0cGacBYcKb6RUI8G8hNqgkAQu:"

    const-string v3, "analytics"

    invoke-direct {v0, v3, v1, v2}, Lz43;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lh11;->j:Lh11;

    return-void
.end method


# virtual methods
.method public final r(Landroid/content/Context;)Lzsf;
    .registers 8

    iget-object p0, p0, Lz43;->e:Ljava/lang/Object;

    check-cast p0, Lumi;

    if-eqz p0, :cond_8

    :goto_6
    move-object v2, p0

    goto :goto_a

    :cond_8
    const/4 p0, 0x0

    goto :goto_6

    :goto_a
    new-instance v0, Lzsf;

    new-instance v5, Ls9i;

    invoke-direct {v5, p1}, Ls9i;-><init>(Landroid/content/Context;)V

    const-string v3, "opera_osp_service_data"

    const-string v4, "opera_osp_avro_scheduler_pref"

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lzsf;-><init>(Landroid/content/Context;Lumi;Ljava/lang/String;Ljava/lang/String;Lssf;)V

    return-object v0
.end method
