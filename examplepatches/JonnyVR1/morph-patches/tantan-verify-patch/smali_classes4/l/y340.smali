.class public final synthetic Ll/y340;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y340;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iput p2, p0, Ll/y340;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y340;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iget p0, p0, Ll/y340;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/b;->J(Lcom/p1/mobile/putong/core/newui/home/b;I)V

    return-void
.end method
