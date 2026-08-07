.class public final synthetic Ll/yj00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/nk00;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/nk00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yj00;->a:Ll/nk00;

    iput-object p2, p0, Ll/yj00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p3, p0, Ll/yj00;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yj00;->a:Ll/nk00;

    iget-object v1, p0, Ll/yj00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object p0, p0, Ll/yj00;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/nk00;->s(Ll/nk00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    return-void
.end method
