.class public final Lw04;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:J


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lx05;

.field public c:Z

.field public final d:Lfv2;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x1f4

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lw04;->e:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lkze;Lp12;Ldll;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw04;->a:Landroid/content/Context;

    new-instance v0, Lx05;

    invoke-direct {v0, p1}, Lx05;-><init>(Landroid/content/Context;)V

    iget-object p1, v0, Lx05;->a:Lu05;

    iget-boolean v1, p1, Lu05;->n:Z

    if-eqz v1, :cond_13

    const/4 v1, 0x0

    iput-boolean v1, p1, Lu05;->n:Z

    :cond_13
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    iput-object v0, p0, Lw04;->b:Lx05;

    new-instance p1, Lfv2;

    const/16 v0, 0x1a

    invoke-direct {p1, p0, v0}, Lfv2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lw04;->d:Lfv2;

    new-instance p1, Lrw0;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Lrw0;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Loc2;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p4, p2, p1, v0}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object p1, p3, Lp12;->g:Ljava/lang/Object;

    check-cast p1, Lkze;

    new-instance p3, Lk9;

    const/16 p4, 0x15

    invoke-direct {p3, p0, p4}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p1, Lbo3;

    const/16 p3, 0xc

    invoke-direct {p1, p0, p3}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lpb;

    const/16 p3, 0x1d

    invoke-direct {p0, p1, p3}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method
