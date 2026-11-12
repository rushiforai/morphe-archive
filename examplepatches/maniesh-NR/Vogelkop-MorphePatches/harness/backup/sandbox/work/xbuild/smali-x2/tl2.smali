.class public final Ltl2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:J


# instance fields
.field public final a:Lp12;

.field public final b:Ldg2;

.field public final c:Lq02;

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0xa

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Ltl2;->e:J

    return-void
.end method

.method public constructor <init>(Lkze;Lp12;Ldg2;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltl2;->a:Lp12;

    iput-object p3, p0, Ltl2;->b:Ldg2;

    new-instance p3, Lq02;

    const/16 v0, 0x13

    invoke-direct {p3, p0, v0}, Lq02;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Ltl2;->c:Lq02;

    iget-object p3, p2, Lp12;->g:Ljava/lang/Object;

    check-cast p3, Lkze;

    new-instance v0, Lsl2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lsl2;-><init>(Ltl2;B)V

    invoke-static {p3, p1, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p2, p2, Lp12;->b:Ljava/lang/Object;

    check-cast p2, Lkze;

    new-instance p3, Lsl2;

    const/4 v0, 0x1

    invoke-direct {p3, p0, v0}, Lsl2;-><init>(Ltl2;B)V

    invoke-static {p2, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method
