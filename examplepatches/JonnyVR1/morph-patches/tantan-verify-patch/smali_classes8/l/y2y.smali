.class public final synthetic Ll/y2y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/b3y;


# direct methods
.method public synthetic constructor <init>(Ll/b3y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y2y;->a:Ll/b3y;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y2y;->a:Ll/b3y;

    invoke-static {p0}, Ll/b3y;->b(Ll/b3y;)V

    return-void
.end method
