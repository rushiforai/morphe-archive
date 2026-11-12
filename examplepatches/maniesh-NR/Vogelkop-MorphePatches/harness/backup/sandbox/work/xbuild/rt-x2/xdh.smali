.class public final Lxdh;
.super Lo63;
.source "SourceFile"


# instance fields
.field public final f:Lqdh;

.field public final g:Lskm;


# direct methods
.method public constructor <init>(Lqdh;Lskm;)V
    .registers 3

    invoke-direct {p0}, Lo63;-><init>()V

    iput-object p1, p0, Lxdh;->f:Lqdh;

    iput-object p2, p0, Lxdh;->g:Lskm;

    return-void
.end method


# virtual methods
.method public final h(Lhq8;)V
    .registers 11

    if-eqz p1, :cond_4a

    instance-of v0, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-eqz v0, :cond_1e

    check-cast p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object v0, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object v1, p0, Lxdh;->f:Lqdh;

    invoke-virtual {v1, v0}, Lqdh;->b(Ltqi;)V

    iget-object v3, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-static {p1}, Lsfe;->W(Lhq8;)Lfr;

    move-result-object v4

    const-wide/16 v5, 0x0

    const/4 v7, 0x1

    iget-object v2, p0, Lxdh;->g:Lskm;

    invoke-static/range {v2 .. v7}, Lsfe;->u0(Lskm;Ltqi;Lfr;JI)V

    return-void

    :cond_1e
    instance-of v0, p1, Lkdh;

    if-eqz v0, :cond_4a

    check-cast p1, Lkdh;

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_2b
    :goto_2b
    if-ge v1, v0, :cond_4a

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhq8;

    instance-of v3, v2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-eqz v3, :cond_2b

    check-cast v2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object v4, v2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-static {v2}, Lsfe;->W(Lhq8;)Lfr;

    move-result-object v5

    const-wide/16 v6, 0x0

    const/4 v8, 0x5

    iget-object v3, p0, Lxdh;->g:Lskm;

    invoke-static/range {v3 .. v8}, Lsfe;->u0(Lskm;Ltqi;Lfr;JI)V

    goto :goto_2b

    :cond_4a
    return-void
.end method
