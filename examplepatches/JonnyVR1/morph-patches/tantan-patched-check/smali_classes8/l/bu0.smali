.class public final synthetic Ll/bu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/ro0;

.field public final synthetic c:Ljava/lang/ref/WeakReference;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/ro0;Ljava/lang/ref/WeakReference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bu0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/bu0;->b:Ll/ro0;

    iput-object p3, p0, Ll/bu0;->c:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bu0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/bu0;->b:Ll/ro0;

    iget-object p0, p0, Ll/bu0;->c:Ljava/lang/ref/WeakReference;

    check-cast p1, Ll/fye;

    invoke-static {v0, v1, p0, p1}, Ll/du0;->a(Ljava/lang/String;Ll/ro0;Ljava/lang/ref/WeakReference;Ll/fye;)V

    return-void
.end method
