.class public final synthetic Ll/jpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jpk;->a:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

    iput-object p2, p0, Ll/jpk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jpk;->a:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

    iget-object p0, p0, Ll/jpk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->a(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    return-object p0
.end method
