.class public final Lwoj;
.super Ldx4;
.source "SourceFile"


# instance fields
.field public final g:I

.field public final h:I

.field public final i:Lkotlin/jvm/functions/Function2;


# direct methods
.method public constructor <init>(IIILkotlin/jvm/functions/Function2;)V
    .registers 5

    invoke-direct {p0, p1}, Ldx4;-><init>(I)V

    iput p2, p0, Lwoj;->g:I

    iput p3, p0, Lwoj;->h:I

    iput-object p4, p0, Lwoj;->i:Lkotlin/jvm/functions/Function2;

    return-void
.end method


# virtual methods
.method public final h(Lr6j;I)Lr6j;
    .registers 10

    new-instance v2, Lx6j;

    const-class v0, Lqoj;

    iget-object v1, p0, Lwoj;->i:Lkotlin/jvm/functions/Function2;

    invoke-direct {v2, v0, v1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    const/4 v5, 0x0

    const/16 v6, 0x20

    iget v3, p0, Lwoj;->g:I

    iget v4, p0, Lwoj;->h:I

    move-object v0, p1

    move v1, p2

    invoke-static/range {v0 .. v6}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object p0

    return-object p0
.end method
