.class public final Ljy8;
.super Lty8;
.source "SourceFile"


# instance fields
.field public final o:Ljava/lang/String;

.field public final p:Ljava/lang/String;

.field public final q:I


# direct methods
.method public constructor <init>(Lorb;)V
    .registers 4

    const-string v0, "play"

    invoke-direct {p0, p1, v0}, Lty8;-><init>(Lorb;Ljava/lang/String;)V

    const-string v0, "play_mode"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljy8;->o:Ljava/lang/String;

    const-string v0, "fail_info"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljy8;->p:Ljava/lang/String;

    const-string v0, "duration"

    invoke-virtual {p1, v0}, Lorb;->g(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Ljy8;->q:I

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 4

    invoke-super {p0, p1}, Lty8;->a(Lorb;)V

    const-string v0, "play_mode"

    iget-object v1, p0, Ljy8;->o:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Ljy8;->p:Ljava/lang/String;

    if-eqz v0, :cond_13

    const-string v1, "fail_info"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_13
    const-string v0, "duration"

    iget p0, p0, Ljy8;->q:I

    invoke-virtual {p1, p0, v0}, Lorb;->n(ILjava/lang/String;)V

    return-void
.end method
