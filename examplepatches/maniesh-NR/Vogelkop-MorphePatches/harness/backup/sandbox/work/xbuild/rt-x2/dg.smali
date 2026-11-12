.class public final Ldg;
.super Lk56;
.source "SourceFile"


# static fields
.field public static final t:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x96

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Ldg;->t:J

    return-void
.end method


# virtual methods
.method public final g()J
    .registers 3

    sget-wide v0, Ldg;->t:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final t(Landroidx/recyclerview/widget/i;IIII)V
    .registers 7

    if-eqz p1, :cond_6

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/i;->setIsRecyclable(Z)V

    :cond_6
    invoke-super/range {p0 .. p5}, Lk56;->t(Landroidx/recyclerview/widget/i;IIII)V

    return-void
.end method
