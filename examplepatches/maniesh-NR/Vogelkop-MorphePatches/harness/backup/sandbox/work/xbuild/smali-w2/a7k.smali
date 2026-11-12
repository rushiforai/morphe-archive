.class public final La7k;
.super Lv5k;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lq8k;


# static fields
.field public static final m:Ljava/util/List;


# instance fields
.field public final d:Landroid/content/Context;

.field public final e:Lcom/opera/android/settings/SettingsManager;

.field public final f:Lu8k;

.field public final g:Lpde;

.field public final h:Ltsd;

.field public final i:Lmgh;

.field public final j:Lp6l;

.field public final k:Lo4b;

.field public final l:Lqzg;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Le6k;->h:Le6k;

    sget-object v1, Le6k;->i:Le6k;

    filled-new-array {v0, v1}, [Le6k;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, La7k;->m:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lijc;Lcom/opera/android/settings/SettingsManager;Lu8k;Lpde;Ltsd;Lmgh;Lp6l;)V
    .registers 12

    sget-object v0, Le6k;->c:Le6k;

    const v1, 0x7f0d03c0

    const-class v2, Lx6k;

    invoke-direct {p0, v2, p2, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p1, p0, La7k;->d:Landroid/content/Context;

    iput-object p3, p0, La7k;->e:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, La7k;->f:Lu8k;

    iput-object p5, p0, La7k;->g:Lpde;

    iput-object p6, p0, La7k;->h:Ltsd;

    iput-object p7, p0, La7k;->i:Lmgh;

    iput-object p8, p0, La7k;->j:Lp6l;

    new-instance p1, Lo4b;

    const/16 p2, 0xa

    invoke-direct {p1, p0, v0, p2}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p1, p0, La7k;->k:Lo4b;

    new-instance p1, Lqzg;

    const/16 p2, 0x11

    invoke-direct {p1, p0, p2}, Lqzg;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, La7k;->l:Lqzg;

    invoke-virtual {p3, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p2, p4, Lu8k;->g:Li7f;

    invoke-virtual {p2, p0}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p6, p1}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 6

    new-instance v0, Lz6k;

    const v1, 0x7f0d03c0

    const/4 v2, 0x0

    invoke-static {p1, v1, p1, v2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f0a0621

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_2d

    new-instance v1, Lb7k;

    check-cast p1, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-direct {v1, v2, p1, v3}, Lb7k;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iget-object p1, p0, La7k;->k:Lo4b;

    iget-object p1, p1, Lk6k;->c:Lpde;

    new-instance v2, Ldnj;

    const/16 v3, 0xb

    invoke-direct {v2, p0, v3}, Ldnj;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, La7k;->g:Lpde;

    invoke-direct {v0, v1, p1, p0, v2}, Lz6k;-><init>(Lb7k;Lpde;Lpde;Ldnj;)V

    return-object v0

    :cond_2d
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "enable_start_page_opera_logo"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Lu5k;->A()V

    :cond_b
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, La7k;->e:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, La7k;->f:Lu8k;

    iget-object v0, v0, Lu8k;->g:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, La7k;->h:Ltsd;

    iget-object p0, p0, La7k;->l:Lqzg;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Lx6k;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, La7k;->k:Lo4b;

    return-object p0
.end method

.method public final z()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method
