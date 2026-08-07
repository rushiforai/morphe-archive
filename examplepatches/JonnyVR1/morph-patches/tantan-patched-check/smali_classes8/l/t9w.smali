.class public final synthetic Ll/t9w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function0;

.field public final synthetic b:Ll/haw;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;Ll/haw;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t9w;->a:Lkotlin/jvm/functions/Function0;

    iput-object p2, p0, Ll/t9w;->b:Ll/haw;

    iput-object p3, p0, Ll/t9w;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t9w;->a:Lkotlin/jvm/functions/Function0;

    iget-object v1, p0, Ll/t9w;->b:Ll/haw;

    iget-object p0, p0, Ll/t9w;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    invoke-static {v0, v1, p0, p1}, Ll/haw;->M(Lkotlin/jvm/functions/Function0;Ll/haw;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LoveBuzzData;)V

    return-void
.end method
