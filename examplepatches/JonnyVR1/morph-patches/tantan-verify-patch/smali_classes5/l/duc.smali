.class public final synthetic Ll/duc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/CounterLikeLimit;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/duc;->a:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    iput-object p2, p0, Ll/duc;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p3, p0, Ll/duc;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/duc;->a:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    iget-object v1, p0, Ll/duc;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v2, p0, Ll/duc;->c:Lcom/p1/mobile/putong/data/User;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/util/DebugUtil;->y0(Lcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
