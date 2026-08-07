.class public final synthetic Ll/dw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pw;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Ll/pw;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dw;->a:Ll/pw;

    iput-object p2, p0, Ll/dw;->b:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dw;->a:Ll/pw;

    iget-object p0, p0, Ll/dw;->b:Lcom/p1/mobile/putong/data/SignUpData;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/pw;->k(Ll/pw;Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
