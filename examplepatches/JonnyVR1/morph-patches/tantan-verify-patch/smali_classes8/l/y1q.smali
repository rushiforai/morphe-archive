.class public final synthetic Ll/y1q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/NewTags;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/NewTags;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y1q;->a:Lcom/p1/mobile/putong/core/data/NewTags;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y1q;->a:Lcom/p1/mobile/putong/core/data/NewTags;

    check-cast p1, Lcom/p1/mobile/putong/core/data/NewTags;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->w(Lcom/p1/mobile/putong/core/data/NewTags;Lcom/p1/mobile/putong/core/data/NewTags;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
