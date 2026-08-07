.class public final synthetic Ll/im00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/im00;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/im00;->a:I

    check-cast p1, Lcom/p1/mobile/putong/data/PartialIdList;

    invoke-static {p0, p1}, Ll/zm00;->o0(ILcom/p1/mobile/putong/data/PartialIdList;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
