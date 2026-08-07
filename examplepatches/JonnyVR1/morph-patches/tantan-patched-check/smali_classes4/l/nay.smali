.class public final synthetic Ll/nay;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bby;


# direct methods
.method public synthetic constructor <init>(Ll/bby;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nay;->a:Ll/bby;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nay;->a:Ll/bby;

    invoke-static {p0}, Ll/bby;->p(Ll/bby;)V

    return-void
.end method
