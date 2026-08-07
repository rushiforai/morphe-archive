.class public final synthetic Ll/vpr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xpr;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/reflect/Method;

.field public final synthetic d:[Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ll/xpr;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vpr;->a:Ll/xpr;

    iput-object p2, p0, Ll/vpr;->b:Ljava/lang/Object;

    iput-object p3, p0, Ll/vpr;->c:Ljava/lang/reflect/Method;

    iput-object p4, p0, Ll/vpr;->d:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vpr;->a:Ll/xpr;

    iget-object v1, p0, Ll/vpr;->b:Ljava/lang/Object;

    iget-object v2, p0, Ll/vpr;->c:Ljava/lang/reflect/Method;

    iget-object p0, p0, Ll/vpr;->d:[Ljava/lang/Object;

    invoke-static {v0, v1, v2, p0}, Ll/xpr;->a(Ll/xpr;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V

    return-void
.end method
