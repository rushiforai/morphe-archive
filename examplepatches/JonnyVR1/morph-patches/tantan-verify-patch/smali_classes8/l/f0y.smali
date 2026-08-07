.class public final synthetic Ll/f0y;
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

    iput-object p1, p0, Ll/f0y;->a:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f0y;->a:Lcom/p1/mobile/putong/data/Media;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {p0, p1}, Ll/r0y;->o0(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
