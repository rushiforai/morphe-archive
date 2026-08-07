.class public final synthetic Ll/bee0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Ll/dee0;

.field public final synthetic b:I

.field public final synthetic c:Lkotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Ll/dee0;ILkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bee0;->a:Ll/dee0;

    iput p2, p0, Ll/bee0;->b:I

    iput-object p3, p0, Ll/bee0;->c:Lkotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bee0;->a:Ll/dee0;

    iget v1, p0, Ll/bee0;->b:I

    iget-object v2, p0, Ll/bee0;->c:Lkotlin/jvm/internal/Ref$ObjectRef;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    move-object v4, p2

    check-cast v4, Lcom/p1/mobile/putong/core/ui/purchase/d;

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-static/range {v0 .. v5}, Ll/dee0;->z(Ll/dee0;ILkotlin/jvm/internal/Ref$ObjectRef;ZLcom/p1/mobile/putong/core/ui/purchase/d;Z)V

    return-void
.end method
