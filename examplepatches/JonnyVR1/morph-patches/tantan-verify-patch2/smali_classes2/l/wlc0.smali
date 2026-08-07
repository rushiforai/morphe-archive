.class public final synthetic Ll/wlc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/xlc0;


# direct methods
.method public synthetic constructor <init>(Ll/xlc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wlc0;->a:Ll/xlc0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wlc0;->a:Ll/xlc0;

    check-cast p1, Ljava/util/HashMap;

    invoke-static {p0, p1}, Ll/xlc0;->b(Ll/xlc0;Ljava/util/HashMap;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
