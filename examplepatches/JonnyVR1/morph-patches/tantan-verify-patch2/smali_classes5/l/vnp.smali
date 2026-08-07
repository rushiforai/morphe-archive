.class public final synthetic Ll/vnp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aop;


# direct methods
.method public synthetic constructor <init>(Ll/aop;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vnp;->a:Ll/aop;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vnp;->a:Ll/aop;

    invoke-static {p0}, Ll/aop;->b(Ll/aop;)V

    return-void
.end method
