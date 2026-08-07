.class public final synthetic Ll/r4j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/newui/main/base/TabName;

.field public final synthetic c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r4j;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/r4j;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    iput-object p3, p0, Ll/r4j;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r4j;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/r4j;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    iget-object p0, p0, Ll/r4j;->c:Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1, p0}, Ll/t4j;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
