.class public final synthetic Ll/s8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u8j;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/u8j;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s8j;->a:Ll/u8j;

    iput-object p2, p0, Ll/s8j;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s8j;->a:Ll/u8j;

    iget-object p0, p0, Ll/s8j;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    invoke-static {v0, p0, p1}, Ll/u8j;->h(Ll/u8j;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)V

    return-void
.end method
