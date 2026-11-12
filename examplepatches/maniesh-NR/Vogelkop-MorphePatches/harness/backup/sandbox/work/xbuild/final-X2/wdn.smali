.class public final Lwdn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z

.field public final d:I

.field public final e:Z

.field public final f:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lydn;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lydn;->o:Lufn;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltfn;

    iget-wide v1, v0, Ltfn;->a:J

    const-wide/16 v3, 0x1

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    const/4 v2, 0x0

    if-eqz v1, :cond_19

    const/4 v1, 0x1

    goto :goto_1a

    :cond_19
    move v1, v2

    :goto_1a
    iput-boolean v1, p0, Lwdn;->a:Z

    iget-object v1, p1, Lydn;->q:Ljtg;

    invoke-virtual {v1}, Ljtg;->b()Z

    move-result v3

    iput-boolean v3, p0, Lwdn;->b:Z

    iget-object p1, p1, Lydn;->l:Landroid/content/Context;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "vpn_pro.kill_switch.on"

    invoke-interface {p1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lwdn;->c:Z

    iget p1, v0, Ltfn;->b:I

    iput p1, p0, Lwdn;->d:I

    invoke-virtual {v1}, Ljtg;->d()Z

    move-result p1

    iput-boolean p1, p0, Lwdn;->e:Z

    iget-object p1, v0, Ltfn;->c:[Ljava/lang/String;

    if-eqz p1, :cond_4a

    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    goto :goto_4b

    :cond_4a
    const/4 p1, 0x0

    :goto_4b
    iput-object p1, p0, Lwdn;->f:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    const/4 v0, 0x0

    return v0

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Lwdn;->b:Z

    if-eqz v0, :cond_e

    iget-boolean p0, p0, Lwdn;->c:Z

    if-nez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
