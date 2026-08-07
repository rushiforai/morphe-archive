.class public final synthetic Ll/jbj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mbj;


# direct methods
.method public synthetic constructor <init>(Ll/mbj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jbj;->a:Ll/mbj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbj;->a:Ll/mbj;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/mbj;->a(Ll/mbj;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
