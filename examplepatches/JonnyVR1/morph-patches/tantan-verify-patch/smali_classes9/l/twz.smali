.class public final synthetic Ll/twz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yxz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/EmojiAnimData;


# direct methods
.method public synthetic constructor <init>(Ll/yxz;Lcom/p1/mobile/putong/core/data/EmojiAnimData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/twz;->a:Ll/yxz;

    iput-object p2, p0, Ll/twz;->b:Lcom/p1/mobile/putong/core/data/EmojiAnimData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/twz;->a:Ll/yxz;

    iget-object p0, p0, Ll/twz;->b:Lcom/p1/mobile/putong/core/data/EmojiAnimData;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/yxz;->H2(Ll/yxz;Lcom/p1/mobile/putong/core/data/EmojiAnimData;Ll/pf60;)V

    return-void
.end method
