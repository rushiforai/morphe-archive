.class public final synthetic Ll/m930;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m930;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m930;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    check-cast p1, Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->t2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0
.end method
