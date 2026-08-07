.class public final synthetic Ll/mcb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Lkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mcb0;->a:Ll/x20;

    iput-object p2, p0, Ll/mcb0;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mcb0;->a:Ll/x20;

    iget-object p0, p0, Ll/mcb0;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->c(Ll/x20;Lkotlin/jvm/internal/Ref$ObjectRef;)V

    return-void
.end method
