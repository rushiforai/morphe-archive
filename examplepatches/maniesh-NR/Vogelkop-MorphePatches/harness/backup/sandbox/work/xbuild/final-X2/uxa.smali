.class public final synthetic Luxa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Lhyf;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lc8e;

.field public final synthetic d:Ltd3;

.field public final synthetic e:Lkr5;

.field public final synthetic f:F

.field public final synthetic g:Lkh3;

.field public final synthetic h:I

.field public final synthetic i:B


# direct methods
.method public synthetic constructor <init>(Lhyf;Ljava/lang/String;Lc8e;Ltd3;Lkr5;FLkh3;II)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luxa;->a:Lhyf;

    iput-object p2, p0, Luxa;->b:Ljava/lang/String;

    iput-object p3, p0, Luxa;->c:Lc8e;

    iput-object p4, p0, Luxa;->d:Ltd3;

    iput-object p5, p0, Luxa;->e:Lkr5;

    iput p6, p0, Luxa;->f:F

    iput-object p7, p0, Luxa;->g:Lkh3;

    iput p8, p0, Luxa;->h:I

    iput-byte p9, p0, Luxa;->i:B

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    move-object v7, p1

    check-cast v7, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p1, p0, Luxa;->h:I

    or-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Laoh;->m(I)I

    move-result v8

    iget-object v0, p0, Luxa;->a:Lhyf;

    iget-object v1, p0, Luxa;->b:Ljava/lang/String;

    iget-object v2, p0, Luxa;->c:Lc8e;

    iget-object v3, p0, Luxa;->d:Ltd3;

    iget-object v4, p0, Luxa;->e:Lkr5;

    iget v5, p0, Luxa;->f:F

    iget-object v6, p0, Luxa;->g:Lkh3;

    iget-byte v9, p0, Luxa;->i:B

    invoke-static/range {v0 .. v9}, Lxf8;->j(Lhyf;Ljava/lang/String;Lc8e;Ltd3;Lkr5;FLkh3;Lih5;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
