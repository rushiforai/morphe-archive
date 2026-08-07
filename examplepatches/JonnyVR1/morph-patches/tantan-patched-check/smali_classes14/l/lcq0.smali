.class public final synthetic Ll/lcq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ccq0$e;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lcq0;->a:Ll/ccq0$e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lcq0;->a:Ll/ccq0$e;

    invoke-static {p0}, Ll/ccq0$e;->b(Ll/ccq0$e;)V

    return-void
.end method
