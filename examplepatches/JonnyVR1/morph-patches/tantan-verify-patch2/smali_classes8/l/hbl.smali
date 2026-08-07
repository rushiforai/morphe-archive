.class public final synthetic Ll/hbl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ibl;


# direct methods
.method public synthetic constructor <init>(Ll/ibl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hbl;->a:Ll/ibl;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hbl;->a:Ll/ibl;

    invoke-static {p0}, Ll/ibl;->h(Ll/ibl;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
