.class public final synthetic Ll/zh60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bi60;


# direct methods
.method public synthetic constructor <init>(Ll/bi60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zh60;->a:Ll/bi60;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zh60;->a:Ll/bi60;

    invoke-static {p0}, Ll/bi60;->b(Ll/bi60;)V

    return-void
.end method
