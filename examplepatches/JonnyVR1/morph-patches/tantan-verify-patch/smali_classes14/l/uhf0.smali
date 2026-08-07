.class public final synthetic Ll/uhf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zif0;

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;


# direct methods
.method public synthetic constructor <init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uhf0;->a:Ll/zif0;

    iput-object p2, p0, Ll/uhf0;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uhf0;->a:Ll/zif0;

    iget-object p0, p0, Ll/uhf0;->b:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;

    check-cast p1, Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;

    invoke-static {v0, p0, p1}, Ll/zif0;->e0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;)V

    return-void
.end method
