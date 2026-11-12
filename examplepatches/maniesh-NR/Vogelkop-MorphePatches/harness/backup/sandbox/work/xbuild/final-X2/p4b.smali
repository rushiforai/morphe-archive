.class public final Lp4b;
.super Lv5k;
.source "SourceFile"


# static fields
.field public static final i:Ljava/util/List;


# instance fields
.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Lgjm;

.field public final f:Lpde;

.field public final g:Lo4b;

.field public final h:Lagm;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Le6k;->h:Le6k;

    sget-object v1, Le6k;->i:Le6k;

    sget-object v2, Le6k;->c:Le6k;

    filled-new-array {v0, v1, v2}, [Le6k;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lp4b;->i:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lgjm;Lijc;Lpde;)V
    .registers 8

    sget-object v0, Le6k;->k:Le6k;

    const v1, 0x7f0d021a

    const-class v2, Ln4b;

    invoke-direct {p0, v2, p3, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p1, p0, Lp4b;->d:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lp4b;->e:Lgjm;

    iput-object p4, p0, Lp4b;->f:Lpde;

    new-instance p1, Lo4b;

    const/4 p2, 0x0

    invoke-direct {p1, p0, v0, p2}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p1, p0, Lp4b;->g:Lo4b;

    new-instance p1, Lagm;

    new-instance p2, Lal7;

    const/16 p3, 0x1d

    invoke-direct {p2, p0, p3}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lp4b;->h:Lagm;

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Lp4b;->h:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Ln4b;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Lp4b;->g:Lo4b;

    return-object p0
.end method
