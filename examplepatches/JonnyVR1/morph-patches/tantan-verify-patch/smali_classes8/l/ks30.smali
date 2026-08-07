.class public final synthetic Ll/ks30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ms30;


# direct methods
.method public synthetic constructor <init>(Ll/ms30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ks30;->a:Ll/ms30;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ks30;->a:Ll/ms30;

    invoke-static {p0}, Ll/ms30;->b(Ll/ms30;)Ll/ms30$a;

    move-result-object p0

    return-object p0
.end method
