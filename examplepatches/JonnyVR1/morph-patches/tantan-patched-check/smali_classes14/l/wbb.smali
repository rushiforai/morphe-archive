.class public final synthetic Ll/wbb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/dcb;


# direct methods
.method public synthetic constructor <init>(Ll/dcb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wbb;->a:Ll/dcb;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wbb;->a:Ll/dcb;

    check-cast p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogBean;

    invoke-static {p0, p1}, Ll/dcb;->d3(Ll/dcb;Lcom/p1/mobile/putong/core/data/MigrateAwardDialogBean;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
