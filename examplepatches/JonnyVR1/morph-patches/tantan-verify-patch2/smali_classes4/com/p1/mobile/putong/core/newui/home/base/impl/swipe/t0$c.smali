.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->z(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jl80;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;Ll/jl80;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$c;->b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$c;->a:Ll/jl80;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$c;->a:Ll/jl80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
