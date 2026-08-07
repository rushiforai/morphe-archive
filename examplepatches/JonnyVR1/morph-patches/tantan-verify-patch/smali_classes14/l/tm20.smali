.class public final synthetic Ll/tm20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ym20$a;


# direct methods
.method public synthetic constructor <init>(Ll/ym20$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tm20;->a:Ll/ym20$a;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tm20;->a:Ll/ym20$a;

    invoke-static {p0}, Ll/ym20$a;->d(Ll/ym20$a;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
