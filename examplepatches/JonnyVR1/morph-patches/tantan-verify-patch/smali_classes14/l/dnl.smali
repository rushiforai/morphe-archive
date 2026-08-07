.class public final synthetic Ll/dnl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/enl;


# direct methods
.method public synthetic constructor <init>(Ll/enl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dnl;->a:Ll/enl;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dnl;->a:Ll/enl;

    invoke-static {p0}, Ll/enl;->b(Ll/enl;)[B

    move-result-object p0

    return-object p0
.end method
