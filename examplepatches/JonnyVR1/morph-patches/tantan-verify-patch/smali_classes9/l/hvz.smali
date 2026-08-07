.class public final synthetic Ll/hvz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tvz;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hvz;->a:Ll/tvz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hvz;->a:Ll/tvz;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0, p1}, Ll/tvz;->b8(Ll/tvz;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
