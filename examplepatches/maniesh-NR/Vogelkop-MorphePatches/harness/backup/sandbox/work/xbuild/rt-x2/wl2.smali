.class public final Lwl2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:J


# instance fields
.field public final a:Ldg2;

.field public final b:Lq02;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x5

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lwl2;->c:J

    return-void
.end method

.method public constructor <init>(Ldg2;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwl2;->a:Ldg2;

    new-instance p1, Lq02;

    const/16 v0, 0x14

    invoke-direct {p1, p0, v0}, Lq02;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lwl2;->b:Lq02;

    invoke-virtual {p0}, Lwl2;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object p0, p0, Lwl2;->b:Lq02;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    sget-wide v0, Lwl2;->c:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method
