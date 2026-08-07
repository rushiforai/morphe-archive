.class public final synthetic Ll/yc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/reflect/Method;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/reflect/Method;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yc00;->a:Ljava/lang/reflect/Method;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yc00;->a:Ljava/lang/reflect/Method;

    invoke-static {p0}, Ll/zc00;->a(Ljava/lang/reflect/Method;)V

    return-void
.end method
