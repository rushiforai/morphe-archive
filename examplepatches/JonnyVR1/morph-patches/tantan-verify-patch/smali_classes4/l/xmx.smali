.class public final synthetic Ll/xmx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/enx;


# direct methods
.method public synthetic constructor <init>(Ll/enx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xmx;->a:Ll/enx;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xmx;->a:Ll/enx;

    invoke-static {p0}, Ll/enx;->O0(Ll/enx;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
