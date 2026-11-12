.class public final Ls5k;
.super Lv5k;
.source "SourceFile"

# interfaces
.implements Lq8k;


# static fields
.field public static final h:Ljxh;


# instance fields
.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Lu8k;

.field public final f:Lo4b;

.field public final g:Lagm;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljxh;

    const v1, 0x7f07096f

    invoke-direct {v0, v1}, Ljxh;-><init>(I)V

    sput-object v0, Ls5k;->h:Ljxh;

    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lijc;Lu8k;)V
    .registers 7

    sget-object v0, Le6k;->p:Le6k;

    const v1, 0x7f0d03b9

    const-class v2, Lq5k;

    invoke-direct {p0, v2, p2, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p1, p0, Ls5k;->d:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p3, p0, Ls5k;->e:Lu8k;

    new-instance p1, Lo4b;

    const/4 p2, 0x5

    invoke-direct {p1, p0, v0, p2}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p1, p0, Ls5k;->f:Lo4b;

    new-instance p1, Lagm;

    new-instance p2, Ldnj;

    const/4 v0, 0x7

    invoke-direct {p2, p0, v0}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Ls5k;->g:Lagm;

    iget-object p1, p3, Lu8k;->g:Li7f;

    invoke-virtual {p1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Ls5k;->g:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Ls5k;->e:Lu8k;

    iget-object v0, v0, Lu8k;->g:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Lq5k;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Ls5k;->f:Lo4b;

    return-object p0
.end method

.method public final z()Z
    .registers 1

    iget-object p0, p0, Ls5k;->e:Lu8k;

    invoke-virtual {p0}, Lu8k;->b()Lt8k;

    move-result-object p0

    iget-boolean p0, p0, Lt8k;->a:Z

    return p0
.end method
