.class public final synthetic Ll/z8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/f9e$a;


# direct methods
.method public synthetic constructor <init>(Ll/f9e$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z8e;->a:Ll/f9e$a;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8e;->a:Ll/f9e$a;

    invoke-static {p0}, Ll/f9e;->d(Ll/f9e$a;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
