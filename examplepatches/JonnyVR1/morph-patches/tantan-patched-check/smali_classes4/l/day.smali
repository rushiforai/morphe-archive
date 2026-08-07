.class public final synthetic Ll/day;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/fay;


# direct methods
.method public synthetic constructor <init>(Ll/fay;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/day;->a:Ll/fay;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/day;->a:Ll/fay;

    check-cast p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    invoke-static {p0, p1}, Ll/fay;->b(Ll/fay;Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;)Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    move-result-object p0

    return-object p0
.end method
