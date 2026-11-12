.class public final Ly5k;
.super Lv5k;
.source "SourceFile"


# instance fields
.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Lo4b;

.field public final f:Lagm;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lijc;)V
    .registers 6

    sget-object v0, Le6k;->u:Le6k;

    const v1, 0x7f0d03ba

    const-class v2, Lw5k;

    invoke-direct {p0, v2, p2, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p1, p0, Ly5k;->d:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p1, Lo4b;

    const/4 p2, 0x6

    invoke-direct {p1, p0, v0, p2}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p1, p0, Ly5k;->e:Lo4b;

    new-instance p1, Lagm;

    new-instance p2, Ldnj;

    const/16 v0, 0x8

    invoke-direct {p2, p0, v0}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Ly5k;->f:Lagm;

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Ly5k;->f:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Lw5k;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Ly5k;->e:Lo4b;

    return-object p0
.end method

.method public final z()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method
