.class public final synthetic Ll/uhb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lkotlin/jvm/internal/Ref$BooleanRef;


# direct methods
.method public synthetic constructor <init>(ILkotlin/jvm/internal/Ref$BooleanRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/uhb0;->a:I

    iput-object p2, p0, Ll/uhb0;->b:Lkotlin/jvm/internal/Ref$BooleanRef;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/uhb0;->a:I

    iget-object p0, p0, Ll/uhb0;->b:Lkotlin/jvm/internal/Ref$BooleanRef;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {v0, p0, p1}, Ll/vhb0;->d(ILkotlin/jvm/internal/Ref$BooleanRef;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method
