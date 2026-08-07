.class public final synthetic Ll/rji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/vji;


# direct methods
.method public synthetic constructor <init>(Ll/vji;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rji;->a:Ll/vji;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rji;->a:Ll/vji;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/vji;->b(Ll/vji;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
