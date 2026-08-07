.class public final synthetic Ll/nx00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rx00;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Ll/rx00;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nx00;->a:Ll/rx00;

    iput-object p2, p0, Ll/nx00;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nx00;->a:Ll/rx00;

    iget-object p0, p0, Ll/nx00;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    check-cast p1, Ll/vg60;

    invoke-static {v0, p0, p1}, Ll/rx00;->E(Ll/rx00;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/vg60;)V

    return-void
.end method
