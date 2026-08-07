.class public final synthetic Ll/kr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ms8;

.field public final synthetic b:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/ms8;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kr8;->a:Ll/ms8;

    iput-object p2, p0, Ll/kr8;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    iput-object p3, p0, Ll/kr8;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/kr8;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kr8;->a:Ll/ms8;

    iget-object v1, p0, Ll/kr8;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    iget-object v2, p0, Ll/kr8;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/kr8;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0}, Ll/ms8;->G0(Ll/ms8;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;Ll/y20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
