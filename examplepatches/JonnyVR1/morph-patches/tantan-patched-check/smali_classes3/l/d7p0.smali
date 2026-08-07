.class public final synthetic Ll/d7p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e7p0;


# direct methods
.method public synthetic constructor <init>(Ll/e7p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d7p0;->a:Ll/e7p0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d7p0;->a:Ll/e7p0;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/e7p0;->l4(Ll/e7p0;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
