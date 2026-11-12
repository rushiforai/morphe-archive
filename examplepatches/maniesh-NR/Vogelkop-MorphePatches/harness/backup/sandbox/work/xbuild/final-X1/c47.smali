.class public final Lc47;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:J

.field public static final h:J


# instance fields
.field public final a:Lumi;

.field public final b:Lx5f;

.field public final c:Ld5o;

.field public final d:Ld5o;

.field public final e:Lwu5;

.field public final f:Ld5o;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x1e

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lc47;->g:J

    const/4 v0, 0x2

    sget-object v1, Lun7;->f:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lc47;->h:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lx5f;Ltcc;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lc47;->a:Lumi;

    iput-object p3, p0, Lc47;->b:Lx5f;

    new-instance p3, Ld5o;

    new-instance v0, Ly37;

    invoke-direct {v0, p1, p2}, Ly37;-><init>(Landroid/content/Context;Lumi;)V

    invoke-direct {p3, v0}, Ld5o;-><init>(Ln1;)V

    iput-object p3, p0, Lc47;->c:Ld5o;

    new-instance p1, Ld5o;

    new-instance p3, Lv37;

    const/4 v0, 0x0

    invoke-direct {p3, p2, v0}, Lv37;-><init>(Lumi;B)V

    invoke-direct {p1, p3}, Ld5o;-><init>(Ln1;)V

    iput-object p1, p0, Lc47;->d:Ld5o;

    new-instance p1, Lwu5;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc47;->e:Lwu5;

    new-instance p1, Ld5o;

    new-instance p3, Lv37;

    const/4 v0, 0x1

    invoke-direct {p3, p2, v0}, Lv37;-><init>(Lumi;B)V

    invoke-direct {p1, p3}, Ld5o;-><init>(Ln1;)V

    iput-object p1, p0, Lc47;->f:Ld5o;

    new-instance p1, Lb47;

    invoke-direct {p1, p0}, Lb47;-><init>(Lc47;)V

    invoke-virtual {p4, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method
