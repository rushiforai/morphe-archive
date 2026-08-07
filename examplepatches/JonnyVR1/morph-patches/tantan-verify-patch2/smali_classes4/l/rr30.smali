.class public final synthetic Ll/rr30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ur30;


# direct methods
.method public synthetic constructor <init>(Ll/ur30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rr30;->a:Ll/ur30;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rr30;->a:Ll/ur30;

    invoke-static {p0}, Ll/ur30;->G(Ll/ur30;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
