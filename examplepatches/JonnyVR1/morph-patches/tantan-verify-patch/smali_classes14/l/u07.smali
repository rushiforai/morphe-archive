.class public final synthetic Ll/u07;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/a17;


# direct methods
.method public synthetic constructor <init>(Ll/a17;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u07;->a:Ll/a17;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u07;->a:Ll/a17;

    check-cast p1, Lcom/p1/mobile/putong/data/ConversationCounter;

    invoke-static {p0, p1}, Ll/a17;->d(Ll/a17;Lcom/p1/mobile/putong/data/ConversationCounter;)V

    return-void
.end method
