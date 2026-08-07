.class public final synthetic Ll/p9p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/r9p;


# direct methods
.method public synthetic constructor <init>(Ll/r9p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p9p;->a:Ll/r9p;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9p;->a:Ll/r9p;

    invoke-static {p0}, Ll/r9p$a;->c(Ll/r9p;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
