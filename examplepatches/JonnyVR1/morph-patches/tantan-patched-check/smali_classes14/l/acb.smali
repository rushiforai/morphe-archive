.class public final synthetic Ll/acb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/dcb;


# direct methods
.method public synthetic constructor <init>(ZLl/dcb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/acb;->a:Z

    iput-object p2, p0, Ll/acb;->b:Ll/dcb;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/acb;->a:Z

    iget-object p0, p0, Ll/acb;->b:Ll/dcb;

    check-cast p1, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayDataBean;

    invoke-static {v0, p0, p1}, Ll/dcb;->e3(ZLl/dcb;Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayDataBean;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
