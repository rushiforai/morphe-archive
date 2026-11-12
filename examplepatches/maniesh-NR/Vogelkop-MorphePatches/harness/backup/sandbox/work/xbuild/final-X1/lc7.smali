.class public final synthetic Llc7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Lc8e;

.field public final synthetic b:F

.field public final synthetic c:J

.field public final synthetic d:B

.field public final synthetic e:B


# direct methods
.method public synthetic constructor <init>(Lc8e;FJII)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llc7;->a:Lc8e;

    iput p2, p0, Llc7;->b:F

    iput-wide p3, p0, Llc7;->c:J

    iput-byte p5, p0, Llc7;->d:B

    iput-byte p6, p0, Llc7;->e:B

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    move-object v4, p1

    check-cast v4, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-byte p1, p0, Llc7;->d:B

    or-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Laoh;->m(I)I

    move-result v5

    iget-object v0, p0, Llc7;->a:Lc8e;

    iget v1, p0, Llc7;->b:F

    iget-wide v2, p0, Llc7;->c:J

    iget-byte v6, p0, Llc7;->e:B

    invoke-static/range {v0 .. v6}, Lscd;->d(Lc8e;FJLih5;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
