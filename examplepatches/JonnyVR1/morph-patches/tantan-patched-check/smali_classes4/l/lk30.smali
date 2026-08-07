.class public final synthetic Ll/lk30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mk30;


# direct methods
.method public synthetic constructor <init>(Ll/mk30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lk30;->a:Ll/mk30;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lk30;->a:Ll/mk30;

    check-cast p1, Lcom/p1/mobile/putong/data/DbLinks;

    invoke-static {p0, p1}, Ll/mk30;->f(Ll/mk30;Lcom/p1/mobile/putong/data/DbLinks;)V

    return-void
.end method
