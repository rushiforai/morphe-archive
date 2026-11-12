.class public final Laff;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:Lxkn;

.field public final synthetic u:Ljava/util/Map;

.field public final synthetic v:Lagm;

.field public final synthetic w:Lo2c;

.field public final synthetic x:Lafe;

.field public final synthetic y:J

.field public final synthetic z:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Lxkn;Ljava/util/Map;Lagm;Lo2c;Lafe;JLjava/lang/Integer;Lmt5;)V
    .registers 10

    iput-object p1, p0, Laff;->t:Lxkn;

    iput-object p2, p0, Laff;->u:Ljava/util/Map;

    iput-object p3, p0, Laff;->v:Lagm;

    iput-object p4, p0, Laff;->w:Lo2c;

    iput-object p5, p0, Laff;->x:Lafe;

    iput-wide p6, p0, Laff;->y:J

    iput-object p8, p0, Laff;->z:Ljava/lang/Integer;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p9}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 13

    new-instance v0, Laff;

    iget-wide v6, p0, Laff;->y:J

    iget-object v8, p0, Laff;->z:Ljava/lang/Integer;

    iget-object v1, p0, Laff;->t:Lxkn;

    iget-object v2, p0, Laff;->u:Ljava/util/Map;

    iget-object v3, p0, Laff;->v:Lagm;

    iget-object v4, p0, Laff;->w:Lo2c;

    iget-object v5, p0, Laff;->x:Lafe;

    move-object v9, p2

    invoke-direct/range {v0 .. v9}, Laff;-><init>(Lxkn;Ljava/util/Map;Lagm;Lo2c;Lafe;JLjava/lang/Integer;Lmt5;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Laff;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Laff;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Laff;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Laff;->t:Lxkn;

    iget-object v0, p1, Lxkn;->c:Ljava/lang/String;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Laff;->u:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2f

    new-instance v0, Lza;

    const/4 v7, 0x1

    iget-object v1, p0, Laff;->x:Lafe;

    iget-object v2, p0, Laff;->u:Ljava/util/Map;

    iget-object v3, p0, Laff;->t:Lxkn;

    iget-wide v4, p0, Laff;->y:J

    iget-object v6, p0, Laff;->z:Ljava/lang/Integer;

    invoke-direct/range {v0 .. v7}, Lza;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;B)V

    iget-object p1, p0, Laff;->w:Lo2c;

    new-instance v1, Lqjn;

    iget-object p0, p0, Laff;->v:Lagm;

    invoke-direct {v1, p0, v3, v0, p1}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_2f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
