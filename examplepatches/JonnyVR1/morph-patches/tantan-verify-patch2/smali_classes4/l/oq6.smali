.class public final synthetic Ll/oq6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oq6;->a:Ljava/util/List;

    iput-boolean p2, p0, Ll/oq6;->b:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oq6;->a:Ljava/util/List;

    iget-boolean p0, p0, Ll/oq6;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->v0(Ljava/util/List;Z)V

    return-void
.end method
