.class public final Lurn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:J


# instance fields
.field public final a:Lj4c;

.field public final b:Lzv3;

.field public final c:Ltpl;

.field public d:Lspl;

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x3

    sget-object v1, Lun7;->f:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lurn;->f:J

    return-void
.end method

.method public constructor <init>(Lj4c;Lzv3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lurn;->a:Lj4c;

    iput-object p2, p0, Lurn;->b:Lzv3;

    sget-object p1, Ltpl;->a:Ltpl;

    iput-object p1, p0, Lurn;->c:Ltpl;

    return-void
.end method
