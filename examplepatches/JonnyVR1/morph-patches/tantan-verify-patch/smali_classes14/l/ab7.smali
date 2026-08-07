.class public final synthetic Ll/ab7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/x0m;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/x0m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ab7;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/ab7;->b:Ll/x0m;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ab7;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/ab7;->b:Ll/x0m;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/buzz/module/CoreBuzzInnerServiceImpl;->F(Ljava/lang/String;Ll/x0m;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
