.class public final synthetic Ll/op2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/sp2;


# direct methods
.method public synthetic constructor <init>(Ll/sp2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/op2;->a:Ll/sp2;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/op2;->a:Ll/sp2;

    invoke-static {p0}, Ll/sp2;->o0(Ll/sp2;)Ljava/lang/Runnable;

    move-result-object p0

    return-object p0
.end method
