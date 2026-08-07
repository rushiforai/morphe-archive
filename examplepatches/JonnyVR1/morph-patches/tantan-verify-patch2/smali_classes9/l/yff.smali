.class public final synthetic Ll/yff;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yff;->a:Ljava/util/List;

    iput-object p2, p0, Ll/yff;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yff;->a:Ljava/util/List;

    iget-object p0, p0, Ll/yff;->b:Ljava/util/HashMap;

    check-cast p1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHomeTown;->a(Ljava/util/List;Ljava/util/HashMap;Lcom/p1/mobile/putong/core/data/HometownChinaItem;)V

    return-void
.end method
