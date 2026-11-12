.class public final synthetic Lbb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Lc8e;

.field public final synthetic b:Lw62;

.field public final synthetic c:Lz62;

.field public final synthetic d:Lsd3;

.field public final synthetic e:I

.field public final synthetic f:I

.field public final synthetic g:Lue5;

.field public final synthetic h:I

.field public final synthetic i:B


# direct methods
.method public synthetic constructor <init>(Lc8e;Lw62;Lz62;Lsd3;IILue5;II)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbb9;->a:Lc8e;

    iput-object p2, p0, Lbb9;->b:Lw62;

    iput-object p3, p0, Lbb9;->c:Lz62;

    iput-object p4, p0, Lbb9;->d:Lsd3;

    iput p5, p0, Lbb9;->e:I

    iput p6, p0, Lbb9;->f:I

    iput-object p7, p0, Lbb9;->g:Lue5;

    iput p8, p0, Lbb9;->h:I

    iput-byte p9, p0, Lbb9;->i:B

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    move-object v7, p1

    check-cast v7, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p1, p0, Lbb9;->h:I

    or-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Laoh;->m(I)I

    move-result v8

    iget-object v0, p0, Lbb9;->a:Lc8e;

    iget-object v1, p0, Lbb9;->b:Lw62;

    iget-object v2, p0, Lbb9;->c:Lz62;

    iget-object v3, p0, Lbb9;->d:Lsd3;

    iget v4, p0, Lbb9;->e:I

    iget v5, p0, Lbb9;->f:I

    iget-object v6, p0, Lbb9;->g:Lue5;

    iget-byte v9, p0, Lbb9;->i:B

    invoke-static/range {v0 .. v9}, Lp37;->d(Lc8e;Lw62;Lz62;Lsd3;IILue5;Lih5;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
