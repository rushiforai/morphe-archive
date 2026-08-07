.class public final synthetic Ll/h7w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h7w;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/h7w;->b:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h7w;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/h7w;->b:Lkotlin/jvm/functions/Function0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, p0, p1}, Ll/d8w;->p(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
