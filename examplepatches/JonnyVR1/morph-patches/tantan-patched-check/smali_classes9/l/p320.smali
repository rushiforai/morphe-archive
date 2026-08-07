.class public final synthetic Ll/p320;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Literatures;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Literatures;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p320;->a:Lcom/p1/mobile/putong/core/data/Literatures;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p320;->a:Lcom/p1/mobile/putong/core/data/Literatures;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    invoke-static {p0, p1}, Ll/q320;->E(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
