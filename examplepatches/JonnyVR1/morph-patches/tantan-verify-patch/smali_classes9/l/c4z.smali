.class public final synthetic Ll/c4z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/n4z;


# direct methods
.method public synthetic constructor <init>(Ll/n4z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c4z;->a:Ll/n4z;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c4z;->a:Ll/n4z;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0, p1}, Ll/n4z;->j0(Ll/n4z;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
