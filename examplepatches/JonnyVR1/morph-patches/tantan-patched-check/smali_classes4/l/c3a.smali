.class public final synthetic Ll/c3a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c3a;->a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c3a;->a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->K()V

    return-void
.end method
