.class public final synthetic Ll/hbf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/SignInData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/SignInData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hbf0;->a:Lcom/p1/mobile/putong/data/SignInData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hbf0;->a:Lcom/p1/mobile/putong/data/SignInData;

    invoke-static {p0}, Ll/ibf0;->m0(Lcom/p1/mobile/putong/data/SignInData;)V

    return-void
.end method
