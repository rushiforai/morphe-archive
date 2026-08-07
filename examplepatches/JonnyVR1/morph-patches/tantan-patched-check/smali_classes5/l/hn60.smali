.class public final synthetic Ll/hn60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/l5;


# direct methods
.method public synthetic constructor <init>(ZLl/l5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/hn60;->a:Z

    iput-object p2, p0, Ll/hn60;->b:Ll/l5;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/hn60;->a:Z

    iget-object p0, p0, Ll/hn60;->b:Ll/l5;

    invoke-static {v0, p0}, Ll/in60;->c(ZLl/l5;)V

    return-void
.end method
