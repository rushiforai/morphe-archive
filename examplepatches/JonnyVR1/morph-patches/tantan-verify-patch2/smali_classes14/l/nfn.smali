.class public final synthetic Ll/nfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ofn;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/intl/feedback/upload/a;


# direct methods
.method public synthetic constructor <init>(Ll/ofn;Lcom/p1/mobile/putong/live/external/intl/feedback/upload/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nfn;->a:Ll/ofn;

    iput-object p2, p0, Ll/nfn;->b:Lcom/p1/mobile/putong/live/external/intl/feedback/upload/a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nfn;->a:Ll/ofn;

    iget-object p0, p0, Ll/nfn;->b:Lcom/p1/mobile/putong/live/external/intl/feedback/upload/a;

    invoke-static {v0, p0, p1}, Ll/ofn;->b(Ll/ofn;Lcom/p1/mobile/putong/live/external/intl/feedback/upload/a;Landroid/view/View;)V

    return-void
.end method
