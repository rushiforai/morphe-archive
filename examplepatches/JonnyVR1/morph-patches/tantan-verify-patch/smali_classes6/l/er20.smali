.class public final synthetic Ll/er20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jr20;


# direct methods
.method public synthetic constructor <init>(Ll/jr20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/er20;->a:Ll/jr20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/er20;->a:Ll/jr20;

    invoke-static {p0}, Ll/jr20;->b(Ll/jr20;)V

    return-void
.end method
