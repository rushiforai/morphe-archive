.class public final synthetic Ll/xua0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yua0;


# direct methods
.method public synthetic constructor <init>(Ll/yua0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xua0;->a:Ll/yua0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xua0;->a:Ll/yua0;

    invoke-static {p0}, Ll/yua0;->b(Ll/yua0;)V

    return-void
.end method
