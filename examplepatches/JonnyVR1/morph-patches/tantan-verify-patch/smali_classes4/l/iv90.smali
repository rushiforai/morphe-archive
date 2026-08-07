.class public final synthetic Ll/iv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iv90;->a:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iv90;->a:Lcom/p1/mobile/putong/data/Media;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/aw90;->n(Lcom/p1/mobile/putong/data/Media;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
