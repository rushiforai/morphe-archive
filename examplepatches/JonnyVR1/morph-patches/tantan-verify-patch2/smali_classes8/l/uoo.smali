.class public final synthetic Ll/uoo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/apo;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DbLinks;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/apo;Lcom/p1/mobile/putong/data/DbLinks;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uoo;->a:Ll/apo;

    iput-object p2, p0, Ll/uoo;->b:Lcom/p1/mobile/putong/data/DbLinks;

    iput p3, p0, Ll/uoo;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uoo;->a:Ll/apo;

    iget-object v1, p0, Ll/uoo;->b:Lcom/p1/mobile/putong/data/DbLinks;

    iget p0, p0, Ll/uoo;->c:I

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/apo;->F0(Ll/apo;Lcom/p1/mobile/putong/data/DbLinks;ILjava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
