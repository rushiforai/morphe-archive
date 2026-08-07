.class public final synthetic Ll/k95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/ex3;


# direct methods
.method public synthetic constructor <init>(Ll/ex3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k95;->a:Ll/ex3;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k95;->a:Ll/ex3;

    invoke-static {p0}, Lcom/clevertap/android/sdk/CleverTapFactory;->h(Ll/ex3;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
