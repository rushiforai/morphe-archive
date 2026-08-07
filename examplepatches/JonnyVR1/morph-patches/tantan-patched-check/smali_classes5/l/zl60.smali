.class public final synthetic Ll/zl60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/im60;


# direct methods
.method public synthetic constructor <init>(Ll/im60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zl60;->a:Ll/im60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zl60;->a:Ll/im60;

    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    invoke-static {p0, p1}, Ll/im60;->p(Ll/im60;Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method
