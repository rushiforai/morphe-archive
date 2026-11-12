.class public final Lg5a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb2l;

.field public final b:Lpde;

.field public final c:Lkol;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltsd;Lyqa;Lb2l;Lgv;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lg5a;->a:Lb2l;

    new-instance v2, Lpde;

    sget-object v0, Log;->a:Log;

    invoke-direct {v2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lg5a;->b:Lpde;

    new-instance v0, Lkol;

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lkol;-><init>(Landroid/content/Context;Lpde;Likc;Lyqa;Lkotlin/jvm/functions/Function1;)V

    iput-object v0, p0, Lg5a;->c:Lkol;

    new-instance p1, Lqz;

    const/16 p2, 0x9

    invoke-direct {p1, p0, p2}, Lqz;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lal7;

    const/16 p3, 0x12

    invoke-direct {p2, p0, p3}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p4, v2, p1, p2}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method
