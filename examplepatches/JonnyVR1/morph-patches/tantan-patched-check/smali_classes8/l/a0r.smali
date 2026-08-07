.class public final synthetic Ll/a0r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a0r;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    iput-object p2, p0, Ll/a0r;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a0r;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    iget-object p0, p0, Ll/a0r;->b:Ljava/util/ArrayList;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->t(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method
