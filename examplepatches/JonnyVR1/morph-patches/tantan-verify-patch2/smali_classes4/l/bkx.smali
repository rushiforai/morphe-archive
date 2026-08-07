.class public final synthetic Ll/bkx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ikx;


# direct methods
.method public synthetic constructor <init>(Ll/ikx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bkx;->a:Ll/ikx;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkx;->a:Ll/ikx;

    invoke-static {p0}, Ll/ikx;->F0(Ll/ikx;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
