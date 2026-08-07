.class public final synthetic Ll/y8y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/noy0;


# direct methods
.method public synthetic constructor <init>(Ll/noy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y8y0;->a:Ll/noy0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/y8y0;->a:Ll/noy0;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    const-string v1, "Service disconnected"

    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Ll/noy0;->a(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
