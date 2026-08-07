.class public final synthetic Ll/pbk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

.field public final synthetic b:I

.field public final synthetic c:Ll/w6c0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;ILl/w6c0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pbk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    iput p2, p0, Ll/pbk;->b:I

    iput-object p3, p0, Ll/pbk;->c:Ll/w6c0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pbk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    iget v1, p0, Ll/pbk;->b:I

    iget-object p0, p0, Ll/pbk;->c:Ll/w6c0;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;ILl/w6c0;Ljava/lang/Integer;)V

    return-void
.end method
