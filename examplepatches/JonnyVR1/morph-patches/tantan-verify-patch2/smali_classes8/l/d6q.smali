.class public final synthetic Ll/d6q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d6q;->a:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    iput-object p2, p0, Ll/d6q;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d6q;->a:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    iget-object p0, p0, Ll/d6q;->b:Ljava/lang/String;

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->u(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;Ll/bkj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
