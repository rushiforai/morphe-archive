.class public final synthetic Ll/kho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/kho;->a:Z

    iput-object p2, p0, Ll/kho;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/kho;->a:Z

    iget-object p0, p0, Ll/kho;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0}, Ll/uho;->m0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
