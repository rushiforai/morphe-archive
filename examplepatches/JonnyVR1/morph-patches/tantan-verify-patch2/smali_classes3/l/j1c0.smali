.class public final synthetic Ll/j1c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j1c0;->a:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j1c0;->a:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->a(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
