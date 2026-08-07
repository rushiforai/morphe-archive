.class public final synthetic Ll/cr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cr8;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cr8;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {p0}, Ll/ms8;->w0(Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
