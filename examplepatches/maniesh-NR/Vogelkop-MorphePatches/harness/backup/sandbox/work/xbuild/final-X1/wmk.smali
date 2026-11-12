.class public final Lwmk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltdn;
.implements Lf7f;


# static fields
.field public static final f:Ljava/util/Random;


# instance fields
.field public final a:Lydn;

.field public final b:Lslk;

.field public final c:Lvmk;

.field public d:Lck8;

.field public e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lwmk;->f:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>(Lydn;Lslk;Lumi;)V
    .registers 10

    new-instance v3, Lavj;

    const/4 v0, 0x2

    invoke-direct {v3, v0}, Lavj;-><init>(B)V

    const-wide/32 v0, 0x36ee80

    invoke-static {v0, v1}, Lavj;->e(J)J

    move-result-wide v0

    const-wide/32 v4, 0x4ef6d80

    add-long v1, v0, v4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwmk;->a:Lydn;

    iput-object p2, p0, Lwmk;->b:Lslk;

    new-instance v0, Lvmk;

    new-instance v5, Lqlk;

    const/4 v4, 0x3

    invoke-direct {v5, p0, v4}, Lqlk;-><init>(Ljava/lang/Object;B)V

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lvmk;-><init>(JLavj;Lumi;Lqlk;)V

    iput-object v0, p0, Lwmk;->c:Lvmk;

    iget-object p2, p2, Lslk;->i:Lkze;

    invoke-virtual {p2, p0}, Lekc;->k(Lf7f;)V

    invoke-virtual {p1, p0}, Lydn;->b(Ltdn;)V

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 1

    invoke-virtual {p0}, Lwmk;->a()V

    return-void
.end method

.method public final a()V
    .registers 9

    iget-object v0, p0, Lwmk;->a:Lydn;

    iget-object v1, v0, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object v0, v0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lwmk;->d:Lck8;

    if-eqz v0, :cond_1e

    iget-object v1, p0, Lwmk;->e:Ljava/lang/String;

    if-eqz v1, :cond_1e

    iget-boolean v0, v0, Lck8;->e:Z

    if-eqz v0, :cond_1e

    const/4 v0, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x0

    :goto_1f
    iget-object v1, p0, Lwmk;->d:Lck8;

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_28

    iget-wide v4, v1, Lck8;->d:J

    goto :goto_29

    :cond_28
    move-wide v4, v2

    :goto_29
    iget-object v1, p0, Lwmk;->c:Lvmk;

    iget-wide v6, v1, Lvmk;->f:J

    cmp-long v6, v6, v4

    if-eqz v6, :cond_3a

    iput-wide v4, v1, Lvmk;->f:J

    iput-wide v2, v1, Lvmk;->g:J

    iput-wide v2, v1, Lvmk;->h:J

    invoke-virtual {v1}, Lvmk;->a()V

    :cond_3a
    iget-object p0, p0, Lwmk;->d:Lck8;

    if-eqz p0, :cond_41

    iget-wide v4, p0, Lck8;->c:J

    goto :goto_42

    :cond_41
    move-wide v4, v2

    :goto_42
    iget-wide v6, v1, Lvmk;->e:J

    cmp-long p0, v6, v4

    if-eqz p0, :cond_4d

    iput-wide v4, v1, Lvmk;->e:J

    invoke-virtual {v1}, Lvmk;->a()V

    :cond_4d
    iget-boolean p0, v1, Lvmk;->d:Z

    if-ne v0, p0, :cond_52

    return-void

    :cond_52
    iput-boolean v0, v1, Lvmk;->d:Z

    if-nez v0, :cond_5a

    iput-wide v2, v1, Lvmk;->g:J

    iput-wide v2, v1, Lvmk;->h:J

    :cond_5a
    invoke-virtual {v1}, Lvmk;->a()V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lwvg;

    iget v0, p1, Lwvg;->e:I

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p1}, Lwvg;->a()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p1, Lwvg;->g:Lck8;

    iput-object v0, p0, Lwmk;->d:Lck8;

    iget-object p1, p1, Lwvg;->a:Ljava/lang/String;

    iput-object p1, p0, Lwmk;->e:Ljava/lang/String;

    goto :goto_1b

    :cond_16
    const/4 p1, 0x0

    iput-object p1, p0, Lwmk;->d:Lck8;

    iput-object p1, p0, Lwmk;->e:Ljava/lang/String;

    :goto_1b
    invoke-virtual {p0}, Lwmk;->a()V

    return-void
.end method

.method public final s()V
    .registers 1

    invoke-virtual {p0}, Lwmk;->a()V

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method
