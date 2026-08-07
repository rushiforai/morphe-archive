.class public final synthetic Ll/pk30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mk30$e;


# direct methods
.method public synthetic constructor <init>(Ll/mk30$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pk30;->a:Ll/mk30$e;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk30;->a:Ll/mk30$e;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0, p1}, Ll/mk30$e;->G(Ll/mk30$e;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
