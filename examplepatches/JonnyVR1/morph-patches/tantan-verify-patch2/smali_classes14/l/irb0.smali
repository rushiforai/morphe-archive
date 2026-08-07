.class public final synthetic Ll/irb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/app/PutongAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/irb0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/irb0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->I1(Lcom/p1/mobile/putong/app/PutongAct;Landroid/os/Bundle;)V

    return-void
.end method
