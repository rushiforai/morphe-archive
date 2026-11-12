.class public final synthetic Lka1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Lk9f;

.field public final synthetic b:Z

.field public final synthetic c:Lhyh;

.field public final synthetic d:Z

.field public final synthetic e:J

.field public final synthetic f:F

.field public final synthetic g:Lc8e;


# direct methods
.method public synthetic constructor <init>(Lk9f;ZLhyh;ZJFLc8e;I)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lka1;->a:Lk9f;

    iput-boolean p2, p0, Lka1;->b:Z

    iput-object p3, p0, Lka1;->c:Lhyh;

    iput-boolean p4, p0, Lka1;->d:Z

    iput-wide p5, p0, Lka1;->e:J

    iput p7, p0, Lka1;->f:F

    iput-object p8, p0, Lka1;->g:Lc8e;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    move-object v8, p1

    check-cast v8, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 p1, 0x31

    invoke-static {p1}, Laoh;->m(I)I

    move-result v9

    iget-object v0, p0, Lka1;->a:Lk9f;

    iget-boolean v1, p0, Lka1;->b:Z

    iget-object v2, p0, Lka1;->c:Lhyh;

    iget-boolean v3, p0, Lka1;->d:Z

    iget-wide v4, p0, Lka1;->e:J

    iget v6, p0, Lka1;->f:F

    iget-object v7, p0, Lka1;->g:Lc8e;

    invoke-static/range {v0 .. v9}, Lscd;->h(Lk9f;ZLhyh;ZJFLc8e;Lih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
