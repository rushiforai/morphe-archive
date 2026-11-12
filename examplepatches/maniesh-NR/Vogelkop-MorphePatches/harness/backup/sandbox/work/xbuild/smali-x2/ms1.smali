.class public final Lms1;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public c:Lc7j;

.field public d:Lc7j;

.field public final e:Lnak;

.field public final f:Lrlh;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;)V
    .registers 4

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lms1;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lc7j;->values()[Lc7j;

    move-result-object v0

    const-string v1, "app_font"

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p1

    aget-object p1, v0, p1

    iput-object p1, p0, Lms1;->c:Lc7j;

    iput-object p1, p0, Lms1;->d:Lc7j;

    invoke-virtual {p0}, Lms1;->f()Lks1;

    move-result-object p1

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Lms1;->e:Lnak;

    invoke-static {p1}, La26;->j(Lnak;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lms1;->f:Lrlh;

    return-void
.end method


# virtual methods
.method public final f()Lks1;
    .registers 9

    sget-object v0, Lls1;->a:Lh58;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :goto_11
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2f

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc7j;

    new-instance v5, Ljs1;

    iget v6, v2, Lc7j;->a:I

    iget-object v7, p0, Lms1;->d:Lc7j;

    if-ne v2, v7, :cond_28

    move v3, v4

    :cond_28
    invoke-direct {v5, v2, v6, v3}, Ljs1;-><init>(Lc7j;IZ)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_2f
    iget-object v0, p0, Lms1;->d:Lc7j;

    iget-object p0, p0, Lms1;->c:Lc7j;

    if-eq v0, p0, :cond_36

    move v3, v4

    :cond_36
    new-instance p0, Lks1;

    invoke-direct {p0, v1, v3}, Lks1;-><init>(Ljava/util/ArrayList;Z)V

    return-object p0
.end method
