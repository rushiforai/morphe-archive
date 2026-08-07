.class public final synthetic Ll/qw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qw3;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qw3;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/clevertap/android/sdk/f;->a(Landroid/content/Context;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
