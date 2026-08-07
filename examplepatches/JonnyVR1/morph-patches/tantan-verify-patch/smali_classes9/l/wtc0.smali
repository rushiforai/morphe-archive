.class public final synthetic Ll/wtc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ztc0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ztc0;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wtc0;->a:Ll/ztc0;

    iput-object p2, p0, Ll/wtc0;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/wtc0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wtc0;->a:Ll/ztc0;

    iget-object v1, p0, Ll/wtc0;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/wtc0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/ztc0;->i(Ll/ztc0;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
