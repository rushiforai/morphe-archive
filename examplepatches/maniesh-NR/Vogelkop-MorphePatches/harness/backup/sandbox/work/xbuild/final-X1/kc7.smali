.class public final synthetic Lkc7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Lc8e;

.field public final synthetic b:F

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lc8e;FJI)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkc7;->a:Lc8e;

    iput p2, p0, Lkc7;->b:F

    iput-wide p3, p0, Lkc7;->c:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    move-object v4, p1

    check-cast v4, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x7

    invoke-static {p1}, Laoh;->m(I)I

    move-result v5

    iget-object v0, p0, Lkc7;->a:Lc8e;

    iget v1, p0, Lkc7;->b:F

    iget-wide v2, p0, Lkc7;->c:J

    invoke-static/range {v0 .. v5}, Lscd;->j(Lc8e;FJLih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
