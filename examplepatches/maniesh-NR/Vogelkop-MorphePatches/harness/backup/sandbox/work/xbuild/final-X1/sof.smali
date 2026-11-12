.class public final Lsof;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lnzk;

.field public final c:Ljll;

.field public final d:Ljll;

.field public final e:Lnak;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lnzk;Ljll;Ljll;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsof;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lsof;->b:Lnzk;

    iput-object p3, p0, Lsof;->c:Ljll;

    iput-object p4, p0, Lsof;->d:Ljll;

    new-instance p1, Loof;

    sget-object p2, Lnof;->a:Lnof;

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3, p3, p3}, Loof;-><init>(Lnof;ZZZ)V

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Lsof;->e:Lnak;

    invoke-virtual {p0}, Lsof;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lsof;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v1

    iget-object v2, p0, Lsof;->b:Lnzk;

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->P(Lnzk;)Z

    move-result v0

    iget-object v2, p0, Lsof;->c:Ljll;

    invoke-virtual {v2}, Ljll;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    new-instance v3, Loof;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_58

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_25
    sget-object v1, Lnof;->e:Lnof;

    goto :goto_3f

    :pswitch_28
    sget-object v1, Lnof;->d:Lnof;

    goto :goto_3f

    :pswitch_2b
    sget-object v1, Lnof;->a:Lnof;

    goto :goto_3f

    :pswitch_2e
    sget-object v1, Lnof;->b:Lnof;

    goto :goto_3f

    :pswitch_31
    sget-object v1, Lnof;->c:Lnof;

    goto :goto_3f

    :pswitch_34
    sget-object v1, Lnof;->h:Lnof;

    goto :goto_3f

    :pswitch_37
    sget-object v1, Lnof;->i:Lnof;

    goto :goto_3f

    :pswitch_3a
    sget-object v1, Lnof;->g:Lnof;

    goto :goto_3f

    :pswitch_3d
    sget-object v1, Lnof;->f:Lnof;

    :goto_3f
    iget-object v4, p0, Lsof;->d:Ljll;

    invoke-virtual {v4}, Ljll;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-direct {v3, v1, v0, v2, v4}, Loof;-><init>(Lnof;ZZZ)V

    iget-object p0, p0, Lsof;->e:Lnak;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v3}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
        :pswitch_34
        :pswitch_31
        :pswitch_2e
        :pswitch_2b
        :pswitch_28
        :pswitch_25
    .end packed-switch
.end method
