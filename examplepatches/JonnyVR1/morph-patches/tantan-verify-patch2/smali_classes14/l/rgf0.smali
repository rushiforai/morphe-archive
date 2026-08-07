.class public final synthetic Ll/rgf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zif0;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;


# direct methods
.method public synthetic constructor <init>(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rgf0;->a:Ll/zif0;

    iput-object p2, p0, Ll/rgf0;->b:Ll/x20;

    iput-object p3, p0, Ll/rgf0;->c:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rgf0;->a:Ll/zif0;

    iget-object v1, p0, Ll/rgf0;->b:Ll/x20;

    iget-object p0, p0, Ll/rgf0;->c:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;

    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    invoke-static {v0, v1, p0, p1}, Ll/zif0;->N(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Lcom/p1/mobile/putong/data/Gender;)V

    return-void
.end method
