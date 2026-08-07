.class public final synthetic Ll/yyj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Ll/p0k0$a;

.field public final synthetic c:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yyj0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/yyj0;->b:Ll/p0k0$a;

    iput-object p3, p0, Ll/yyj0;->c:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yyj0;->a:Ll/p0k0;

    iget-object v1, p0, Ll/yyj0;->b:Ll/p0k0$a;

    iget-object p0, p0, Ll/yyj0;->c:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    check-cast p1, Ll/p0k0$b;

    invoke-static {v0, v1, p0, p1}, Ll/p0k0;->O(Ll/p0k0;Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
