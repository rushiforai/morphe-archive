.class public final synthetic Ll/r550;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d650;


# direct methods
.method public synthetic constructor <init>(Ll/d650;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r550;->a:Ll/d650;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r550;->a:Ll/d650;

    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    invoke-static {p0, p1}, Ll/d650;->G(Ll/d650;Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method
