.class public final synthetic Ll/g6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/data/request/AbsTarget;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/library/svga/data/request/AbsTarget;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g6;->a:Lcom/tantan/library/svga/data/request/AbsTarget;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g6;->a:Lcom/tantan/library/svga/data/request/AbsTarget;

    invoke-static {p0}, Lcom/tantan/library/svga/data/request/AbsTarget;->b(Lcom/tantan/library/svga/data/request/AbsTarget;)V

    return-void
.end method
