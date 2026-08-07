.class public final synthetic Ll/lfi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Picture;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lfi0;->a:Lcom/p1/mobile/putong/data/Picture;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfi0;->a:Lcom/p1/mobile/putong/data/Picture;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/bgi0;->X(Lcom/p1/mobile/putong/data/Picture;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
