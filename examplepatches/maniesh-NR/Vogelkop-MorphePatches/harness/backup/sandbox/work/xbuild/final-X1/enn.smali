.class public final Lenn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltjn;


# instance fields
.field public final synthetic a:Lzg;

.field public final synthetic b:Lpg5;


# direct methods
.method public constructor <init>(Lzg;Lpg5;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lenn;->a:Lzg;

    iput-object p2, p0, Lenn;->b:Lpg5;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget-object p0, p0, Lenn;->a:Lzg;

    iget p0, p0, Lzg;->a:I

    return p0
.end method

.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lenn;->a:Lzg;

    iget-object p0, p0, Lzg;->b:Ljava/lang/Object;

    check-cast p0, Lqln;

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lenn;->a:Lzg;

    iget-object p0, p0, Lzg;->b:Ljava/lang/Object;

    check-cast p0, Lqln;

    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final h(I)V
    .registers 5

    iget-object v0, p0, Lenn;->a:Lzg;

    iget-object v0, v0, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v1, v0, Lqln;->l:Lqs7;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x0

    sput-object v1, Lqs7;->p:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lqln;->o(Z)V

    invoke-static {p1}, Lam2;->c(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lqln;->n(Ljava/lang/String;)V

    iget-object p1, v0, Lqln;->o:Lagm;

    invoke-virtual {p1}, Lagm;->p()Z

    move-result v2

    if-eqz v2, :cond_32

    iput-boolean v1, v0, Lqln;->r:Z

    invoke-virtual {v0}, Lqln;->i()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lagm;->n(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, v0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "wallpaper_current"

    invoke-virtual {v0, v1, p1}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    :cond_32
    iget-object p0, p0, Lenn;->b:Lpg5;

    invoke-virtual {p0}, Ldej;->b()V

    return-void
.end method

.method public final n(Laln;)V
    .registers 2

    return-void
.end method
