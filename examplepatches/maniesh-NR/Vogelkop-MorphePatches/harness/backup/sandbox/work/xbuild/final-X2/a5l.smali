.class public final La5l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:J

.field public static final i:J

.field public static final j:J

.field public static final k:J

.field public static final l:Lgpk;


# instance fields
.field public final a:Lumi;

.field public final b:Lwun;

.field public final c:Ln9h;

.field public final d:Ln9h;

.field public final e:Lzyk;

.field public final f:Lzyk;

.field public final g:Lqie;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0xa

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, La5l;->h:J

    sget-object v0, Lun7;->h:Lun7;

    const/4 v1, 0x1

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, La5l;->i:J

    const/4 v1, 0x7

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, La5l;->j:J

    const/16 v1, 0x1e

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, La5l;->k:J

    new-instance v0, Lgpk;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lgpk;-><init>(B)V

    sput-object v0, La5l;->l:Lgpk;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lwun;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, La5l;->a:Lumi;

    iput-object p3, p0, La5l;->b:Lwun;

    new-instance p2, Ln9h;

    const/16 p3, 0x8

    invoke-direct {p2, p3}, Ln9h;-><init>(B)V

    iput-object p2, p0, La5l;->c:Ln9h;

    new-instance p2, Ln9h;

    invoke-direct {p2, p3}, Ln9h;-><init>(B)V

    iput-object p2, p0, La5l;->d:Ln9h;

    new-instance p2, Leek;

    invoke-direct {p2, p1, p0, p3}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, La5l;->e:Lzyk;

    new-instance p1, Ldnj;

    const/16 p2, 0x1a

    invoke-direct {p1, p0, p2}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, La5l;->f:Lzyk;

    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, La5l;->g:Lqie;

    return-void
.end method


# virtual methods
.method public final a()Le58;
    .registers 1

    iget-object p0, p0, La5l;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le58;

    return-object p0
.end method

.method public final b(Ljava/lang/String;Lp6l;Ljava/lang/String;I)Lx4l;
    .registers 11

    new-instance v0, Lx4l;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    move-object v1, p1

    move-object v3, p3

    move v2, p4

    invoke-direct/range {v0 .. v5}, Lx4l;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_20

    if-ne p1, p2, :cond_1b

    iget-object p0, p0, La5l;->d:Ln9h;

    invoke-virtual {p0, v1, v0, p2}, Ln9h;->o(Ljava/lang/String;Lx4l;Z)V

    return-object v0

    :cond_1b
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_20
    iget-object p1, p0, La5l;->c:Ln9h;

    invoke-virtual {p1, v1, v0, p2}, Ln9h;->o(Ljava/lang/String;Lx4l;Z)V

    new-instance p1, Lrml;

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object p3, p0, La5l;->a:Lumi;

    invoke-direct {p1, p2, p3}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p2, Ld7k;

    const/16 p3, 0xb

    invoke-direct {p2, p0, v0, p3}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, La5l;->g:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-object v0
.end method
