.class public final synthetic Ll/sv60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wv60;


# direct methods
.method public synthetic constructor <init>(Ll/wv60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sv60;->a:Ll/wv60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sv60;->a:Ll/wv60;

    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    invoke-static {p0, p1}, Ll/wv60;->k0(Ll/wv60;Lcom/p1/mobile/putong/data/ConversationStatus;)V

    return-void
.end method
