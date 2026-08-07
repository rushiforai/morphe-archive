.class public final synthetic Ll/stj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/qtj0;


# direct methods
.method public synthetic constructor <init>(Ll/qtj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/stj0;->a:Ll/qtj0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/stj0;->a:Ll/qtj0;

    invoke-static {p0}, Ll/qtj0$c;->b(Ll/qtj0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
