.class public final synthetic Ll/dza0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dza0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;

    iput-boolean p2, p0, Ll/dza0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dza0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;

    iget-boolean p0, p0, Ll/dza0;->b:Z

    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/String;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;ZLjava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method
