.class public final synthetic Ll/kuc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Ljava/lang/reflect/Method;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/reflect/Method;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kuc0;->a:Ljava/lang/reflect/Method;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kuc0;->a:Ljava/lang/reflect/Method;

    check-cast p2, [Ljava/lang/Object;

    invoke-static {p0, p1, p2}, Lorg/joor/Reflect;->e(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Lorg/joor/Reflect;

    move-result-object p0

    return-object p0
.end method
