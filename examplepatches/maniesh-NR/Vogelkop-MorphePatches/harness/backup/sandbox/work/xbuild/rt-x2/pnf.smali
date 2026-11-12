.class public final synthetic Lpnf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:F

.field public final synthetic b:Lc8e;

.field public final synthetic c:J

.field public final synthetic d:J

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(FLc8e;JJI)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lpnf;->a:F

    iput-object p2, p0, Lpnf;->b:Lc8e;

    iput-wide p3, p0, Lpnf;->c:J

    iput-wide p5, p0, Lpnf;->d:J

    iput p7, p0, Lpnf;->e:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    move-object v6, p1

    check-cast v6, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p1, p0, Lpnf;->e:I

    or-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Laoh;->m(I)I

    move-result v7

    iget v0, p0, Lpnf;->a:F

    iget-object v1, p0, Lpnf;->b:Lc8e;

    iget-wide v2, p0, Lpnf;->c:J

    iget-wide v4, p0, Lpnf;->d:J

    invoke-static/range {v0 .. v7}, Lrnf;->a(FLc8e;JJLih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
