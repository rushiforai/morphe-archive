.class public final synthetic Lqnf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Lc8e;

.field public final synthetic d:J

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(IILc8e;JJI)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lqnf;->a:I

    iput p2, p0, Lqnf;->b:I

    iput-object p3, p0, Lqnf;->c:Lc8e;

    iput-wide p4, p0, Lqnf;->d:J

    iput-wide p6, p0, Lqnf;->e:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    move-object v7, p1

    check-cast v7, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x1

    invoke-static {p1}, Laoh;->m(I)I

    move-result v8

    iget v0, p0, Lqnf;->a:I

    iget v1, p0, Lqnf;->b:I

    iget-object v2, p0, Lqnf;->c:Lc8e;

    iget-wide v3, p0, Lqnf;->d:J

    iget-wide v5, p0, Lqnf;->e:J

    invoke-static/range {v0 .. v8}, Lrnf;->b(IILc8e;JJLih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
