.class public final synthetic Lna1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Lc8e;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;

.field public final synthetic c:Z

.field public final synthetic d:B


# direct methods
.method public synthetic constructor <init>(Lc8e;Lkotlin/jvm/functions/Function0;ZI)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lna1;->a:Lc8e;

    iput-object p2, p0, Lna1;->b:Lkotlin/jvm/functions/Function0;

    iput-boolean p3, p0, Lna1;->c:Z

    iput-byte p4, p0, Lna1;->d:B

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-byte p2, p0, Lna1;->d:B

    or-int/lit8 p2, p2, 0x1

    invoke-static {p2}, Laoh;->m(I)I

    move-result p2

    iget-object v0, p0, Lna1;->a:Lc8e;

    iget-object v1, p0, Lna1;->b:Lkotlin/jvm/functions/Function0;

    iget-boolean p0, p0, Lna1;->c:Z

    invoke-static {p2, p1, v0, v1, p0}, Lscd;->i(ILih5;Lc8e;Lkotlin/jvm/functions/Function0;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
