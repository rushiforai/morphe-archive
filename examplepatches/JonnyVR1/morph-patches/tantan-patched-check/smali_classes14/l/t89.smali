.class public final synthetic Ll/t89;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lkotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t89;->a:Lkotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t89;->a:Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/m;->i3(Lkotlin/jvm/internal/Ref$ObjectRef;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
